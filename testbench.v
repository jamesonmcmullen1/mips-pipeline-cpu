`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: testbench
//////////////////////////////////////////////////////////////////////////////////


module testbench;

    // Clock signal
    reg clk;

    // Wires to capture Datapath outputs
    wire [31:0] pc;
    wire [31:0] dinstOut;
    wire ewreg, em2reg, ewmem, ealuimm;
    wire [3:0] ealuc;
    wire [4:0] edestReg;
    wire [31:0] eqa, eqb, eimm32;
    wire mwreg, mm2reg, mwmem;
    wire [4:0] mdestReg;
    wire [31:0] mr, mqb;
    wire wwreg, wm2reg;
    wire [4:0] wdestReg;
    wire [31:0] wr, wdo;
    wire [31:0] wbData;

    // Instantiate the Datapath module
    datapath datapath (
        .clk(clk),
        .pc(pc),
        .dinstOut(dinstOut),
        .ewreg(ewreg),
        .em2reg(em2reg),
        .ewmem(ewmem),
        .ealuc(ealuc),
        .ealuimm(ealuimm),
        .edestReg(edestReg),
        .eqa(eqa),
        .eqb(eqb),
        .eimm32(eimm32),
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mwmem(mwmem),
        .mdestReg(mdestReg),
        .mr(mr),
        .mqb(mqb),
        .wwreg(wwreg),
        .wm2reg(wm2reg),
        .wdestReg(wdestReg),
        .wr(wr),
        .wdo(wdo),
        .wbData(wbData)
    );

    // Clock Generation
    initial begin
        clk = 0; // Initialize clock to 0
    end

    always begin
        #1;
        clk = ~clk;
    end

endmodule

