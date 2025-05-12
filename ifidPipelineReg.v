`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: ifidPipelineReg
//////////////////////////////////////////////////////////////////////////////////


module ifidPipelineReg(
    input clk,               // Clock input
    input [31:0] instOut,    // Instruction from instruction memory
    output reg [31:0] dinstOut // Delayed instruction output
);

    // On the positive edge of the clock, store the instruction
    always @(posedge clk) begin
        dinstOut <= instOut;
    end

endmodule
