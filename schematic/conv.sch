v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -60 30 20 30 {lab=vcn}
N -190 90 -190 130 {lab=#net1}
N -190 90 -100 90 {lab=#net1}
N -100 60 -100 90 {lab=#net1}
N 60 60 60 90 {lab=#net2}
N 60 90 130 90 {lab=#net2}
N 130 90 130 140 {lab=#net2}
N 170 170 240 170 {lab=#net3}
N -290 160 -230 160 {lab=#net4}
N -330 190 -330 220 {lab=gnd}
N -330 220 280 220 {lab=gnd}
N 280 200 280 220 {lab=gnd}
N 130 200 130 220 {lab=gnd}
N -190 190 -190 220 {lab=gnd}
N -360 -150 -360 0 {lab=#net5}
N -360 -0 -330 0 {lab=#net5}
N -330 -0 -330 130 {lab=#net5}
N 200 -160 200 10 {lab=#net6}
N 200 10 280 10 {lab=#net6}
N 280 10 280 140 {lab=#net6}
N -200 -150 60 -70 {lab=#net3}
N 60 -70 60 -0 {lab=#net3}
N -100 -50 70 -160 {lab=#net4}
N -100 -50 -100 -0 {lab=#net4}
N -360 -240 -360 -210 {lab=#net7}
N -360 -240 200 -240 {lab=#net7}
N 200 -240 200 -220 {lab=#net7}
N 70 -240 70 -220 {lab=#net7}
N -200 -240 -200 -210 {lab=#net7}
N 10 -330 10 -240 {lab=#net7}
N 680 -80 680 -0 {lab=#net6}
N 200 -0 680 0 {lab=#net6}
N -360 -30 530 -30 {lab=#net5}
N 530 -80 530 -30 {lab=#net5}
N 500 -230 640 -230 {lab=vcp}
N 510 -350 640 -350 {lab=#net8}
N 460 -200 460 -160 {lab=#net8}
N 460 -160 530 -160 {lab=#net8}
N 530 -160 530 -140 {lab=#net8}
N 460 -300 460 -260 {lab=#net9}
N 460 -300 470 -300 {lab=#net9}
N 470 -320 470 -300 {lab=#net9}
N 680 -320 680 -260 {lab=#net10}
N 680 -200 680 -140 {lab=vout}
N 460 -180 570 -180 {lab=#net8}
N 570 -350 570 -180 {lab=#net8}
N 10 -430 10 -390 {lab=vdd}
N 10 -430 680 -430 {lab=vdd}
N 680 -430 680 -380 {lab=vdd}
N 470 -430 470 -380 {lab=vdd}
N 210 30 210 170 {lab=#net3}
N 170 30 210 30 {lab=#net3}
N 170 -10 170 30 {lab=#net3}
N 60 -10 170 -10 {lab=#net3}
N -270 -20 -270 160 {lab=#net4}
N -270 -20 -100 -20 {lab=#net4}
N 110 -190 240 -190 {lab=vin-}
N -400 -180 -240 -180 {lab=vin+}
N -250 30 -100 30 {lab=gnd}
N -250 30 -250 220 {lab=gnd}
N -190 160 -110 160 {lab=gnd}
N -110 160 -110 220 {lab=gnd}
N -410 160 -330 160 {lab=gnd}
N -410 160 -410 220 {lab=gnd}
N -410 220 -330 220 {lab=gnd}
N 60 30 160 30 {lab=gnd}
N 160 30 160 120 {lab=gnd}
N 160 120 190 120 {lab=gnd}
N 190 120 190 220 {lab=gnd}
N 40 170 130 170 {lab=gnd}
N 40 170 40 220 {lab=gnd}
N 280 170 360 170 {lab=gnd}
N 360 170 360 220 {lab=gnd}
N 280 220 360 220 {lab=gnd}
N 430 -110 530 -110 {lab=gnd}
N 430 -110 430 220 {lab=gnd}
N 360 220 430 220 {lab=gnd}
N 680 -110 760 -110 {lab=gnd}
N 760 -110 760 220 {lab=gnd}
N 430 220 760 220 {lab=gnd}
N 570 -110 640 -110 {lab=vcn}
N 280 -470 320 -470 {lab=vdd}
N 320 -470 320 -430 {lab=vdd}
N -70 -360 -30 -360 {lab=vb0}
N -450 -180 -400 -180 {lab=vin+}
N 240 -190 270 -190 {lab=vin-}
N 590 -300 590 -230 {lab=vcp}
N 590 -300 810 -300 {lab=vcp}
N -20 30 -20 110 {lab=vcn}
N -20 110 800 110 {lab=vcn}
N 800 80 800 110 {lab=vcn}
N 800 80 820 80 {lab=vcn}
N 610 -110 610 80 {lab=vcn}
N 610 80 800 80 {lab=vcn}
N 130 260 150 260 {lab=gnd}
N 150 220 150 260 {lab=gnd}
N 680 -170 780 -170 {lab=vout}
C {sky130_fd_pr/nfet_01v8.sym} -210 160 0 0 {name=M3A
W=4
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -310 160 0 1 {name=M3B
W=12
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 150 170 0 1 {name=M4A
W=4
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 260 170 0 0 {name=M4B
W=12
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 550 -110 0 1 {name=M5
W=8
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 660 -110 0 0 {name=M6
W=8
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 40 30 0 0 {name=M12
W=8
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -80 30 0 1 {name=M11
W=8
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -220 -180 0 0 {name=M1B
W=8
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -380 -180 0 0 {name=M1A
W=8
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 490 -350 0 1 {name=M2
W=6
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 480 -230 0 1 {name=M7
W=8
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 660 -230 0 0 {name=M1
W=8
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -10 -360 0 0 {name=M0
W=4
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 90 -190 0 1 {name=M2B
W=8
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 660 -350 0 0 {name=M10
W=6
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 280 -470 0 0 {name=p1 lab=vdd}
C {ipin.sym} -450 -180 0 0 {name=p2 lab=vin+}
C {ipin.sym} 270 -190 2 0 {name=p3 lab=vin-}
C {ipin.sym} -70 -360 0 0 {name=p4 lab=vb0}
C {ipin.sym} 820 80 2 0 {name=p5 lab=vcn}
C {ipin.sym} 810 -300 2 0 {name=p6 lab=vcp}
C {sky130_fd_pr/pfet3_01v8.sym} 220 -190 0 1 {name=M2A
W=8
L=0.5
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {ipin.sym} 130 260 0 0 {name=p7 lab=gnd}
C {opin.sym} 780 -170 0 0 {name=p8 lab=vout}
