//Verilog block level netlist file for comparator_4
//Generated by UMN for ALIGN project 


module comparator_4 ( nbias, vss, vin, vout, pbias, vcc, vip ); 
input nbias, vss, vin, vout, pbias, vcc, vip;

Switch_NMOS_n12_X3_Y1 mn1 ( .D(2), .G(1), .S(vss), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn10 ( .D(9), .G(7), .S(8), .Bg(vss) ); 
DCL_NMOS_n12_X3_Y1 mn11 ( .D(9), .S(8), .Bg(vss) ); 
DCL_NMOS_n12_X3_Y1 mn12 ( .D(11), .S(vss), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn13 ( .D(12), .G(11), .S(vss), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn14 ( .D(vout), .G(12), .S(vss), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn15 ( .D(5), .G(nbias), .S(vss), .Bg(vss) ); 
DCL_NMOS_n12_X3_Y1 mn2 ( .D(1), .S(vss), .Bg(vss) ); 
DCL_NMOS_n12_X3_Y1 mn3 ( .D(3), .S(vss), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn4 ( .D(4), .G(3), .S(vss), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn5 ( .D(4), .G(vip), .S(5), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn6 ( .D(2), .G(vin), .S(5), .Bg(vss) ); 
DCL_NMOS_n12_X2_Y2 mn7 ( .D(8), .S(vss), .Bg(vss) ); 
DCL_NMOS_n12_X3_Y1 mn8 ( .D(7), .S(8), .Bg(vss) ); 
Switch_NMOS_n12_X3_Y1 mn9 ( .D(7), .G(9), .S(8), .Bg(vss) ); 
DCL_PMOS_n12_X3_Y2 mp1 ( .D(4), .S(vcc), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp10 ( .D(11), .G(9), .S(10), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp11 ( .D(12), .G(7), .S(10), .Bg(vcc) ); 
Switch_PMOS_n12_X1_Y1 mp12 ( .D(vout), .G(12), .S(vcc), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp2 ( .D(7), .G(4), .S(vcc), .Bg(vcc) ); 
DCL_PMOS_n12_X3_Y2 mp3 ( .D(2), .S(vcc), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp4 ( .D(9), .G(2), .S(vcc), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp5 ( .D(10), .G(pbias), .S(vcc), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp6 ( .D(6), .G(pbias), .S(vcc), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp8 ( .D(1), .G(vip), .S(6), .Bg(vcc) ); 
Switch_PMOS_n12_X3_Y2 mp9 ( .D(3), .G(vin), .S(6), .Bg(vcc) ); 

endmodule