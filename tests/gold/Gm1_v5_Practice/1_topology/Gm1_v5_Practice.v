//Verilog block level netlist file for Gm1_v5_Practice
//Generated by UMN for ALIGN project 


module CMB_PMOS_2 ( B, DA, DB, DC, S ); 
input B, DA, DB, DC, S;

Switch_PMOS_n12_X1_Y1 M2 ( .B(B), .D(DC), .G(DA), .S(S) ); 
SCM_PMOS_n12_X1_Y1 M0_M1 ( .B(B), .DA(DA), .S(S), .DB(DB) ); 

endmodule

module Gm1_v5_Practice ( ibias, vim, vip, vom, vop ); 
input ibias, vim, vip, vom, vop;

Switch_NMOS_n12_X1_Y1 m8 ( .B(vss), .D(net074), .G(ntail1), .S(vss) ); 
Dcap_PMOS_n12_X1_Y1 m2 ( .B(vdd), .S(vdd), .G(ibias) ); 
Res_100 r12 ( .PLUS(ntail1), .MINUS(vop) ); 
Res_100 r11 ( .PLUS(ntail1), .MINUS(vom) ); 
Dcap_NMOS_n12_X1_Y1 m3 ( .B(vss), .S(vss), .G(ntail1) ); 
CMB_PMOS_2 m12_m14_m11 ( .B(vdd), .DA(ibias), .S(vdd), .DB(vop), .DC(vom) ); 
DP_NMOS_n12_X1_Y1 m27_m26 ( .B(net074), .DA(vom), .GA(vip), .S(net074), .DB(vop), .GB(vim) ); 
Cap_cc c21_c22 ( .MINUS0(ntail1), .PLUS0(vom), .MINUS1(ntail1), .PLUS1(vop) ); 

endmodule

`celldefine
module global_power;
supply0 vss;
supply1 vdd;
endmodule
`endcelldefine
