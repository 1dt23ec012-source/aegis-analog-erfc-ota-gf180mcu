<div align="center">

# Aegis-Analog: Slew-Rate-Enhanced (ERFC) OTA with Gain-Boosting & On-Chip LDO

### **Submicron CMOS Cryptographic Power Delivery & Analog Front-End**
**Target PDKs:** GlobalFoundries GF180MCU (3.3V) & 0.18-µm Mixed-Signal CMOS (1P6M)  
**Submission:** VLSID 2027 Tape-Out Contest

[![DRC Clean](https://img.shields.io/badge/DRC-100%25%20Clean%20(0%20Errors)-brightgreen?style=for-the-badge&logo=checkmarx)](https://github.com/1dt23ec012-source/aegis-analog-erfc-ota-gf180mcu)
[![LVS Match](https://img.shields.io/badge/Netgen%20LVS-Unique%20Match%20(37%2F37)-brightgreen?style=for-the-badge)](https://github.com/1dt23ec012-source/aegis-analog-erfc-ota-gf180mcu)
[![PDK GF180MCU](https://img.shields.io/badge/PDK-GF180MCU%20(3.3V)-red?style=for-the-badge)](https://github.com/google/gf180mcu-pdk)
[![Open-Source EDA](https://img.shields.io/badge/EDA-Xschem%20%7C%20Ngspice%20%7C%20Magic%20%7C%20Netgen-blue?style=for-the-badge)](https://github.com/1dt23ec012-source/aegis-analog-erfc-ota-gf180mcu)

</div>

---

## 📖 Executive Summary

In high-performance embedded systems, Hardware Security Modules (HSMs), and distributed SoCs, Low-Dropout (LDO) linear regulators deployed as on-chip power management units must deliver high Power Supply Rejection Ratio (PSRR), rapid transient recovery, and sub-microsecond settling while dissipating minimal quiescent power.

The primary bottleneck in conventional LDO loops is the operational transconductance amplifier (OTA) error amplifier, which conventionally faces an intransigent trade-off between open-loop DC voltage regulation gain ($A_{OL}$) and large-signal slew rate (SR). High DC gain is necessary to minimize steady-state line/load regulation errors, while high slew rate is vital to rapidly charge the large gate capacitance of the power pass transistor during sudden load steps.

**Aegis-Analog** resolves this fundamental design trade-off through a fully custom, physically verified **Slew-Rate-Enhanced (SRE) Enhanced Recycling Folded Cascode (ERFC) OTA** featuring:
1. **Dynamic Current Recycling:** Input-stage bias current reuse yielding effective transconductance $G_{m,\text{eff}} = g_{m13} \cdot (1 + K) \approx 3.5 \cdot g_{m13} \approx 1.18\text{ mA/V}$ at zero added tail current.
2. **Nested Local Feedback (NLF) Slew Acceleration:** Dynamic current injectors delivering transient currents $> 96\ \mu\text{A}$, boosting slew rate by **84.7× (13.81 V/µs)** over conventional RFCs while drawing only **9.91 µA** of static current ($17.84\ \mu\text{W}$).
3. **Dual Active Bult–Geelen Gain-Boosters:** Auxiliary differential amplifiers multiplying cascode output impedance to $R_{\text{out}} \approx 80\text{ M}\Omega$, yielding an open-loop DC gain of **98.77 dB**.
4. **On-Chip Lead-Compensated LDO Regulator:** Regulates a 1.200 V nominal output from a 1.80 V input rail into a $240\ \Omega \parallel 100\text{ pF}$ load with **sub-0.70 µs settling** and **0% overshoot**.
5. **Procedural Python Layout Generation:** Custom layout programmatically generated in Magic VLSI, verified **100% DRC clean**, with a **bit-exact Netgen LVS match** and full 3D distributed RC parasitic extraction.

---

## 🏛️ System Architecture & Circuit Theory

```text
                                 VDD = 1.80 V
                                      │
  VREF = 0.90 V ──(+)                 ▼
                    \   ┌───────────────────────────┐       VOUT,LDO = 1.20 V
                     ───┤ Gain-Boosted ERFC OTA     ├─Vctrl─►[ Power PMOS Pass FET ]──┬──► Load (240Ω || 100pF)
                    /   │       (Error Amp)         │        [  W=100µm, L=0.6µm   ]  │
  VFB  ───────────(-)   └─────────────┬─────────────┘                                 ├──[ Rz = 2kΩ, Cc = 2pF ]──┐
                                      │                                               │   (Lead Compensation)    │
                                     GND                     Divider Rf2 = 30kΩ ──────┴──────────────────────────┘
                                                                                      │
                                                             Divider Rf1 = 10kΩ ──────┴── VFB = 0.90 V
