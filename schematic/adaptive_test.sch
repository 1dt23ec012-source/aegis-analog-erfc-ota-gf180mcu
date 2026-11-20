v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -180 20 -120 20 {lab=#net1}
N -260 0 -120 0 {lab=#net2}
N -340 -20 -120 -20 {lab=#net3}
N -340 40 -340 100 {lab=0}
N -200 80 -200 100 {lab=0}
N -260 60 -260 100 {lab=0}
N 180 -20 280 -20 {lab=vout}
N 280 -20 360 -20 {lab=vout}
N -200 20 -180 20 {lab=#net1}
N -150 40 -120 40 {lab=#net4}
N -150 40 -150 120 {lab=#net4}
N -130 60 -120 60 {lab=#net5}
N -130 60 -130 110 {lab=#net5}
N -130 110 -110 110 {lab=#net5}
N -110 110 -100 110 {lab=#net5}
N -100 110 -90 110 {lab=#net5}
N -90 110 -90 120 {lab=#net5}
N -340 100 -340 190 {lab=0}
N -340 190 -90 190 {lab=0}
N -90 180 -90 190 {lab=0}
N -150 180 -150 190 {lab=0}
N -200 100 -200 190 {lab=0}
N -260 100 -260 190 {lab=0}
N -230 190 -230 200 {lab=0}
N 280 40 280 50 {lab=0}
C {vsource.sym} -200 50 0 0 {name=V1 value=1.75 savecurrent=false}
C {vsource.sym} -260 30 0 0 {name=V2 value=0.3 savecurrent=false}
C {vsource.sym} -340 10 0 0 {name=V3 value=1.8 savecurrent=false}
C {capa.sym} 280 10 0 0 {name=C2
m=1
value=72p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -230 200 0 0 {name=l1 lab=0}
C {opin.sym} 360 -20 0 0 {name=p1 lab=vout}
C {code_shown.sym} -490 -260 0 0 {name=s1 only_toplevel=false 
value=".lib /home/aryan_r_gowda/VLSI/pdk/volare/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.control
op
print v(vout) v(net1) v(net2)
.endc
"}
C {vsource.sym} -150 150 0 0 {name=V4 value=0.8 savecurrent=false}
C {vsource.sym} -90 150 0 0 {name=V5 value=0.8 savecurrent=false}
C {gnd.sym} 280 50 0 0 {name=l2 lab=0}
C {adaptive.sym} 30 20 0 0 {name=x1}
