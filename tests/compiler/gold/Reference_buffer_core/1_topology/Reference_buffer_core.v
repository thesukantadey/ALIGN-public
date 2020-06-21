//Verilog block level netlist file for Reference_buffer_core
//Generated by UMN for ALIGN project 


module LSB_NMOS_2 ( B, DA, DB, DC, SA, SB, SC ); 
input B, DA, DB, DC, SA, SB, SC;

Switch_NMOS_n12_X1_Y1 M2 ( .B(B), .D(DC), .G(DA), .S(SC) ); 
LS_NMOS_n12_X1_Y1 M0_M1 ( .B(B), .DA(DA), .SA(SA), .DB(DB), .SB(SB) ); 

endmodule

module Reference_buffer_core ( vbias, vbiasp, vbiasp2, vref, vref_in ); 
input vbias, vbiasp, vbiasp2, vref, vref_in;

Dummy1_NMOS_n12_X1_Y1 xm97 ( .B(gnd), .S(net017) ); 
Switch_NMOS_n12_X1_Y1 xm104 ( .B(gnd), .D(vbiasp), .G(gnd), .S(net034) ); 
Dummy1_NMOS_n12_X1_Y1 xm103 ( .B(gnd), .S(gnd) ); 
Dummy1_NMOS_n12_X1_Y1 xm102 ( .B(gnd), .S(net036) ); 
Dummy1_NMOS_n12_X1_Y1 xm100 ( .B(gnd), .S(net017) ); 
Switch_NMOS_n12_X1_Y1 xm62 ( .B(gnd), .D(net034), .G(vdd), .S(gnd) ); 
Dummy1_NMOS_n12_X1_Y1 xm98 ( .B(gnd), .S(net034) ); 
Switch_NMOS_n12_X1_Y1 xm19 ( .B(gnd), .D(net017), .G(vdd), .S(gnd) ); 
Switch_NMOS_n12_X1_Y1 xm17 ( .B(gnd), .D(net036), .G(vdd), .S(gnd) ); 
Dummy_PMOS_n12_X1_Y1 xm115 ( .B(vdd), .D(net022), .S(vdd) ); 
Dummy1_PMOS_n12_X1_Y1 xm114 ( .B(vdd), .S(net029) ); 
Dummy1_PMOS_n12_X1_Y1 xm113 ( .B(vdd), .S(vref) ); 
DCL_PMOS_n12_X1_Y1 xm117 ( .B(vdd), .D(net061), .S(vdd) ); 
Dummy1_PMOS_n12_X1_Y1 xm112 ( .B(vdd), .S(net061) ); 
Dummy1_PMOS_n12_X1_Y1 xm108 ( .B(vdd), .S(vdd) ); 
Dummy_PMOS_n12_X1_Y1 xm110 ( .B(vdd), .D(net022), .S(vdd) ); 
Dummy1_PMOS_n12_X1_Y1 xm111 ( .B(vdd), .S(vdd) ); 
Dummy1_PMOS_n12_X1_Y1 xm107 ( .B(vdd), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 xm18 ( .B(vdd), .D(net022), .G(gnd), .S(vdd) ); 
Switch_PMOS_n12_X1_Y1 xm16 ( .B(vdd), .D(net029), .G(gnd), .S(vdd) ); 
Dcap_PMOS_n12_X1_Y1 xm118 ( .B(vdd), .S(vdd), .G(vbiasp) ); 
Switch_PMOS_n12_X1_Y1 xm99 ( .B(vdd), .D(net061), .G(net018), .S(net022) ); 
Dcap_PMOS_n12_X1_Y1 xm105 ( .B(vdd), .S(vdd), .G(net061) ); 
Switch_PMOS_n12_X1_Y1 xm9 ( .B(vdd), .D(vref), .G(vbiasp2), .S(net029) ); 
DCL_PMOS_n12_X1_Y1 xm116 ( .B(vdd), .D(vbiasp), .S(vdd) ); 
Reference_OTA xi12 ( .vbias(vbias), .vmir(net061), .vout(net018), .vref_in(vref_in) ); 
LSB_NMOS_2 xm66_xm64_xm7 ( .B(gnd), .DA(vbias), .SA(net034), .DB(vbiasp2), .SB(net036), .DC(vbiasp), .SC(net017) ); 
LS_PMOS_n12_X1_Y1 xm77_xm0 ( .B(vdd), .DA(vbiasp), .SA(net061), .DB(vbiasp2), .SB(vref) ); 

endmodule

module Reference_OTA ( vbias, vmir, vout, vref_in ); 
input vbias, vmir, vout, vref_in;

Dummy1_PMOS_n12_X1_Y1 xm2 ( .B(vdd), .S(vdd) ); 
Dummy1_NMOS_n12_X1_Y1 xm9 ( .B(gnd), .S(net012) ); 
Dummy1_NMOS_n12_X1_Y1 xm8 ( .B(gnd), .S(net7) ); 
Switch_NMOS_n12_X1_Y1 xm7 ( .B(gnd), .D(net7), .G(vbias), .S(net012) ); 
Switch_NMOS_n12_X1_Y1 xm62 ( .B(gnd), .D(net012), .G(vdd), .S(gnd) ); 
SCM_PMOS_n12_X1_Y1 xm5_xm0 ( .B(vdd), .DA(net8), .S(vdd), .DB(vout) ); 
DP_NMOS_n12_X1_Y1 xm4_xm1 ( .B(gnd), .DA(vout), .GA(vref_in), .S(net7), .DB(net8), .GB(vmir) ); 

endmodule

`celldefine
module global_power;
supply0 gnd;
supply1 vdd;
endmodule
`endcelldefine