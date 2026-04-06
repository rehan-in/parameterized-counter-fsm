# Parameterized Counter using FSM (SystemVerilog)

## Project Overview

This project presents the **design and verification of a parameterized digital counter** using **Finite State Machine (FSM)** concepts in **SystemVerilog**.

The design follows a **control–datapath architecture**, where:

* FSM controls the operation of the counter
* Datapath performs the counting logic

The counter supports **up/down counting, start/stop control, and configurable width**, making it reusable and scalable for digital systems.

---

## Features

* Parameterized counter width
* FSM-based control logic
* Start / Stop functionality
* Enable signal control
* Up-count and Down-count modes
* Configurable maximum count value
* Modular RTL design

---

## System Architecture

The design consists of three main modules:

1. **Top Module (`counter_top.sv`)**

   * Integrates FSM and datapath

2. **Control FSM (`control_fsm.sv`)**

   * Generates `run` signal
   * Controls counter operation

3. **Datapath (`counter_datapath.sv`)**

   * Implements counting logic
   * Supports up/down counting

---

## FSM States

* **IDLE** → Waiting for start signal
* **RUN** → Counter is active
* **STOP** → Counter halted

---

## Testbench Features

* Clock generation
* Reset sequence
* Start/Stop control
* Mode switching (Up/Down)
* Output monitoring

---

## Test Cases

| Test Case  | Description        |
| ---------- | ------------------ |
| Up Count   | Counter increments |
| Down Count | Counter decrements |
| Stop       | Counter halts      |
| Resume     | Counter continues  |

---

## Tools & Technologies

* **Language:** SystemVerilog
* **Simulator:** Xilinx Vivado Simulator
* **Design Methodology:** RTL Design & Verification
* **Synthesis Tool:** Xilinx Vivado

---

## Results

* Correct FSM transitions
* Accurate up/down counting
* No timing violations
* Efficient FPGA resource usage

---

## Applications

* Digital timers
* Frequency dividers
* Event counters
* Embedded systems
* FPGA-based designs

---

## Future Improvements

* Overflow detection
* Programmable range
* Interrupt generation
* UVM-based verification
* FPGA board implementation

---

## Project Structure

---
Parameterized-Counter-FSM
 ┣ RTL
 ┃ ┣ counter_top.sv
 ┃ ┣ control_fsm.sv
 ┃ ┗ counter_datapath.sv
 ┣ TB
 ┃ ┗ counter_tb.sv
 ┣ Reports
 ┃ ┗ Parameterized Counter using FSM.pdf
 ┗ README.md
---

## Author

**Mohammad Rehan**
**B.Tech(3rd Year)**
