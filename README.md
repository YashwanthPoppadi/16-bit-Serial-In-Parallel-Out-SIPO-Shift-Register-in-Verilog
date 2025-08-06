# 🔄 16-bit Serial-In Parallel-Out (SIPO) Shift Register using Verilog

## 📌 Project Overview
This project implements a 16-bit Serial-In Parallel-Out (SIPO) shift register using Verilog HDL. The design follows a **modular and hierarchical approach**, built from reusable 4-bit SIPO blocks, each composed of D flip-flops with asynchronous reset. It enables the conversion of a serial data stream into a 16-bit parallel output over successive clock cycles.

---

## ⚙️ Architecture

- **Base Module**: D Flip-Flop with asynchronous reset
- **Mid-level Module**: 4-bit SIPO register (4 DFFs cascaded)
- **Top-level Module**: 16-bit SIPO (4 x 4-bit SIPO blocks chained)

Each bit is shifted in at the least significant bit (LSB) and propagates toward the most significant bit (MSB) with each clock pulse.

---

## 🧠 Key Concepts

- Modular RTL design
- Serial-to-parallel data conversion
- Positive edge-triggered D flip-flops
- Asynchronous reset
- Scalable and hierarchical hardware development

---

## 📁 File Structure
├── df.v # D Flip-Flop with asynchronous reset
├── SIPO_4bit.v # 4-bit SIPO register
├── SIPO_16bit.v # 16-bit SIPO top module
├── testbench.v # Testbench for functional simulation
├── waveform.png # Simulation waveform screenshot
├── README.md # Project documentation

---

## 🧪 Simulation

This design was simulated using **[Tool: Vivado]**.

### ✅ Expected Behavior

- On reset (`reset = 1`), all output bits are cleared.
- On every positive edge of `clk`, a new bit is shifted in from `serial_in`.
- After 16 clock cycles, the `parallel_out` port contains the full 16-bit shifted-in data.

### 📸 Sample Waveform

![Waveform](SISO_16bit_behav.wcfg)

---

## 🛠️ Tools Used

- **Language**: Verilog HDL
- **Simulator**: Xilinx Vivado 
- **Target Platform**: Behavioral simulation only (can be synthesized for FPGA/ASIC)

---

## 🚀 How to Run

1. Clone this repository  
   ```bash
   git clone https://github.com/YOUR_USERNAME/SIPO-16bit-Verilog.git
   cd SIPO-16bit-Verilog
2. Open the project in your simulation tool

3. Run the testbench:

    Compile df.v, SIPO_4bit.v, SIPO_16bit.v, and testbench.v

    View waveform to verify serial-to-parallel conversion




