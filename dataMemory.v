`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: dataMemory
//////////////////////////////////////////////////////////////////////////////////
module dataMemory(
    input [31:0] mr,        //mem read/write addr
    input [31:0] mqb,       //data to write
    input mwmem,            //write to mem control
    input clk,              //clk sig
    output reg [31:0] mdo   //output from data mem
);

    //memory array
    reg [31:0] memory [0:63];

    //initialize first 10 words with given values
    initial begin
        memory[0] = 32'hA00000AA;
        memory[1] = 32'h10000011;
        memory[2] = 32'h20000022;
        memory[3] = 32'h30000033;
        memory[4] = 32'h40000044;
        memory[5] = 32'h50000055;
        memory[6] = 32'h60000066;
        memory[7] = 32'h70000077;
        memory[8] = 32'h80000088;
        memory[9] = 32'h90000099;
    end

    //read on sig change
    always @(*) begin
        mdo = memory[mr[31:2]]; //convert byte address to word index
    end

    //write on negative clk edge
    always @(negedge clk) begin
        if (mwmem) begin
            memory[mr[31:2]] <= mqb;
        end
    end

endmodule
