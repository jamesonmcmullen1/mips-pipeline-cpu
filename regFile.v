`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: regFile
//////////////////////////////////////////////////////////////////////////////////


module regFile(
    input        clk,         //clk signal
    input        wwreg,       //write enable
    input [4:0]  wdestReg,    //dest reg
    input [31:0] wbData,      //data to write
    input [4:0] rs,        // Source register 1 (bits 25:21 of dinstOut)
    input [4:0] rt,        // Source register 2 (bits 20:16 of dinstOut)
    output reg [31:0] qa,  // Output value from register rs
    output reg [31:0] qb   // Output value from register rt
);

    // Declare 32 registers, each 32 bits wide
    reg [31:0] registers [31:0];

    // Read data from the registers on any input change
    integer i;
    initial begin
		for (i=0; i<32; i=i+1) begin
		    registers[i] <= 32'b00000000000000000000000000000000;
		end	
        assign qa = registers[rs];
        assign qb = registers[rt];
    end
    
    always @(negedge clk) begin
        if (wwreg && wdestReg != 5'd0) begin
            registers[wdestReg] <= wbData;
        end
    end
endmodule
