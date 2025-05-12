`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: memwbPipelineReg
//////////////////////////////////////////////////////////////////////////////////
module memwbPipelineReg(
    input clk,                 //clk sig
    input mwreg,               //write to reg control
    input mm2reg,              //mem to reg control
    input [4:0] mdestReg,      //dest reg
    input [31:0] mr,           //alu result
    input [31:0] mdo,          //date mem output

    output reg wwreg,          //write to reg control
    output reg wm2reg,         //mem to reg control
    output reg [4:0] wdestReg, //dest reg
    output reg [31:0] wr,      //alu result
    output reg [31:0] wdo      //mem data output
);
    //set vals
    always @(posedge clk) begin
        wwreg     <= mwreg;
        wm2reg    <= mm2reg;
        wdestReg  <= mdestReg;
        wr        <= mr;
        wdo       <= mdo;
    end

endmodule
