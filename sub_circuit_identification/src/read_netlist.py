# -*- coding: utf-8 -*-
"""
Created on Wed Oct 10 13:04:45 2018

@author: kunal
"""

# %% Parser

import networkx as nx
import os
import argparse
import logging

#import re
import matplotlib.pyplot as plt
from collections import defaultdict
import itertools as it
from BasicElement import BasicElement
from networkx.algorithms import bipartite

logging.basicConfig(filename='logfile.log', level=logging.DEBUG)

class spiceParser:
    def __init__(self, netlistPath, top_ckt_name='__top__', FLAT=0):
        self.netlist = netlistPath
        self.designTree = {}
        self.subckts = {}
        self.circuit_graph =nx.Graph()
        self.params = []
        self._global=[]
        self.option = []
        self.top_insts = []
        self.include = []
        self.nets = defaultdict(list)
        self.top_ckt_name = top_ckt_name
        self.FLAT=0
        logging.info('creating an instance of spiceParser')


    def sp_parser(self):
        if not os.path.isfile(self.netlist):
            print("File doesn't exist")
        else:
            print("File exist: ", self.netlist)
            fp = open(self.netlist, "r")
            line = fp.readline()
            while ".END" not in line:
                # if "**" in line.lower(): pass
                while line.strip().endswith('\\'):
                    #line.remove('\\')
                    line += fp.readline().strip()
                    #print(line)
                if any(c in line.lower() for c in ("//", "**")):
                    #line = fp.readline()
                    pass
                elif not line.strip():
                    pass
                elif "global" in line.lower():
                    self._parse_global (line,fp)
                elif ".temp" in line.lower():
                    temp_line = line
                elif ".option" in line.lower():
                    self._parse_option(line, fp)
                elif "subckt" in line.lower():
                    self._parse_subckt_info(line, fp)
                elif ".param" in line.lower():
                    self._parse_param(line, fp)
                elif "include" in line.lower() or "info" in line.lower():
                    self._parse_include(line, fp)
                    line = fp.readline()
                    continue
        
                else:
                    node1 = self._parse_inst(line)
                    if node1 != 'NULL':
                        self.top_insts.append(node1)
                line = fp.readline()
                if not line:
                    break
            print("PARSING FILE DONE")
            if self.params:
                self.params = filter(lambda a: a != '+', self.params)
                #print(" ".join(self.params))
            elif self.option:
                self.option = filter(lambda a: a != '+', self.option)
                #print(" ".join(self.option))
                #print("Printing parsed netlist")
            elif self._global:
                self._global = filter(lambda a: a != '+', self._global)


            if self.top_ckt_name == '__top__':
                logging.info('NO subckt defined')
                if not self.top_insts:
                    if self.subckts.keys():
                        self.top_ckt_name = list(self.subckts.keys())[0]
                    #logging.info('Found these sub ckt in design'+self.subckts.keys())
                        logging.info('No top instances found. Picking 1st cirucit as top: '+self.top_ckt_name)
                    else:
                        logging.info('No subckt found in design. Please check file format')
                        return 0
                else:
                    self.subckts["__top__"] = {"ports": "NULL",
                                       "nodes": self.top_insts}



            if self.FLAT:
                Design = self._flatten_circuit(self.top_ckt_name)
                #Design = self._flatten_circuit("__top__")
            else:
                Design = self._hier_circuit(self.top_ckt_name)

            #for subckt, elements in self.subckts.items():
            #    subckt_ports = ' '.join(elements["ports"])
                #print(subckt + ' ' + subckt_ports)
            #for element in elements["nodes"]:
            #    print(element)
            #for element in flatDesign:
                #print(element)
            subckt_ports=self.subckts[self.top_ckt_name]["ports"]

            self.circuit_graph = self._create_bipartite_circuit_graph(Design,subckt_ports)
            #self._show_circuit_graph("circuit", self.circuit_graph)
            return self.circuit_graph 
    def _parse_subckt_info(self, line, fp):
        logging.info('started reading subckt:line')
        line=line.replace(')',"").replace('(',"")
        subckt_nodes = line.strip().split()
        subckt_name = subckt_nodes[1]
        line = fp.readline()
        self.subckts[subckt_name] = {"ports": subckt_nodes[2:],
                                     "nodes": self._parse_subckt(line, fp)
                                     }
        logging.info('Finished reading subckt '+subckt_name)

    def _parse_subckt(self, line, fp):
        insts = []
        while "end" not in line.lower():
            if any(c in line.lower() for c in ("//", '*')):
                line = fp.readline()
                pass
            # print("subckt: ", line)
            node1 = self._parse_inst(line)
            if node1 != 'NULL':
                insts.append(node1)
            line = fp.readline()
            while line.strip().endswith('\\'):
                #line.remove('\\')
                line += fp.readline().strip()
                #print(line)
        return insts

    def _parse_param(self, line, fp):
        while line.strip():
            # print("param: ", line)
            self.params += line.strip().split()
            line = fp.readline()

    def _parse_global(self, line, fp):
        while line.strip():
            # print("param: ", line)
            self._global += line.strip().split()
            line = fp.readline()

    def _parse_include(self, line, fp):
        #print(line)
        self.include.append(line.strip())
        line = fp.readline()
            
    def _parse_option(self, line, fp):
        while line.strip():
            # print("option: ", line)
            self.option += line.strip().split()
            line = fp.readline()

    def _parse_inst(self, line):
        element = BasicElement(line)
        logging.info('READ line:'+line)
        device = "NULL"
        if line.strip().lower().startswith('m') or line.strip().lower().startswith('n') or line.strip().lower().startswith('p'):
            logging.info('FOUND transistor')
            #print("transistor:", line)
            device = element.Transistor()
        elif line.strip().lower().startswith('v'):
            logging.info('FOUND Vsource')
            #print("vsource:", line)
            device = element.Vsource()
        elif line.strip().lower().startswith('e'):
            logging.info('FOUND VCVSsource')
            #print("vsource:", line)
            device = element.VCVSsource()
        elif line.strip().lower().startswith('i'):
            logging.info('FOUND Isource')
            #print("Cur_source:", line)
            device = element.Isource()
        elif line.strip().lower().startswith('c'):
            logging.info('FOUND cap')
            #print("cap:", line)
            device = element.Capacitor()
        elif line.strip().lower().startswith('r'):
            logging.info('FOUND resistor')
            #print("resistance:", line)
            device = element.Resistor()
        elif line.strip().lower().startswith('x'):
            logging.info('FOUND subckt')
            if ' / ' in line:
                line = line.replace(' / ',' ')
            hier_nodes = line.strip().split()
            device = {"inst": hier_nodes[0][1:],
                      "inst_type": hier_nodes[-1],
                      "ports": hier_nodes[1:-1],
                      "edge_weight": list(range(len(hier_nodes[1:-1]))),
                      "values": "NULL"}
            #print("hier_Inst", line)
        else:
            return device
            print("not identified", line)
        return device

    def _flatten_circuit(self, subckt_name, subckt_inst=""):
        flatDesign = []
        print("flattening the circuits below "+subckt_name)
        for node in self.subckts[subckt_name]["nodes"]:
            if node["inst_type"] in self.subckts:
                flatDesign.extend(self._flatten_circuit(node["inst_type"],
                                      node["inst"]+'|')
                                )
            else:
                node["inst"] = subckt_inst+node["inst"]
                modified_ports = []
                for port in node["ports"]:
                    if port not in self.subckts[subckt_name]["ports"]:
                        port = subckt_inst+port
                    modified_ports.append(port)
                node["ports"] = modified_ports
                flatDesign.append(node)
        return flatDesign
    def _calc_edge_weight(self,subckt_name):
        edge_weight=[]
        for port in  self.subckts[subckt_name]["ports"]:
            weight =0
            for node in self.subckts[subckt_name]["nodes"]: 
                for i,sub_port in enumerate(node["ports"]):
                    if port == sub_port:
                        #print(sub_node)
                        weight +=  sub_node["edge_weight"][i]
            edge_weight.append(weight)

                    
    def _hier_circuit(self, subckt_name):
        hierDesign = []
        logging.info("making hierarchical circuits: "+subckt_name)
        for node in self.subckts[subckt_name]["nodes"]:
            if node["inst_type"] in self.subckts:
                logging.info("FOUND hier_node: "+node["inst_type"])
                #edge_weight =[]
                #for port in  node["ports"]:
                #    weight =0 
                #    for sub_node in self.subckts[node["inst_type"]]["nodes"]:
                #        #if sub_node["inst_type"] in self.subckts:
                #        #    hier_nodes_list = self._hier_circuit(node["inst_type"])
                #            
                #        #self._hier_circuit(sub_node["inst_type"])
                #        for i,sub_port in enumerate(sub_node["ports"]):
                #            if port == sub_port:
                #                #print(sub_node)
                #                weight +=  sub_node["edge_weight"][i]
                #    
                #    edge_weight.append(weight)
                hier_node = {"inst": node["inst"],
                      "inst_type": node["inst_type"],
                      "ports": node["ports"],
                      "values": "NULL",
                      "edge_weight" : node["edge_weight"],
                      "hier_nodes": self._hier_circuit(node["inst_type"])}
                hierDesign.append(hier_node)
            else:
                hierDesign.append(node)
        return hierDesign
    def _create_bipartite_circuit_graph(self, all_nodes,inout_ports):
        circuit_graph = nx.Graph()
        for node in all_nodes:
            if "hier_nodes" in node.keys():
                print("HIER NODE")
                subgraph = self._create_bipartite_circuit_graph(node["hier_nodes"],
                                                            self.subckts[node["inst_type"]]["ports"])
            else:
                subgraph="NULL"
            circuit_graph.add_node(node["inst"],
                                        inst_type=node["inst_type"],
                                        ports=node['ports'],
                                        edge_weight=node['edge_weight'],
                                        values=node['values'],
                                        sub_graph=subgraph
                                        )
            wt_index=0
            for net in node["ports"]:
                #if net not in ["0", "vdd!", "gnd!"]:
                if "edge_weight" in node.keys():
                    wt = node["edge_weight"][wt_index]
                else:
                    wt = 2^wt_index
                if net not in circuit_graph:
                    if net in inout_ports:
                        circuit_graph.add_node(net,inst_type="net", net_type="external")
                    else:
                        circuit_graph.add_node(net,inst_type="net", net_type="internal")
                elif circuit_graph.has_edge(node["inst"], net):
                    node_name = node["inst"]
                    wt += circuit_graph.get_edge_data(node_name, net)['weight']
                circuit_graph.add_edge(node["inst"], net,weight=wt)
                wt_index +=1
        return circuit_graph
        #return self.circuit_graph
    '''
    def _create_circuit_graph(self, all_nodes):
        for node in all_nodes:
            self.circuit_graph.add_node(node["inst"],
                                        inst_type=node["inst_type"])
            for net in node["ports"]:
                if net not in self.circuit_graph:
                    if net not in ["0", "vdd!", "gnd!"]:
                        self.circuit_graph.add_node(net,inst_type="net")    
                        self.circuit_graph.add_edge(node, net, name=net)
        return self.circuit_graph
    '''
    def _show_circuit_graph(self,filename, graph):
        print("Saving graph",filename) 
        print(graph)
        for subgraph in nx.connected_component_subgraphs(graph):
            color_map = []
            X, Y = bipartite.sets(subgraph)
            pos = dict()
            pos.update( (n, (1, i)) for i, n in enumerate(X) ) # put nodes from X at x=1
            pos.update( (n, (2, i)) for i, n in enumerate(Y) ) # put nodes from Y at x=2
            #nx.draw(B, pos=pos)
            #plt.show()
            plt.figure(figsize=(6, 8))
            for x, y in subgraph.nodes(data=True):
                if "sub_graph" in y:
                    if y["sub_graph"] != 'NULL':
                        logging.info("Found a sub_graph, plotting it first")
                        self._show_circuit_graph(filename+'_'+y["inst_type"], y["sub_graph"])

                if "inst_type" in y:
                    if y["inst_type"] == 'pmos':
                        color_map.append('red')
                    elif y["inst_type"] == 'nmos':
                        color_map.append('cyan')
                    elif y["inst_type"] == 'cap':
                        color_map.append('orange')
                    elif y["inst_type"] == 'net':
                        color_map.append('pink')
                    else:
                        color_map.append('green')
            nx.draw(subgraph, node_color=color_map,
                             with_labels=True,pos=pos)
            plt.title(filename,fontsize=20)
            #plt.show()
            #self._laplacian_matrix(subgraph)
            #nx.nx_pydot.write_dot(subgraph, filename+'.dot')
            if not os.path.exists("./graph_images"):
                os.mkdir("./graph_images")
            plt.savefig("./graph_images/"+filename+'.png')
            plt.close()
            logging.info("Plot saved in graph images directory")

    def _write_circuit_graph(self,filename, graph):
        if not os.path.exists("./circuit_graphs"):
            os.mkdir("./circuit_graphs")
        nx.write_yaml(graph,"./circuit_graphs/"+filename+".yaml")
        logging.info("Graph saved in circuit_graphs directory")

    def _laplacian_matrix(self, graph):
        L = nx.laplacian_matrix(graph, nodelist=None, weight='weight')
        print(L)



# %% all graphs
if __name__ == '__main__':
    # create logger with 'read_netlist'

    parser = argparse.ArgumentParser( description="directory path for input circuits")
    parser.add_argument( "-d", "--dir", type=str, default='../train_data')
    parser.add_argument( "-f", "--file", type=str, default='NULL')
    parser.add_argument( "-s", "--subckt", type=str, default='NULL')
    args = parser.parse_args()
    netlist_dir = args.dir
    if not os.path.isdir(netlist_dir):
        logging.info("Input dir doesn't exist. Please enter a valid dir path")
        print("Input dir doesn't exist. Please enter a valid dir path")

    netlist_files = os.listdir(netlist_dir)
    if len(netlist_files)==0:
        print("No spice files found in input_circuit directory. exiting")
        logging.info("No spice files found in input_circuit directory. exiting")
        exit(0)
    elif args.file != 'NULL':
        logging.info("Reading file"+args.file)
        netlist_files = [args.file]
    #output_dir ='train_nodes/'
    for netlist in netlist_files:
        print (netlist)
        #name = "switched_cap_filter"
        if  netlist.endswith('sp') or netlist.endswith('cdl') or args.file != 'NULL':
            logging.info("READING files in dir: "+netlist_dir)
            logging.info("READ file: "+netlist_dir+'/'+netlist)
            if args.subckt =='NULL':
                sp = spiceParser(netlist_dir+'/'+netlist)
            else:
                sp = spiceParser(netlist_dir+'/'+netlist, args.subckt)

            circuit_graph = sp.sp_parser()
            if circuit_graph:
                sp._show_circuit_graph( netlist.split('.')[0],circuit_graph)
                sp._write_circuit_graph( netlist.split('.')[0],circuit_graph)
        else:
            print("Not a valid file type (.sp/cdl).Skipping this file")
#            sp._laplacian_matrix(circuit_graph)
#            with open(output_dir+netlist+'.txt', 'w') as handle:
#                for node,attr in graph.nodes(data=True):
#                    handle.write("\n"+node+','+attr["inst_type"])

