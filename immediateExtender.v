`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: immediateExtender
//////////////////////////////////////////////////////////////////////////////////


module immediateExtender(
    input [15:0] imm,      // 16-bit immediate input
    output reg [31:0] imm32 // 32-bit sign-extended output
);

    // Sign-extension logic
    always @(*) begin
        imm32 = {{16{imm[15]}}, imm[15:0]}; // Extend sign bit
    end

endmodule
