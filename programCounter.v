`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: programCounter
//////////////////////////////////////////////////////////////////////////////////


module programCounter(
    input clk,             // Clock signal
    input [31:0] nextPC,   // Next PC value
    output reg [31:0] pc   // Current PC value
);

    // Initialize PC to decimal 100
    initial begin
        pc = 32'd100;
    end

    // Update PC on the positive edge of the clock
    always @(posedge clk) begin
        pc <= nextPC;
    end

endmodule
