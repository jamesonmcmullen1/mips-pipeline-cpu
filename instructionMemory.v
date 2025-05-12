`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: instructionMemory
//////////////////////////////////////////////////////////////////////////////////


module instructionMemory(
    input [31:0] pc,         // Program counter input (byte-addressed)
    output reg [31:0] instOut // Instruction output
);

    // Define a 32-bit wide, 64-word memory array (32x64)
    reg [31:0] memory [63:0];

    // Initialize instruction memory with specific values
    initial begin
        // Store instructions at word addresses 25 through 28
        memory[25] = 32'h8C220000;
        memory[26] = 32'h8C230004;
        memory[27] = 32'h8C240008;
        memory[28] = 32'h8C25000C;
        memory[29] = 32'h004A3020;
    end

    // Fetch instruction based on word-addressed memory lookup
    always @(*) begin
        instOut = memory[pc[31:2]]; // Convert byte address to word address
    end

endmodule
