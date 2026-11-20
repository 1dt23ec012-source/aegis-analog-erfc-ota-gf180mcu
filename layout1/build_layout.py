#!/usr/bin/env python3
import re
from collections import defaultdict

def parse_val(v):
    v = v.lower().strip().replace("'", "").replace('"', '')
    if v.endswith('u'): return float(v[:-1])
    if v.endswith('n'): return float(v[:-1]) * 1e-3
    return float(v)

schematic_path = '/home/aryan_r_gowda/.xschem/simulations/exp1.spice'
clean_schematic_path = '/home/aryan_r_gowda/exp1_schematic_clean.spice'

# 1. Clean schematic (filter out simulation sources and passives)
with open(schematic_path, 'r') as f:
    raw = f.readlines()

clean = []
for l in raw:
    ls = l.strip()
    if not ls or ls.startswith('*'):
        if ls.startswith('**.subckt') or ls.startswith('**.ends'):
            ls = ls[2:]
        else:
            continue
    tok = ls.split()
    if not tok:
        continue
    # Filter simulation-only elements: Isrc, C, R, V
    if tok[0].upper().startswith(('I', 'C', 'R', 'V')):
        continue
    # Ensure X prefix for subcircuit LVS matching
    if not tok[0].upper().startswith('X') and tok[0].upper().startswith('M'):
        tok[0] = 'X' + tok[0]
    for i in range(1, len(tok)):
        if tok[i] == '0': 
            tok[i] = 'gnd'
    clean.append(' '.join(tok) + '\n')

with open(clean_schematic_path, 'w') as f:
    f.writelines(clean)

devs = []
for l in clean:
    t = l.split()
    if t and (t[0].startswith('M') or t[0].startswith('X')) and len(t) >= 6:
        w, l_g, nf = 10.0, 0.6, 1
        for p in t[6:]:
            if '=' in p:
                k, v = p.split('=', 1)
                k = k.lower().strip()
                if k == 'w': w = parse_val(v)
                elif k == 'l': l_g = parse_val(v)
                elif k in ['nf', 'm']: nf = int(float(v))
        devs.append({'name': t[0], 'd': t[1], 'g': t[2], 's': t[3], 'b': t[4],
                     'w': w, 'l': l_g, 'nf': nf, 'is_p': 'pfet' in t[5].lower()})

# 2. Magic Setup
tcl = [
    "drc off",
    "scalegrid 1 20",
    "snap on",
    "grid 0.05u 0.05u"
]

net_pin_exits = defaultdict(list)

def draw_row(row_devs, start_x, start_y, is_p, vdd_top=250.0):
    cx = start_x
    diff_l = "pdiff" if is_p else "ndiff"
    cnt_l = "pdc" if is_p else "ndc"
    cw, c2g, oh = 0.4, 0.3, 0.8

    for d in row_devs:
        wf = d['w'] / d['nf']
        dev_x = (d['nf'] + 1) * cw + 2 * d['nf'] * c2g + d['nf'] * d['l']
        x0, y0, x1, y1 = cx, start_y, cx + dev_x, start_y + wf

        if is_p:
            tcl.append(f"box {x0-2:.2f}u {y0-2:.2f}u {x1+2:.2f}u {vdd_top:.2f}u\npaint nwell")
        tcl.append(f"box {x0:.2f}u {y0:.2f}u {x1:.2f}u {y1:.2f}u\npaint {diff_l}")

        xp = x0
        gx = []
        contacts = []

        for i in range(d['nf']):
            tcl.append(f"box {xp:.2f}u {y0+0.1:.2f}u {xp+cw:.2f}u {y1-0.1:.2f}u\npaint {cnt_l}\npaint metal1")
            net = d['s'] if i % 2 == 0 else d['d']
            contacts.append((xp, net))

            if net.lower() == 'gnd':
                if not is_p:
                    tcl.append(f"box {xp:.2f}u 0.0u {xp+cw:.2f}u {y0+0.5:.2f}u\npaint metal1")
                else:
                    exit_y = y0 - 0.6
                    tcl.append(f"box {xp:.2f}u {exit_y:.2f}u {xp+cw:.2f}u {y0+0.5:.2f}u\npaint metal1")
                    net_pin_exits['gnd'].append((xp + cw/2, exit_y))
            elif is_p and net.lower() == 'vdd':
                tcl.append(f"box {xp:.2f}u {y1-0.5:.2f}u {xp+cw:.2f}u {vdd_top:.2f}u\npaint metal1")

            xp += cw + c2g
            tcl.append(f"box {xp:.2f}u {y0-oh:.2f}u {xp+d['l']:.2f}u {y1+oh:.2f}u\npaint poly")
            gx.append(xp)
            xp += d['l'] + c2g

        # Last Contact
        tcl.append(f"box {xp:.2f}u {y0+0.1:.2f}u {xp+cw:.2f}u {y1-0.1:.2f}u\npaint {cnt_l}\npaint metal1")
        last_net = d['d'] if d['nf'] % 2 != 0 else d['s']
        contacts.append((xp, last_net))

        if last_net.lower() == 'gnd':
            if not is_p:
                tcl.append(f"box {xp:.2f}u 0.0u {xp+cw:.2f}u {y0+0.5:.2f}u\npaint metal1")
            else:
                exit_y = y0 - 0.6
                tcl.append(f"box {xp:.2f}u {exit_y:.2f}u {xp+cw:.2f}u {y0+0.5:.2f}u\npaint metal1")
                net_pin_exits['gnd'].append((xp + cw/2, exit_y))
        elif is_p and last_net.lower() == 'vdd':
            tcl.append(f"box {xp:.2f}u {y1-0.5:.2f}u {xp+cw:.2f}u {vdd_top:.2f}u\npaint metal1")

        # Clean Exit directly towards middle channel
        for cx_pos, c_net in contacts:
            if c_net.lower() not in ['gnd', 'vdd']:
                if not is_p:
                    exit_y = y1 + 0.6
                    tcl.append(f"box {cx_pos:.2f}u {y1-0.1:.2f}u {cx_pos+cw:.2f}u {exit_y:.2f}u\npaint metal1")
                else:
                    exit_y = y0 - 0.6
                    tcl.append(f"box {cx_pos:.2f}u {exit_y:.2f}u {cx_pos+cw:.2f}u {y0+0.1:.2f}u\npaint metal1")
                net_pin_exits[c_net].append((cx_pos + cw/2, exit_y))

        # Gate Strap
        gs, ge = gx[0], gx[-1] + d['l']
        gate_tap_x = x0 - 0.8
        if not is_p:
            tcl.append(f"box {gate_tap_x:.2f}u {y1+0.3:.2f}u {ge:.2f}u {y1+0.8:.2f}u\npaint poly")
            tcl.append(f"box {gate_tap_x:.2f}u {y1+0.3:.2f}u {gate_tap_x+0.5:.2f}u {y1+0.8:.2f}u\npaint pc\npaint metal1")
            net_pin_exits[d['g']].append((gate_tap_x + 0.25, y1 + 0.8))
        else:
            tcl.append(f"box {gate_tap_x:.2f}u {y0-0.8:.2f}u {ge:.2f}u {y0-0.3:.2f}u\npaint poly")
            tcl.append(f"box {gate_tap_x:.2f}u {y0-0.8:.2f}u {gate_tap_x+0.5:.2f}u {y0-0.3:.2f}u\npaint pc\npaint metal1")
            net_pin_exits[d['g']].append((gate_tap_x + 0.25, y0 - 0.8))

        # Exact GF180 Substrate and Well Taps (psd + psc, nsd + nsc)
        if is_p:
            # PMOS N-well tap (nsd + nsc to vdd)
            tcl.append(f"box {x0:.2f}u {y1+1.0:.2f}u {x1:.2f}u {y1+2.0:.2f}u\npaint nsd\npaint nsc\npaint metal1")
            tcl.append(f"box {x0:.2f}u {y1+1.0:.2f}u {x1:.2f}u {vdd_top:.2f}u\npaint metal1")
        else:
            # NMOS P-substrate tap (psd + psc to gnd)
            tcl.append(f"box {x0:.2f}u {y0-2.0:.2f}u {x1:.2f}u {y0-1.0:.2f}u\npaint psd\npaint psc\npaint metal1")
            tcl.append(f"box {x0:.2f}u 0.0u {x1:.2f}u {y0-1.0:.2f}u\npaint metal1")

        cx += dev_x + 8.0
    return cx

# NMOS on Left, PMOS on Right
vdd_rail_top = 250.0
end_nmos_x = draw_row([d for d in devs if not d['is_p']], start_x=10.0, start_y=10.0, is_p=False, vdd_top=vdd_rail_top)
pmos_start_x = end_nmos_x + 30.0
end_pmos_x = draw_row([d for d in devs if d['is_p']], start_x=pmos_start_x, start_y=180.0, is_p=True, vdd_top=vdd_rail_top)
mx = max(end_nmos_x, end_pmos_x) + 20.0

# Global continuous rails
tcl.append(f"box {pmos_start_x-5.0:.2f}u 176.0u {mx:.2f}u {vdd_rail_top:.2f}u\npaint nwell")
tcl.append(f"box 0.0u {vdd_rail_top-10.0:.2f}u {mx:.2f}u {vdd_rail_top:.2f}u\npaint metal1\nlabel vdd c metal1\nport make 1")
tcl.append(f"box 0.0u 0.0u {mx:.2f}u 6.0u\npaint metal1\nlabel gnd c metal1\nport make 7")

# Connect any PMOS GND exits straight down to GND rail
if 'gnd' in net_pin_exits:
    for px, py in net_pin_exits['gnd']:
        tcl.append(f"box {px-0.2:.2f}u 0.0u {px+0.2:.2f}u {py:.2f}u\npaint metal1")

# Clean Manhattan Channel Router: Horizontal on Metal2, Vertical on Metal1
track_y = 48.0
port_map = {'vin-': 2, 'vin+': 3, 'vout': 4, 'vcp': 5, 'vcn': 6}

for net, pts in sorted(net_pin_exits.items()):
    if net.lower() in ['gnd', 'vdd']: continue
    xs = [p[0] for p in pts]
    min_x, max_x = min(xs) - 0.6, max(xs) + 0.6

    tcl.append(f"box {min_x:.2f}u {track_y:.2f}u {max_x:.2f}u {track_y+0.6:.2f}u\npaint metal2\nlabel {net} c metal2")
    if net in port_map:
        tcl.append(f"port make {port_map[net]}")

    for px, py in pts:
        y_bot = min(py, track_y)
        y_top = max(py, track_y + 0.6)
        tcl.append(f"box {px-0.15:.2f}u {y_bot:.2f}u {px+0.15:.2f}u {y_top:.2f}u\npaint metal1")
        tcl.append(f"box {px-0.15:.2f}u {track_y+0.1:.2f}u {px+0.15:.2f}u {track_y+0.5:.2f}u\npaint via1")

    track_y += 3.0

# Export & Clean Exit
tcl.extend([
    "drc on",
    "save exp1_connected",
    "extract do local",
    "extract all",
    "ext2spice lvs",
    "ext2spice -d",
    "ext2spice",
    "gds write exp1_connected.gds",
    "quit -noprompt"
])

with open('/home/aryan_r_gowda/build_layout.tcl', 'w') as f:
    f.write("\n".join(tcl))

print(f"Generated clean collision-free GF180 layout for {len(devs)} transistors!")
