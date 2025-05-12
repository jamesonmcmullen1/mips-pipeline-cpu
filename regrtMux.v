`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: RegMux
//////////////////////////////////////////////////////////////////////////////////


module regrtMux(
    input [4:0] rt,       // Register rt (bits 20:16 of dinstOut)
    input [4:0] rd,       // Register rd (bits 15:11 of dinstOut)
    input regrt,          // Multiplexer control signal
    output reg [4:0] destReg // Destination register output
);

    // Multiplexer logic: Choose between rd and rt based on regrt signal
    always @(*) begin
        destReg = (regrt) ? rt : rd;
    end

endmodule
