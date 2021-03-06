#include "Router.h"
#include "spdlog/spdlog.h"

/*
Router::Router(PnRDB::hierNode& node, PnRDB::Drc_info& drcData, int Lmetal, int Hmetal, std::string binaryDIR) {
  this->GR=NULL;
  GlobalRouter GR2(node, drcData, Lmetal, Hmetal, binaryDIR);
  DetailRouter(node, GR2, 1, 1);
  
};
*/

void Router::RouteWork(int mode, PnRDB::hierNode& node, PnRDB::Drc_info& drcData, int Lmetal, int Hmetal, std::string binaryDIR, int h_skip_factor, int v_skip_factor, string inputfile) {
  //mode 0 global router, 1 detail router, 2 power grid router, 3 power net router, 4 gcell global router, 5 gcell detail router
  //mode 6 intel gcell global router

  auto logger = spdlog::default_logger()->clone("router.Router.RouteWork");

  if(mode==0) {
    logger->info("RouteWork {0}", mode);
    this->GR=new GlobalRouter(node, drcData, Lmetal, Hmetal, binaryDIR);
  } else if(mode==1){
    logger->info("RouteWork {0}", mode);
    DetailRouter(node, *(this->GR), 1, 1);
  } else if(mode==2){
    logger->info("Create power grid: {0}", node.name);
    PowerRouter(node, drcData, Lmetal, Hmetal, 1, h_skip_factor, v_skip_factor);  
  } else if(mode==3){
    logger->info("Power routing {0}", node.name);
    PowerRouter(node, drcData, Lmetal, Hmetal, 0, h_skip_factor, v_skip_factor);
  } else if(mode==4){
    logger->info("GcellGlobalRouter: {0}", node.name);
    this->GGR = new GcellGlobalRouter(node, drcData, Lmetal, Hmetal, binaryDIR);
  } else if(mode==5){
    logger->info("GcellDetailRouter: {0}", node.name);
    GcellDetailRouter(node, *(this->GGR), 1, 1);
  } else if(mode==6){
    logger->info("RouteWork {0}", mode);
    node.isIntelGcellGlobalRouter = true;
    this->GGR = new GcellGlobalRouter(node, drcData, Lmetal, Hmetal, binaryDIR);
  } else if(mode==7){ // this is for dc simulation
    logger->info("RouteWork {0}", mode);
    PowerRouter(node, drcData, Lmetal, Hmetal, 1, inputfile);  
  }
 
};
