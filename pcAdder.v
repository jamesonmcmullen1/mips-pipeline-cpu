`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: pcAdder
//////////////////////////////////////////////////////////////////////////////////


module pcAdder(
    input [31:0] pc,       // Current PC value
    output reg [31:0] nextPc // Next PC value
);

    // Combinational logic: Add 4 to PC on any change
    always @(*) begin
        nextPc = pc + 32'd4;
    end

endmodule
