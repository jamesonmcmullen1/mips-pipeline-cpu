`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: alu
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [31:0] eqa,         //register source 1 value
    input [31:0] b,           //value from alu mux
    input [3:0] ealuc,        //alu control signal
    output reg [31:0] r       //alu result
);

    //perform operation based on alu control
    always @(*) begin
        case (ealuc)
            4'b0000: r = eqa & b;         //and
            4'b0001: r = eqa | b;         //or
            4'b0010: r = eqa + b;         //add
            4'b0110: r = eqa - b;         //sub
            4'b0111: r = (eqa < b) ? 32'd1 : 32'd0; //slt
            4'b1100: r = ~(eqa | b);      //nor
            default: r = 32'd0;           //default r to 0
        endcase
    end

endmodule
