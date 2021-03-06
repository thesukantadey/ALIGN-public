
.subckt Sanitized_TempSensor CFG<7> CFG<6> CFG<5> CFG<4> CFG<3> CFG<2> CFG<1> CFG<0> CFG<15> CFG<14> CKIN D<8> D<7> D<6> D<5> D<4> D<3> D<2> D<1> D<0> DONE PRESET AVDD AVSS
XI0 CFG<7> CFG<6> CFG<5> CFG<4> CFG<3> CFG<2> CFG<1> CFG<0> CFG<15> CFG<14> CKIN D<8> D<7> D<6> D<5> D<4> D<3> D<2> D<1> D<0> DONE PRESET AVDD AVSS TempSensorCore_Post_Copy
xMM1 AVSS AVDD AVSS Dcap_NMOS_n12_X1_Y1
xMM0 AVSS AVDD AVSS Dcap_NMOS_n12_X1_Y1
.ends Sanitized_TempSensor

.subckt Dcap_NMOS_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=12
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=12
.ends Dcap_NMOS_n12_X1_Y1

.subckt TempSensorCore_Post_Copy CFG<7> CFG<6> CFG<5> CFG<4> CFG<3> CFG<2> CFG<1> CFG<0> CFG<15> CFG<14> CKIN D<8> D<7> D<6> D<5> D<4> D<3> D<2> D<1> D<0> DONE PRESET
XI0 CKIN COMPEN net014 net013 PRESET QPHASE VDD VSS CK_DividerBy8
XI6 COMPEN D<8> D<7> D<6> D<5> D<4> D<3> D<2> D<1> D<0> DONE PRESET net024<0> net024<1> net024<2> net024<3> net024<4> net024<5> net024<6> net024<7> net024<8> net025<0> net025<1> net025<2> net025<3> net025<4> net025<5> net025<6> net025<7> net025<8> VDD VONL VOPL VSS SARLogic
XI8 net014 net023<0> net023<1> net023<2> net023<3> net023<4> net023<5> net023<6> net023<7> net013 net022<0> net022<1> net022<2> net022<3> net022<4> net022<5> net022<6> net022<7> CFG<7> CFG<6> CFG<5> CFG<4> CFG<3> CFG<2> CFG<1> CFG<0> VDD VSS ResTune_CFG
XI7 net019 QPHASE CFG<14> CFG<15> net010 net020 VDD VSS CrossingDetector
XI5 COMPEN PRESET VDD net019 net020 VONL VOPL VSS EdgeComparator
XI2 net023<0> net023<1> net023<2> net023<3> net023<4> net023<5> net023<6> net023<7> net022<0> net022<1> net022<2> net022<3> net022<4> net022<5> net022<6> net022<7> net024<0> net024<1> net024<2> net024<3> net024<4> net024<5> net024<6> net024<7> net024<8> net025<0> net025<1> net025<2> net025<3> net025<4> net025<5> net025<6> net025<7> net025<8> VDD net010 VSS PP_RCFilter
.ends TempSensorCore_Post_Copy

.subckt CK_DividerBy8 CKIN COMPEN INPHASE OUTPHASE PRESET QPHASE
XI14 PRESET VDD VSS net039 INVD2LVT
XI51<18> VDD VSS DCAP8LVT
XI51<17> VDD VSS DCAP8LVT
XI51<16> VDD VSS DCAP8LVT
XI51<15> VDD VSS DCAP8LVT
XI51<14> VDD VSS DCAP8LVT
XI51<13> VDD VSS DCAP8LVT
XI51<12> VDD VSS DCAP8LVT
XI51<11> VDD VSS DCAP8LVT
XI51<10> VDD VSS DCAP8LVT
XI51<9> VDD VSS DCAP8LVT
XI51<8> VDD VSS DCAP8LVT
XI51<7> VDD VSS DCAP8LVT
XI51<6> VDD VSS DCAP8LVT
XI51<5> VDD VSS DCAP8LVT
XI51<4> VDD VSS DCAP8LVT
XI51<3> VDD VSS DCAP8LVT
XI51<2> VDD VSS DCAP8LVT
XI51<1> VDD VSS DCAP8LVT
XI51<0> VDD VSS DCAP8LVT
XI50 PRESET VDD VSS net048 INVD1LVT
XI6 CKIN VDD VSS net45 CKBD1LVT
XI139 net048 net015 VDD VSS COMPEN AN2D1LVT
XI5 net45 VDD VSS net49 CKND1LVT
XI8 net039 net011 net48 net015 net48 VDD VSS DFCND1LVT
XI7 net039 net018 net50 net076 net50 VDD VSS DFCND1LVT
XI43 net076 VDD VSS net059 CKND3LVT
XI39 net48 VDD VSS net063 CKND3LVT
XI37 net015 VDD VSS net064 CKND3LVT
XI42 net059 VDD VSS QPHASE CKND8LVT
XI38 net063 VDD VSS OUTPHASE CKND8LVT
XI20 net064 VDD VSS INPHASE CKND8LVT
XI29 net039 net49 net016 net016 VDD VSS DFCND1LVT_schematic
XI28 net039 net016 net018 net018 VDD VSS DFCND1LVT_schematic
XI27 net039 net45 net040 net040 VDD VSS DFCND1LVT_schematic
XI26 net039 net040 net011 net011 VDD VSS DFCND1LVT_schematic
.ends CK_DividerBy8

.subckt INVD2LVT I ZN
xMMU1_0_M_u2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMMU1_1_M_u2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMMU1_0_M_u3 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMMU1_1_M_u3 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
.ends INVD2LVT

.subckt Switch_NMOS_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=1
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=1
.ends Switch_NMOS_n12_X1_Y1

.subckt Switch_PMOS_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=1
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=1
.ends Switch_PMOS_n12_X1_Y1

.subckt DCAP8LVT 
xMMI4 VSS net9 VSS Dcap_NMOS_n12_X1_Y1
xMM_u2 net11 net9 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI3 VDD net11 VDD Dcap_PMOS_n12_X1_Y1
xMM_u1 net9 net11 VDD VDD Switch_PMOS_n12_X1_Y1
.ends DCAP8LVT

.subckt Dcap_PMOS_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=1
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=1
.ends Dcap_PMOS_n12_X1_Y1

.subckt INVD1LVT I ZN
xMMU1_M_u2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMMU1_M_u3 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
.ends INVD1LVT

.subckt INV_LVT zn i SN SP
xxm0 zn i SN SN Switch_NMOS_n12_X1_Y1
xxm1 zn i SP SP Switch_PMOS_n12_X1_Y1
.ends INV_LVT

.subckt stage2_inv G1 SN G2 SP
MM0_MM2 D SN SP G1 INV_LVT
MM1_MM3 G2 SN SP D INV_LVT
.ends stage2_inv

.subckt CKBD1LVT I Z
MMU23_MM_u15_MMU21_MM_u3 VSS I VDD Z stage2_inv
.ends CKBD1LVT

.subckt AN2D1LVT A1 A2 Z
xMM_u3_M_u3 Z net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u2_M_u1 net5 A1 VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u2_M_u2 net5 A2 VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u3_M_u2 Z net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_M_u4 net17 A2 VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_M_u3 net5 A1 net17 VSS Switch_NMOS_n12_X1_Y1
.ends AN2D1LVT

.subckt CKND1LVT I ZN
xMM_u2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u1 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
.ends CKND1LVT

.subckt DFCND1LVT CDN CP D Q QN
xMMI29_M_u2 QN net33 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI4 net53 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI18 net33 net5 net79 VSS Switch_NMOS_n12_X1_Y1
xMMI21_M_u3 net95 net79 net9 VSS Switch_NMOS_n12_X1_Y1
xMMI13_M_u2 net81 net25 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI15 net81 net67 net79 VSS Switch_NMOS_n12_X1_Y1
xMMI14_M_u2 net33 net95 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI32_M_u2 net67 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5 net25 D net53 VSS Switch_NMOS_n12_X1_Y1
xMMI49 net20 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI48 net17 net81 net20 VSS Switch_NMOS_n12_X1_Y1
xMMI27_M_u2 Q net95 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI21_M_u4 net9 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI22_M_u2 net5 CP VSS VSS Switch_NMOS_n12_X1_Y1
xMMI47 net25 net67 net17 VSS Switch_NMOS_n12_X1_Y1
xMMI14_M_u3 net33 net95 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI22_M_u3 net5 CP VDD VDD Switch_PMOS_n12_X1_Y1
xMMI32_M_u3 net67 net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI43 net72 net81 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI6 net25 D net104 VDD Switch_PMOS_n12_X1_Y1
xMMI29_M_u3 QN net33 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI27_M_u3 Q net95 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI44 net72 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI17 net33 net67 net79 VDD Switch_PMOS_n12_X1_Y1
xMMI13_M_u3 net81 net25 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI21_M_u1 net95 net79 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI16 net81 net5 net79 VDD Switch_PMOS_n12_X1_Y1
xMMI45 net25 net5 net72 VDD Switch_PMOS_n12_X1_Y1
xMMI7 net104 net67 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI21_M_u2 net95 CDN VDD VDD Switch_PMOS_n12_X1_Y1
.ends DFCND1LVT

.subckt CKND3LVT I ZN
xMM_u1_0 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_2 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_1 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u2_1 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_0 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
.ends CKND3LVT

.subckt CKND8LVT I ZN
xMM_u1_7 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_0 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_3 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_2 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_4 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_6 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_1 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_5 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u2_1 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_6 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_3 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_4 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_7 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_0 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_5 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
.ends CKND8LVT

.subckt DFCND1LVT_schematic CDN CP D QN
xMMI29_M_u2 QN net33 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI4 net53 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI18 net33 net5 net79 VSS Switch_NMOS_n12_X1_Y1
xMMI21_M_u3 net95 net79 net9 VSS Switch_NMOS_n12_X1_Y1
xMMI13_M_u2 net81 net25 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI15 net81 net67 net79 VSS Switch_NMOS_n12_X1_Y1
xMMI14_M_u2 net33 net95 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI32_M_u2 net67 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5 net25 D net53 VSS Switch_NMOS_n12_X1_Y1
xMMI49 net20 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI48 net17 net81 net20 VSS Switch_NMOS_n12_X1_Y1
xMMI27_M_u2 net036 net95 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI21_M_u4 net9 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI22_M_u2 net5 CP VSS VSS Switch_NMOS_n12_X1_Y1
xMMI47 net25 net67 net17 VSS Switch_NMOS_n12_X1_Y1
xMMI14_M_u3 net33 net95 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI22_M_u3 net5 CP VDD VDD Switch_PMOS_n12_X1_Y1
xMMI32_M_u3 net67 net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI43 net72 net81 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI6 net25 D net104 VDD Switch_PMOS_n12_X1_Y1
xMMI29_M_u3 QN net33 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI27_M_u3 net036 net95 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI44 net72 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI17 net33 net67 net79 VDD Switch_PMOS_n12_X1_Y1
xMMI13_M_u3 net81 net25 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI21_M_u1 net95 net79 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI16 net81 net5 net79 VDD Switch_PMOS_n12_X1_Y1
xMMI45 net25 net5 net72 VDD Switch_PMOS_n12_X1_Y1
xMMI7 net104 net67 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI21_M_u2 net95 CDN VDD VDD Switch_PMOS_n12_X1_Y1
.ends DFCND1LVT_schematic

.subckt SARLogic COMPEN D<8> D<7> D<6> D<5> D<4> D<3> D<2> D<1> D<0> DONE PRESET VCTL0<8> VCTL0<7> VCTL0<6> VCTL0<5> VCTL0<4> VCTL0<3> VCTL0<2> VCTL0<1> VCTL0<0> VCTLIN<8> VCTLIN<7> VCTLIN<6> VCTLIN<5> VCTLIN<4> VCTLIN<3> VCTLIN<2> VCTLIN<1> VCTLIN<0> VONLATCH VOPLATCH
XI3<27> VDD VSS DCAP8LVT
XI3<26> VDD VSS DCAP8LVT
XI3<25> VDD VSS DCAP8LVT
XI3<24> VDD VSS DCAP8LVT
XI3<23> VDD VSS DCAP8LVT
XI3<22> VDD VSS DCAP8LVT
XI3<21> VDD VSS DCAP8LVT
XI3<20> VDD VSS DCAP8LVT
XI3<19> VDD VSS DCAP8LVT
XI3<18> VDD VSS DCAP8LVT
XI3<17> VDD VSS DCAP8LVT
XI3<16> VDD VSS DCAP8LVT
XI3<15> VDD VSS DCAP8LVT
XI3<14> VDD VSS DCAP8LVT
XI3<13> VDD VSS DCAP8LVT
XI3<12> VDD VSS DCAP8LVT
XI3<11> VDD VSS DCAP8LVT
XI3<10> VDD VSS DCAP8LVT
XI3<9> VDD VSS DCAP8LVT
XI3<8> VDD VSS DCAP8LVT
XI3<7> VDD VSS DCAP8LVT
XI3<6> VDD VSS DCAP8LVT
XI3<5> VDD VSS DCAP8LVT
XI3<4> VDD VSS DCAP8LVT
XI3<3> VDD VSS DCAP8LVT
XI3<2> VDD VSS DCAP8LVT
XI3<1> VDD VSS DCAP8LVT
XI3<0> VDD VSS DCAP8LVT
XI59 n1 COMPEN CK<1> CK<0> CKB<0> VDD VSS DFNCND1LVT
XI58 n1 COMPEN CK<2> CK<1> CKB<1> VDD VSS DFNCND1LVT
XI57 n1 COMPEN CK<3> CK<2> CKB<2> VDD VSS DFNCND1LVT
XI55 n1 COMPEN CK<4> CK<3> CKB<3> VDD VSS DFNCND1LVT
XI56 n1 COMPEN CK<5> CK<4> CKB<4> VDD VSS DFNCND1LVT
XI54 n1 COMPEN CK<6> CK<5> CKB<5> VDD VSS DFNCND1LVT
XI51 n1 COMPEN CK<7> CK<6> CKB<6> VDD VSS DFNCND1LVT
XI65 n1 COMPEN CK<8> CK<7> CKB<7> VDD VSS DFNCND1LVT
XI67 n1 COMPEN net163 CK<8> CKB<8> VDD VSS DFNCND1LVT
XI0 VDD VSS net034 TIEHLVT
XI42 n1 COMPEN CK<0> DONE VDD VSS DFCNQD1LVT
XI60 n1 CK<5> VOPLATCH D<5> VDD VSS DFCNQD1LVT
XI53 n1 CK<6> VOPLATCH D<6> VDD VSS DFCNQD1LVT
XI52 n1 CK<7> VOPLATCH D<7> VDD VSS DFCNQD1LVT
XI66 n1 CK<8> VOPLATCH D<8> VDD VSS DFCNQD1LVT
XI69 PRESET VDD VSS n1 CKND4LVT
XI73<7> D<7> net164<0> VDD VSS VCTL0<7> NR2D1LVT
XI73<6> D<6> net164<1> VDD VSS VCTL0<6> NR2D1LVT
XI73<5> D<5> net164<2> VDD VSS VCTL0<5> NR2D1LVT
XI73<4> D<4> net164<3> VDD VSS VCTL0<4> NR2D1LVT
XI73<3> D<3> net164<4> VDD VSS VCTL0<3> NR2D1LVT
XI73<2> D<2> net164<5> VDD VSS VCTL0<2> NR2D1LVT
XI73<1> D<1> net164<6> VDD VSS VCTL0<1> NR2D1LVT
XI73<0> D<0> net164<7> VDD VSS VCTL0<0> NR2D1LVT
XI84 D<8> CKB<8> VDD VSS net162 NR2D1LVT
XI72<7> CK<8> CKB<7> VDD VSS net164<0> AN2D1LVT
XI72<6> CK<7> CKB<6> VDD VSS net164<1> AN2D1LVT
XI72<5> CK<6> CKB<5> VDD VSS net164<2> AN2D1LVT
XI72<4> CK<5> CKB<4> VDD VSS net164<3> AN2D1LVT
XI72<3> CK<4> CKB<3> VDD VSS net164<4> AN2D1LVT
XI72<2> CK<3> CKB<2> VDD VSS net164<5> AN2D1LVT
XI72<1> CK<2> CKB<1> VDD VSS net164<6> AN2D1LVT
XI72<0> CK<1> CKB<0> VDD VSS net164<7> AN2D1LVT
XI106 PRESET net162 VDD VSS VCTL0<8> OR2D1LVT
XI71<7> VCTL0<7> VDD VSS VCTLIN<7> CKND1LVT
XI71<6> VCTL0<6> VDD VSS VCTLIN<6> CKND1LVT
XI71<5> VCTL0<5> VDD VSS VCTLIN<5> CKND1LVT
XI71<4> VCTL0<4> VDD VSS VCTLIN<4> CKND1LVT
XI71<3> VCTL0<3> VDD VSS VCTLIN<3> CKND1LVT
XI71<2> VCTL0<2> VDD VSS VCTLIN<2> CKND1LVT
XI71<1> VCTL0<1> VDD VSS VCTLIN<1> CKND1LVT
XI71<0> VCTL0<0> VDD VSS VCTLIN<0> CKND1LVT
XI86 VCTL0<8> VDD VSS VCTLIN<8> CKND1LVT
XI50 n1 COMPEN net034 net163 VDD VSS DFNCND1LVT_schematic
XI81 CK<0> VONLATCH D<0> n1 VDD VSS DFSND1LVT
XI80 CK<1> VONLATCH D<1> n1 VDD VSS DFSND1LVT
XI79 CK<2> VONLATCH D<2> n1 VDD VSS DFSND1LVT
XI62 CK<3> VONLATCH D<3> n1 VDD VSS DFSND1LVT
XI61 CK<4> VONLATCH D<4> n1 VDD VSS DFSND1LVT
.ends SARLogic

.subckt DFNCND1LVT CDN CPN D Q QN
xMMI60_M_u2 net49 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI43 net53 net9 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI60_M_u1 net49 net20 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI6 net5 D net1 VDD Switch_PMOS_n12_X1_Y1
xMMI62_M_u3 net11 net67 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI63_M_u3 net37 net49 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI29_M_u3 QN net37 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI31_M_u3 net67 CPN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI27_M_u3 Q net49 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI44 net53 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI17 net37 net67 net20 VDD Switch_PMOS_n12_X1_Y1
xMMI13_M_u3 net9 net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI16 net9 net11 net20 VDD Switch_PMOS_n12_X1_Y1
xMMI45 net5 net11 net53 VDD Switch_PMOS_n12_X1_Y1
xMMI7 net1 net67 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI29_M_u2 QN net37 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI63_M_u2 net37 net49 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI4 net109 net11 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI18 net37 net11 net20 VSS Switch_NMOS_n12_X1_Y1
xMMI60_M_u3 net49 net20 net104 VSS Switch_NMOS_n12_X1_Y1
xMMI60_M_u4 net104 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI13_M_u2 net9 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI15 net9 net67 net20 VSS Switch_NMOS_n12_X1_Y1
xMMI5 net5 D net109 VSS Switch_NMOS_n12_X1_Y1
xMMI31_M_u2 net67 CPN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI49 net77 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI48 net64 net9 net77 VSS Switch_NMOS_n12_X1_Y1
xMMI27_M_u2 Q net49 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI62_M_u2 net11 net67 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI47 net5 net67 net64 VSS Switch_NMOS_n12_X1_Y1
.ends DFNCND1LVT

.subckt TIEHLVT Z
xMM_u2 net7 net7 VSS VSS DCL_NMOS_n12_X1_Y1
xMM_u1 Z net7 VDD VDD Switch_PMOS_n12_X1_Y1
.ends TIEHLVT

.subckt DCL_NMOS_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=1
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=1
.ends DCL_NMOS_n12_X1_Y1

.subckt DFCNQD1LVT CDN CP D Q
xMMI4 net53 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI21_M_u3 net81 net51 net9 VSS Switch_NMOS_n12_X1_Y1
xMMI13_M_u2 net37 net97 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI29 net51 net5 net44 VSS Switch_NMOS_n12_X1_Y1
xMMI15 net37 net63 net51 VSS Switch_NMOS_n12_X1_Y1
xMMI32_M_u2 net63 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5 net97 D net53 VSS Switch_NMOS_n12_X1_Y1
xMMI49 net20 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI26 net44 net81 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI48 net17 net37 net20 VSS Switch_NMOS_n12_X1_Y1
xMMI27_M_u2 Q net81 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI21_M_u4 net9 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI22_M_u2 net5 CP VSS VSS Switch_NMOS_n12_X1_Y1
xMMI47 net97 net63 net17 VSS Switch_NMOS_n12_X1_Y1
xMMI22_M_u3 net5 CP VDD VDD Switch_PMOS_n12_X1_Y1
xMMI32_M_u3 net63 net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI43 net101 net37 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI6 net97 D net100 VDD Switch_PMOS_n12_X1_Y1
xMMI27_M_u3 Q net81 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI44 net101 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI13_M_u3 net37 net97 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI21_M_u1 net81 net51 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI16 net37 net5 net51 VDD Switch_PMOS_n12_X1_Y1
xMMI24 net72 net81 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI28 net51 net63 net72 VDD Switch_PMOS_n12_X1_Y1
xMMI45 net97 net5 net101 VDD Switch_PMOS_n12_X1_Y1
xMMI7 net100 net63 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI21_M_u2 net81 CDN VDD VDD Switch_PMOS_n12_X1_Y1
.ends DFCNQD1LVT

.subckt CKND4LVT I ZN
xMM_u1_0 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_3 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_2 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u1_1 ZN I VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u2_1 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_3 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_0 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u2_2 ZN I VSS VSS Switch_NMOS_n12_X1_Y1
.ends CKND4LVT

.subckt NR2D1LVT A1 A2 ZN
xMMI1_M_u3 ZN A2 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI1_M_u4 ZN A1 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI1_M_u1 net13 A2 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI1_M_u2 ZN A1 net13 VDD Switch_PMOS_n12_X1_Y1
.ends NR2D1LVT

.subckt OR2D1LVT A1 A2 Z
xMMU1_M_u2 Z net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u7_M_u4 net5 A1 VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u7_M_u3 net5 A2 VSS VSS Switch_NMOS_n12_X1_Y1
xMMU1_M_u3 Z net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u7_M_u1 net17 A2 VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u7_M_u2 net5 A1 net17 VDD Switch_PMOS_n12_X1_Y1
.ends OR2D1LVT

.subckt tgate D GA S GB
xM0 D GA S BN Switch_NMOS_n12_X1_Y1
xM1 D GB S BP Switch_PMOS_n12_X1_Y1
.ends tgate

.subckt DFNCND1LVT_schematic CDN CPN D Q
xMMI60_M_u2 net49 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI43 net53 net9 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI60_M_u1 net49 net20 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI6 net5 D net1 VDD Switch_PMOS_n12_X1_Y1
xMMI44 net53 CDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI45 net5 net11 net53 VDD Switch_PMOS_n12_X1_Y1
xMMI7 net1 net67 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI4 net109 net11 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI60_M_u3 net49 net20 net104 VSS Switch_NMOS_n12_X1_Y1
xMMI60_M_u4 net104 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5 net5 D net109 VSS Switch_NMOS_n12_X1_Y1
xMMI49 net77 CDN VSS VSS Switch_NMOS_n12_X1_Y1
xMMI48 net64 net9 net77 VSS Switch_NMOS_n12_X1_Y1
xMMI47 net5 net67 net64 VSS Switch_NMOS_n12_X1_Y1
MMI62_M_u2_MMI31_M_u2_MMI62_M_u3_MMI31_M_u3 VSS CPN VDD net11 stage2_inv
MMI29_M_u2_MMI63_M_u2_MMI29_M_u3_MMI63_M_u3 VSS net49 VDD net040 stage2_inv
MMI13_M_u2_MMI13_M_u3 net5 VSS VDD net9 INV_LVT
MMI27_M_u2_MMI27_M_u3 net49 VSS VDD Q INV_LVT
MMI15_MMI16 net67 net20 net11 net9 tgate
MMI18_MMI17 net11 net20 net67 net37 tgate
.ends DFNCND1LVT_schematic

.subckt DFSND1LVT CP D QN SDN
xMMI32_M_u4 net57 net61 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI32_M_u3 net97 SDN net57 VSS Switch_NMOS_n12_X1_Y1
xMMI31_M_u4 net40 net79 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI31_M_u3 net25 SDN net40 VSS Switch_NMOS_n12_X1_Y1
xMMI23 net61 net81 net5 VSS Switch_NMOS_n12_X1_Y1
xMMI21 net61 D net9 VSS Switch_NMOS_n12_X1_Y1
xMMI19 net9 net11 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI24 net5 net97 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI32_M_u1 net97 SDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI34 net61 net11 net104 VDD Switch_PMOS_n12_X1_Y1
xMMI32_M_u2 net97 net61 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI28 net85 net81 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI31_M_u2 net25 net79 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI35 net104 net97 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI31_M_u1 net25 SDN VDD VDD Switch_PMOS_n12_X1_Y1
xMMI26 net61 D net85 VDD Switch_PMOS_n12_X1_Y1
MMI40_M_u2_MMI55_M_u2_MMI40_M_u3_MMI55_M_u3 VSS CP VDD net81 stage2_inv
MMI60_M_u2_MMI25_M_u2_MMI60_M_u3_MMI25_M_u3 VSS net67 VDD net032 stage2_inv
MMI57_M_u2_MMI57_M_u3 net25 VSS VDD QN INV_LVT
MMI20_MMI30 net81 net67 net11 net97 tgate
MMI22_MMI33 net11 net67 net81 net25 tgate
.ends DFSND1LVT

.subckt ResTune_CFG INPH INPHASE<7> INPHASE<6> INPHASE<5> INPHASE<4> INPHASE<3> INPHASE<2> INPHASE<1> INPHASE<0> OUTPH OUTPHASE<7> OUTPHASE<6> OUTPHASE<5> OUTPHASE<4> OUTPHASE<3> OUTPHASE<2> OUTPHASE<1> OUTPHASE<0> RESEN<7> RESEN<6> RESEN<5> RESEN<4> RESEN<3> RESEN<2> RESEN<1> RESEN<0>
XI3<1> VDD VSS DCAP8LVT
XI3<0> VDD VSS DCAP8LVT
XI2<7> VDD VSS DCAP16LVT
XI2<6> VDD VSS DCAP16LVT
XI2<5> VDD VSS DCAP16LVT
XI2<4> VDD VSS DCAP16LVT
XI2<3> VDD VSS DCAP16LVT
XI2<2> VDD VSS DCAP16LVT
XI2<1> VDD VSS DCAP16LVT
XI2<0> VDD VSS DCAP16LVT
XI4<3> VDD VSS DCAP32LVT
XI4<2> VDD VSS DCAP32LVT
XI4<1> VDD VSS DCAP32LVT
XI4<0> VDD VSS DCAP32LVT
XI1<7> INPH RESEN<7> VDD VSS INPHASE<7> BUFTD16LVT
XI1<6> INPH RESEN<6> VDD VSS INPHASE<6> BUFTD16LVT
XI1<5> INPH RESEN<5> VDD VSS INPHASE<5> BUFTD16LVT
XI1<4> INPH RESEN<4> VDD VSS INPHASE<4> BUFTD16LVT
XI1<3> INPH RESEN<3> VDD VSS INPHASE<3> BUFTD16LVT
XI1<2> INPH RESEN<2> VDD VSS INPHASE<2> BUFTD16LVT
XI1<1> INPH RESEN<1> VDD VSS INPHASE<1> BUFTD16LVT
XI1<0> INPH RESEN<0> VDD VSS INPHASE<0> BUFTD16LVT
XI0<7> OUTPH RESEN<7> VDD VSS OUTPHASE<7> BUFTD16LVT
XI0<6> OUTPH RESEN<6> VDD VSS OUTPHASE<6> BUFTD16LVT
XI0<5> OUTPH RESEN<5> VDD VSS OUTPHASE<5> BUFTD16LVT
XI0<4> OUTPH RESEN<4> VDD VSS OUTPHASE<4> BUFTD16LVT
XI0<3> OUTPH RESEN<3> VDD VSS OUTPHASE<3> BUFTD16LVT
XI0<2> OUTPH RESEN<2> VDD VSS OUTPHASE<2> BUFTD16LVT
XI0<1> OUTPH RESEN<1> VDD VSS OUTPHASE<1> BUFTD16LVT
XI0<0> OUTPH RESEN<0> VDD VSS OUTPHASE<0> BUFTD16LVT
.ends ResTune_CFG

.subckt DCAP16LVT 
xMMI4 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMMI8 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMM_u2 net5 net11 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI7 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMMI3 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
xMMI6 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
xMM_u1 net11 net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI5 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
.ends DCAP16LVT

.subckt DCAP32LVT 
xMMI38 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMMI6 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMMI39 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMMI37 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMM_u2 net5 net11 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI36 VSS net11 VSS Dcap_NMOS_n12_X1_Y1
xMMI33 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
xMM_u1 net11 net5 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI34 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
xMMI35 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
xMMI32 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
xMMI26 VDD net5 VDD Dcap_PMOS_n12_X1_Y1
.ends DCAP32LVT

.subckt BUFTD16LVT I OE Z
xMMI6_M_u4 net37 I VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5_1_M_u4 net25 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5_0_M_u3 net25 I VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5_0_M_u4 net25 net5 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI7_M_u3 net13 OE net9 VSS Switch_NMOS_n12_X1_Y1
xMM_u7 Z net25 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI6_M_u3 net13 OE net37 VSS Switch_NMOS_n12_X1_Y1
xMMI7_M_u4 net9 I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u17_M_u2 net5 OE VSS VSS Switch_NMOS_n12_X1_Y1
xMMI5_1_M_u3 net25 I VSS VSS Switch_NMOS_n12_X1_Y1
xMM_u17_M_u3 net5 OE VDD VDD Switch_PMOS_n12_X1_Y1
xMMI5_0_M_u1 net72 I VDD VDD Switch_PMOS_n12_X1_Y1
xMMI5_0_M_u2 net25 net5 net72 VDD Switch_PMOS_n12_X1_Y1
xMMI6_M_u2 net13 I VDD VDD Switch_PMOS_n12_X1_Y1
xMMI7_M_u1 net13 OE VDD VDD Switch_PMOS_n12_X1_Y1
xMM_u6 Z net13 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI5_1_M_u1 net53 I VDD VDD Switch_PMOS_n12_X1_Y1
xMMI7_M_u2 net13 I VDD VDD Switch_PMOS_n12_X1_Y1
xMMI5_1_M_u2 net25 net5 net53 VDD Switch_PMOS_n12_X1_Y1
xMMI6_M_u1 net13 OE VDD VDD Switch_PMOS_n12_X1_Y1
.ends BUFTD16LVT

.subckt CrossingDetector QD QPHASE SQ SS VCP VCPS
XI2 QPHASE SQ VDD QD VSS CrossingDetector_Mux
XI0 VCP SS VDD VCPS VSS CrossingDetector_Mux
.ends CrossingDetector

.subckt INV_LVT_type1 zn i SN SP
xxm0 zn i SN SN Switch_NMOS_n12_X1_Y1
xxm1 zn i SP SP Switch_PMOS_n12_X1_Y1
.ends INV_LVT_type1

.subckt CrossingDetector_Mux IN SS VO
XI18 net012 net032 SS VDD VSS VO MUX2D2LVT
XI16 net033 VDD VSS net012 CKBD1LVT
XI10 net012 VDD VSS net032 CKBD1LVT
XI9 net015 VDD VSS net033 CKBD1LVT
XI15 net06 VDD VSS net015 CKND1LVT
xMM1_MM2 IN VSS VDD net06 INV_LVT_type1
.ends CrossingDetector_Mux

.subckt INV_LVT_type1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=2
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=2
.ends INV_LVT_type1

.subckt MUX2D2LVT I0 I1 S Z
xMMU18_M_u3 net25 net17 net7 VSS Switch_NMOS_n12_X1_Y1
xMMI16_M_u2 net25 I0 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI17_M_u2 net17 S VSS VSS Switch_NMOS_n12_X1_Y1
xMMI13_M_u3 net9 S net7 VSS Switch_NMOS_n12_X1_Y1
xMMI14_M_u2 net9 I1 VSS VSS Switch_NMOS_n12_X1_Y1
xMMU29_0_M_u2 Z net7 VSS VSS Switch_NMOS_n12_X1_Y1
xMMU29_1_M_u2 Z net7 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI17_M_u3 net17 S VDD VDD Switch_PMOS_n12_X1_Y1
xMMI14_M_u3 net9 I1 VDD VDD Switch_PMOS_n12_X1_Y1
xMMU29_1_M_u3 Z net7 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI16_M_u3 net25 I0 VDD VDD Switch_PMOS_n12_X1_Y1
xMMU29_0_M_u3 Z net7 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI13_M_u2 net9 net17 net7 VDD Switch_PMOS_n12_X1_Y1
xMMU18_M_u2 net25 S net7 VDD Switch_PMOS_n12_X1_Y1
.ends MUX2D2LVT

.subckt CCP_PMOS_S_n12_X1_Y1 B DA DB S
xM0 DA DB S B Switch_PMOS_n12_X1_Y1
xM1 DB DA S B Switch_PMOS_n12_X1_Y1
.ends CCP_PMOS_S_n12_X1_Y1

.subckt DP_NMOS_n12_X1_Y1 B DA GA S DB GB
xM0 DA GA S B Switch_NMOS_n12_X1_Y1
xM1 DB GB S B Switch_NMOS_n12_X1_Y1
.ends DP_NMOS_n12_X1_Y1

.subckt EdgeComparator COMPEN PRESET VIN VIP VONL VOPL
xMM7 net028 net029 VDD VDD Switch_PMOS_n12_X1_Y1
xMM6 net25 net033 VDD VDD Switch_PMOS_n12_X1_Y1
xMM2 net25 VIN VDD VDD Switch_PMOS_n12_X1_Y1
xMM0 net028 VIP VDD VDD Switch_PMOS_n12_X1_Y1
XI95 VOP VOPL VDD VSS VONL NR2D2LVT
XI96 VON VONL VDD VSS VOPL NR2D2LVT
xMM28 net25 VIN net032 VSS Switch_NMOS_n12_X1_Y1
xMM1 net028 VIP net24 VSS Switch_NMOS_n12_X1_Y1
xMM22 net015 COMPEN VSS VSS Switch_NMOS_n12_X1_Y1
XI5 PRESET VDD VSS net029 INVD1LVT
XI4 PRESET VDD VSS net033 INVD1LVT
XI3 net028 VDD VSS VOP INVD1LVT
XI1 net25 VDD VSS VON INVD1LVT
xMM45_MM3 net25 net028 VDD VDD CCP_PMOS_S_n12_X1_Y1
xMM5_MM4 net032 net028 net015 net24 net25 VSS DP_NMOS_n12_X1_Y1
.ends EdgeComparator

.subckt CCP_PMOS_S_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=4
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=4
.ends CCP_PMOS_S_n12_X1_Y1

.subckt DP_NMOS_n12_X1_Y1 D G S B
m0 D G S1 B nmos_rvt  l=1e-08 w=1e-08 m=2
m1 S1 G S B nmos_rvt  l=1e-08 w=1e-08 m=2
.ends DP_NMOS_n12_X1_Y1

.subckt NR2D2LVT A1 A2 ZN
xMMI1_1_M_u3 ZN A2 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI1_1_M_u4 ZN A1 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI1_0_M_u4 ZN A1 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI1_0_M_u3 ZN A2 VSS VSS Switch_NMOS_n12_X1_Y1
xMMI1_1_M_u2 ZN A1 net17 VDD Switch_PMOS_n12_X1_Y1
xMMI1_0_M_u1 net25 A2 VDD VDD Switch_PMOS_n12_X1_Y1
xMMI1_0_M_u2 ZN A1 net25 VDD Switch_PMOS_n12_X1_Y1
xMMI1_1_M_u1 net17 A2 VDD VDD Switch_PMOS_n12_X1_Y1
.ends NR2D2LVT
