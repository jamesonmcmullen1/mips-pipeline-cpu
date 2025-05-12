`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: indexePipelineReg
//////////////////////////////////////////////////////////////////////////////////


module idexePipelineReg(
    input clk,             // Clock signal
    input wreg,            // Write register enable
    input m2reg,           // Memory to register control
    input wmem,            // Write memory enable
    input [3:0] aluc,      // ALU control signals
    input aluimm,          // ALU immediate select
    input [4:0] destReg,   // Destination register
    input [31:0] qa,       // Register file read data 1
    input [31:0] qb,       // Register file read data 2
    input [31:0] imm32,    // Sign-extended immediate value

    output reg ewreg,      // Pipeline register output: wreg
    output reg em2reg,     // Pipeline register output: m2reg
    output reg ewmem,      // Pipeline register output: wmem
    output reg [3:0] ealuc, // Pipeline register output: aluc
    output reg ealuimm,    // Pipeline register output: aluimm
    output reg [4:0] edestReg, // Pipeline register output: destReg
    output reg [31:0] eqa, // Pipeline register output: qa
    output reg [31:0] eqb, // Pipeline register output: qb
    output reg [31:0] eimm32 // Pipeline register output: imm32
);

    // On the positive edge of the clock, update pipeline registers
    always @(posedge clk) begin
        ewreg <= wreg;
        em2reg <= m2reg;
        ewmem <= wmem;
        ealuc <= aluc;
        ealuimm <= aluimm;
        edestReg <= destReg;
        eqa <= qa;
        eqb <= qb;
        eimm32 <= imm32;
    end

endmodule

