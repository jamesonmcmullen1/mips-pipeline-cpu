# MIPS Pipelined CPU (5-Stage) — CMPEN 331 Final Project

This project showcases my Verilog implementation of a five-stage pipelined MIPS CPU, developed over the course of three labs for **CMPEN 331: Computer Organization and Design** at Penn State (Spring 2025). The processor is built using modular components and simulates instruction flow through the classic MIPS stages: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB).

All design, simulation, and verification were performed in the **Xilinx Vivado** environment.

---

##Project Highlights

###**Instruction Fetch (IF)**  
- Program Counter (`programCounter.v`)  
- Instruction Memory (`instructionMemory.v`)  
- PC Adder and IF/ID pipeline register  

###**Instruction Decode (ID)**  
- Control Unit for R-type and Load Word instructions  
- Register File with 32 registers (`regFile.v`)  
- Sign-extender for immediate values  
- ID/EXE pipeline register for signal handoff  

###**Execution (EX)**  
- ALU (`alu.v`) with support for add, sub, and logic operations  
- ALU input multiplexer (`aluMux.v`)  
- EX/MEM pipeline register  

###**Memory Access (MEM)**  
- Data Memory module with read/write capability  
- MEM/WB pipeline register  

###**Write Back (WB)**  
- `wbMux.v` module to select between ALU and memory outputs  
- Full register writeback support with correct control signal propagation  

---

##What I Learned

- How pipelined CPUs maintain parallelism and improve throughput  
- Verilog HDL syntax, testbench creation, and module hierarchy  
- Designing synchronous circuits with clock-sensitive behavior  
- Timing verification, control signal propagation, and modular abstraction  
- Debugging with waveform simulation and iterative design testing  

---

##File Structure

| File/Module            | Description                                  |
|------------------------|----------------------------------------------|
| `datapath.v`           | Top-level integration of all stages          |
| `programCounter.v`     | Updates PC on clock edge                     |
| `instructionMemory.v`  | Byte-addressable instruction memory          |
| `controlUnit.v`        | Generates control signals based on opcode    |
| `regFile.v`            | 32-register memory with read/write support   |
| `alu.v`                | Executes arithmetic and logic operations     |
| `aluMux.v`             | Chooses between register and immediate value |
| `wbMux.v`              | Selects write-back source                    |
| `*_PipelineReg.v`      | Stage-to-stage registers (IF/ID, ID/EXE, etc.) |
| `dataMemory.v`         | Simulates memory read/write in MEM stage     |
| `testbench.v`          | Drives simulation for the full datapath      |

---

##Simulation & Results

All stages were verified using Vivado waveform simulation. Key behaviors confirmed:

- Accurate instruction fetching and register decoding  
- Correct ALU output and memory access operations  
- Final register updates for both Load Word and R-type instructions  
- Successful propagation of control signals across pipeline stages  

---

##Disclaimer

This repository includes **only original work** I wrote as part of my individual lab assignments. Instructor-provided files, lab PDFs, and proprietary test inputs have been excluded in accordance with academic policy.

---

##Contact

**Jameson McMullen**  
Computer Engineering @ Penn State  
[LinkedIn](www.linkedin.com/in/jameson-mcmullen-472669325)  
GitHub: [@jamesonmcmullen1](https://github.com/jamesonmcmullen1)
