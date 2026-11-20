# Physical Layout & Silicon Verification

This directory contains the custom physical mask layout, procedural Python layout scripts, and verification collateral for the Aegis-Analog ERFC OTA in GlobalFoundries GF180MCU (3.3V).

## Floorplan Specifications
* **Process Node:** GlobalFoundries GF180MCU (3.3V devices, gf180mcuC)
* **Active Devices:** 37 MOSFETs (16 NMOS, 21 PMOS)
* **Physical Gate Fingers:** 57 extracted fingers merged into 37 matched devices
* **Silicon Core Dimensions:** 215.4 µm × 135.0 µm (Area: 0.0291 mm²)
* **Bounding Box:** 450.0 µm × 175.0 µm = 0.07875 mm²

## Physical Verification Results
* **Design Rule Check (Magic DRC):** 0 Errors (100% DRC Clean)
* **Layout Versus Schematic (Netgen LVS):** Unique structural match (37/37 devices, 34/34 nets, 7/7 pins matched 1:1)
* **Parasitic Extraction (PEX):** 3D distributed R+C netlist extracted via Magic `extresist` (308 capacitors, 44 resistors)
