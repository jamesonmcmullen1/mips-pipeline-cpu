`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: wbMux
//////////////////////////////////////////////////////////////////////////////////
module wbMux (
    input  wire [31:0] wr,       //alu result
    input  wire [31:0] wdo,      //data mem output
    input  wire        wm2reg,  //wb control signal
    output wire [31:0] wbData   //data to write into regfile
);

    //alu result or data mem output
    assign wbData = (wm2reg == 1'b0) ? wr : wdo;

endmodule
