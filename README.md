
# Single-Cycle RISC-V Processor in Verilog

## Overview

This project implements a **32-bit Single-Cycle RISC-V Processor** in Verilog HDL. The processor executes each instruction within a single clock cycle and demonstrates the fundamental architecture of a RISC-V processor, including instruction fetch, decode, execution, memory access, and write-back stages.

The processor was designed using a modular approach and verified through simulation in **ModelSim**.


## Features

- 32-bit Single-Cycle RISC-V Processor
- Modular Verilog implementation
- Byte-addressable instruction and data memory
- Register File with 32 general-purpose registers
- ALU supporting arithmetic, logical, and comparison operations
- Immediate Generator for different instruction formats
- Main Control Unit
- Branch Control Logic
- ModelSim Testbench for functional verification


## Supported Instructions

| Instruction | Description |
|------------|-------------|
| LW | Load Word |
| SW | Store Word |
| OR | Bitwise OR |
| SLT | Set Less Than |
| BEQ | Branch if Equal |



## Processor Architecture

The processor consists of the following modules:

- Program Counter (PC)
- Instruction Memory
- Register File
- Immediate Generator
- ALU
- Data Memory
- Main Decoder
- ALU Control Unit
- Branch Logic
- Result Multiplexer



## Tool Used

- ModelSim


## Simulation

The processor was verified using a dedicated Verilog testbench.

The simulation demonstrates:

- Program Counter increment and branch operation
- Instruction decoding
- Register read/write operations
- ALU functionality
- Data memory read/write
- Branch decision logic


## Test Program

The instruction memory is preloaded with machine code implementing:

- Load Word (LW)
- Store Word (SW)
- OR
- SLT
- BEQ

The processor executes these instructions sequentially and verifies correct functionality through simulation.


## Results

The implemented processor successfully:

- Executes all supported instructions correctly
- Generates appropriate control signals
- Performs arithmetic and logical operations
- Reads and writes data memory
- Updates the Program Counter during branch execution
- Successfully completes simulation in ModelSim


## Future Improvements

- Support complete RV32I instruction set
- Add ADD, SUB, XOR, AND instructions
- Implement Jump (JAL/JALR)
- Pipeline the processor
- Hazard Detection Unit
- Forwarding Unit
- Branch Prediction
- Cache Memory



## Learning Outcomes

Through this project, I gained practical experience in:

- Computer Architecture
- RISC-V Instruction Set Architecture
- Verilog HDL
- RTL Design
- Control Unit Design
- Datapath Design
- Functional Verification
- ModelSim Simulation



## Author

**Fathima Noura P P**

