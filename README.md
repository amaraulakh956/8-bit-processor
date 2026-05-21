![VHDL](https://img.shields.io/badge/VHDL-Design-blue?style=for-the-badge)
![Quartus](https://img.shields.io/badge/Quartus-Prime-red?style=for-the-badge)
![FPGA](https://img.shields.io/badge/Altera-FPGA-green?style=for-the-badge)

# 8-Bit General Purpose Processor — VHDL

A simple 8-bit general purpose processor designed and implemented in VHDL, synthesized and tested on an Altera FPGA board using Intel Quartus Prime.

## Overview

This project implements a complete 8-bit processor consisting of four main components — an ALU core, a control unit, storage latches, and a 7-segment display decoder — all connected via a shared bus and port mapped into a complete working processor.

## Architecture

The processor is divided into the following components:

### ALU Core (ALU1.vhd)
Performs 9 arithmetic and logical operations on two 8-bit inputs A and B:

| Operation | Description |
|---|---|
| ADD | A + B |
| SUB | A - B (with negative flag) |
| NOT | Bitwise NOT of A |
| NAND | Bitwise NAND of A and B |
| NOR | Bitwise NOR of A and B |
| AND | Bitwise AND of A and B |
| XOR | Bitwise XOR of A and B |
| OR | Bitwise OR of A and B |
| XNOR | Bitwise XNOR of A and B |

### Control Unit
- **Synchronous Upcounter** — counts clock cycles and drives the decoder
- **4-to-16 Decoder (dec4to16.vhd)** — decodes the counter output into 16-bit one-hot encoded selector signals for the ALU

### Storage Unit (latch1.vhd)
D flip-flop based latches with synchronous reset used to temporarily store the 8-bit input values A and B until released to the ALU.

### FSM (fsm1.vhd)
A finite state machine with 9 states that outputs student ID digits sequentially on each clock cycle when data_in is high.

### 7-Segment Display Decoder (sseg.vhd)
Decodes 4-bit BCD values to 7-segment display output. Supports all hex digits 0-F and includes a sign indicator for negative results.

## Tools Used
- **Intel Quartus Prime** — synthesis, simulation and FPGA programming
- **ModelSim** — functional simulation and waveform verification
- **Altera DE2 FPGA Board** — hardware implementation and testing

## Pin Assignments
| Signal | FPGA Pin |
|---|---|
| A[7:0] | SW[7:0] |
| B[7:0] | SW[15:8] |
| R[7:0] | LEDG[7:0] |
| Clock | Push button |
| Reset | SW[17] |

## Results
The processor was successfully synthesized, simulated and programmed onto the Altera FPGA board. All 9 ALU operations were verified through functional simulation in ModelSim and demonstrated on hardware.
