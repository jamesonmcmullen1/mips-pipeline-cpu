`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: aluMux
//////////////////////////////////////////////////////////////////////////////////
module aluMux(
    input [31:0] eqb,         //register value second source
    input [31:0] eimm32,      //sign extended imm value
    input ealuimm,            //alu imm control value
    output reg [31:0] b       //input to alu
);

    //choose between eqb and eimm32
    always @(*) begin
        b = (ealuimm) ? eimm32 : eqb;
    end

endmodule
