#Use this file as a script for gnuplot
#(See http://www.gnuplot.info/ for details)

set title" #Blocks= 5, #Terminals= 8, #Nets= 13, Area=1.5456e+08, HPWL= 56220 "

set nokey
#   Uncomment these two lines starting with "set"
#   to save an EPS file for inclusion into a latex document
# set terminal postscript eps color solid 20
# set output "result.eps"

#   Uncomment these two lines starting with "set"
#   to save a PS file for printing
# set terminal postscript portrait color solid 20
# set output "result.ps"


set xrange [-19370:19370]

set yrange [-50:19370]

set label "m5_m4" at 4000 , 2016 center 

set label "B" at 4000 , 3192


set label "DA" at 3680 , 1260


set label "DB" at 4160 , 672


set label "S" at 4000 , 336


set label "m2_m1" at 4000 , 17472 center 

set label "B" at 4000 , 18648


set label "DA" at 3520 , 15960


set label "DB" at 4480 , 16128


set label "G" at 4000 , 17472


set label "S" at 4000 , 15792


set label "m3_m0" at 4000 , 5880 center 

set label "B" at 4000 , 7056


set label "DA" at 3840 , 4368


set label "DB" at 4160 , 4536


set label "GA" at 3840 , 5880


set label "GB" at 4160 , 6048


set label "S" at 4000 , 4200


set label "m7_m6" at 4000 , 13608 center 

set label "B" at 4000 , 14784


set label "DA" at 4000 , 12096


set label "DB" at 4000 , 12432


set label "G" at 4000 , 13608


set label "SA" at 4000 , 11928


set label "SB" at 4000 , 12264


set label "m9_m8" at 4000 , 9744 center 

set label "B" at 4000 , 10920


set label "DA" at 3360 , 8232


set label "DB" at 4640 , 8568


set label "G" at 4000 , 9744


set label "SA" at 3360 , 8064


set label "SB" at 4640 , 8400


set label "d1" at 3680 , 0 center 

set label "vbiasp1" at 4000 , 19320 center 

set label "vinn" at 0 , 5880 center 

set label "vinp" at 8000 , 6048 center 

set label "voutp" at 8000 , 8568 center 

set label "voutn" at 0 , 8232 center 

set label "vbiasp2" at 0 , 13608 center 

set label "vbiasn" at 0 , 9744 center 

plot[:][:] '-' with lines linestyle 3, '-' with lines linestyle 7, '-' with lines linestyle 1, '-' with lines linestyle 0

# block m5_m4 select 0 bsize 4
	2560	168
	2560	3864
	5440	3864
	5440	168
	2560	168

# block m2_m1 select 0 bsize 4
	2720	15624
	2720	19320
	5280	19320
	5280	15624
	2720	15624

# block m3_m0 select 0 bsize 4
	640	4032
	640	7728
	7360	7728
	7360	4032
	640	4032

# block m7_m6 select 0 bsize 4
	1440	11760
	1440	15456
	6560	15456
	6560	11760
	1440	11760

# block m9_m8 select 0 bsize 4
	160	7896
	160	11592
	7840	11592
	7840	7896
	160	7896


EOF
	2632	3160
	2632	3224
	5368	3224
	5368	3160
	2632	3160

	3640	432
	3640	2088
	3720	2088
	3720	432
	3640	432

	3448	640
	3448	704
	4872	704
	4872	640
	3448	640

	2968	304
	2968	368
	5032	368
	5032	304
	2968	304

	2792	18616
	2792	18680
	5208	18680
	5208	18616
	2792	18616

	3288	15928
	3288	15992
	3752	15992
	3752	15928
	3288	15928

	4248	16096
	4248	16160
	4712	16160
	4712	16096
	4248	16096

	3288	17440
	3288	17504
	4712	17504
	4712	17440
	3288	17440

	3128	15760
	3128	15824
	4872	15824
	4872	15760
	3128	15760

	712	7024
	712	7088
	7288	7088
	7288	7024
	712	7024

	1208	4336
	1208	4400
	6472	4400
	6472	4336
	1208	4336

	1528	4504
	1528	4568
	6792	4568
	6792	4504
	1528	4504

	1208	5848
	1208	5912
	6472	5912
	6472	5848
	1208	5848

	1528	6016
	1528	6080
	6792	6080
	6792	6016
	1528	6016

	1048	4168
	1048	4232
	6952	4232
	6952	4168
	1048	4168

	1512	14752
	1512	14816
	6488	14816
	6488	14752
	1512	14752

	2008	12064
	2008	12128
	5992	12128
	5992	12064
	2008	12064

	3288	12400
	3288	12464
	4712	12464
	4712	12400
	3288	12400

	2008	13576
	2008	13640
	5992	13640
	5992	13576
	2008	13576

	1848	11896
	1848	11960
	6152	11960
	6152	11896
	1848	11896

	3128	12232
	3128	12296
	4872	12296
	4872	12232
	3128	12232

	232	10888
	232	10952
	7768	10952
	7768	10888
	232	10888

	728	8200
	728	8264
	5992	8264
	5992	8200
	728	8200

	2008	8536
	2008	8600
	7272	8600
	7272	8536
	2008	8536

	728	9712
	728	9776
	7272	9776
	7272	9712
	728	9712

	568	8032
	568	8096
	6152	8096
	6152	8032
	568	8032

	1848	8368
	1848	8432
	7432	8432
	7432	8368
	1848	8368


EOF

	3660	-20
	3660	20
	3700	20
	3700	-20
	3660	-20

	3980	19300
	3980	19340
	4020	19340
	4020	19300
	3980	19300

	-20	5860
	-20	5900
	20	5900
	20	5860
	-20	5860

	7980	6028
	7980	6068
	8020	6068
	8020	6028
	7980	6028

	7980	8548
	7980	8588
	8020	8588
	8020	8548
	7980	8548

	-20	8212
	-20	8252
	20	8252
	20	8212
	-20	8212

	-20	13588
	-20	13628
	20	13628
	20	13588
	-20	13588

	-20	9724
	-20	9764
	20	9764
	20	9724
	-20	9724

EOF

#Net: d1
	3680	1260
	3680	0
	3680	1260


#Net: net10
	4160	672
	4000	4200
	4160	672


#Net: net012
	3520	15960
	4000	11928
	3520	15960


#Net: net06
	4480	16128
	4000	14784
	4480	16128

	4480	16128
	4000	12264
	4480	16128


#Net: vbiasp1
	4000	17472
	4000	19320
	4000	17472


#Net: net014
	3840	4368
	4640	8400
	3840	4368


#Net: net8
	4160	4536
	3360	8064
	4160	4536


#Net: vinn
	3840	5880
	0	5880
	3840	5880


#Net: vinp
	4160	6048
	8000	6048
	4160	6048


#Net: voutp
	4000	12096
	4640	8568
	4000	12096

	4000	12096
	8000	8568
	4000	12096


#Net: voutn
	4000	12432
	3360	8232
	4000	12432

	4000	12432
	0	8232
	4000	12432


#Net: vbiasp2
	4000	13608
	0	13608
	4000	13608


#Net: vbiasn
	4000	9744
	0	9744
	4000	9744


EOF

pause -1 'Press any key'