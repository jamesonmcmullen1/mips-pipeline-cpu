`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: exememPipelineReg
//////////////////////////////////////////////////////////////////////////////////
module exememPipelineReg(
    input clk,                 //clk sig
    input ewreg,               //write to register control
    input em2reg,              //memory to register control
    input ewmem,               //write to memory control
    input [4:0] edestReg,      //dest reg
    input [31:0] r,            //alu result
    input [31:0] eqb,          //data to write to mem

    output reg mwreg,          //write to register control
    output reg mm2reg,         //memory to register control
    output reg mwmem,          //write to memory control
    output reg [4:0] mdestReg, //dest reg
    output reg [31:0] mr,      //alu result
    output reg [31:0] mqb      //data to write to mem
);
    //set vals
    always @(posedge clk) begin
        mwreg     <= ewreg;
        mm2reg    <= em2reg;
        mwmem     <= ewmem;
        mdestReg  <= edestReg;
        mr        <= r;
        mqb       <= eqb;
    end

endmodule
