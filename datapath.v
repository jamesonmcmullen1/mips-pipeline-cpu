`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: datapath
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input clk,                // Clock input
    output [31:0] pc,         // Program Counter output
    output [31:0] dinstOut,   // Output from IF/ID Pipeline Register
    output ewreg, em2reg, ewmem, ealuimm, // Control signals from ID/EXE Pipeline Register
    output [3:0] ealuc,       // ALU Control Signals from ID/EXE
    output [4:0] edestReg,    // Destination Register from ID/EXE
    output [31:0] eqa, eqb, eimm32, // Register Values and Immediate from ID/EXE
    
    output mwreg, mm2reg, mwmem, //write to reg control, mem to reg control, write to mem control
    output [4:0] mdestReg, //dest reg
    output [31:0] mr, mqb, mdo, //alu result, data to write to mem, data mem output
    output wwreg, wm2reg, //mem to reg control
    output [4:0] wdestReg, //dest reg
    output [31:0] wr, wdo, //alu result, mem data output
    output [31:0] wbData  //write back data
    
);

    // Internal Wires
    (* keep = "true" *) wire [31:0] nextPC, instOut, imm32, qa, qb;
    (* keep = "true" *) wire [5:0] op, func;
    (* keep = "true" *) wire wreg, m2reg, wmem, aluimm, regrt;
    (* keep = "true" *) wire [3:0] aluc;
    (* keep = "true" *) wire [4:0] rt, rd, destReg;
    //new wire connections
    (* keep = "true" *) wire [31:0] b, r;
    (* keep = "true" *) wire mwreg, mm2reg, mwmem;
    (* keep = "true" *) wire [4:0] mdestReg;
    (* keep = "true" *) wire [31:0] mr, mqb, mdo;
    (* keep = "true" *) wire wwreg, wm2reg;
    (* keep = "true" *) wire [4:0] wdestReg;
    (* keep = "true" *) wire [31:0] wr, wdo;
    (* keep = "true" *) wire [31:0] wbData;

    // Instantiate Program Counter
    programCounter pc_inst (
        .clk(clk),
        .nextPC(nextPC),
        .pc(pc)
    );

    // Instantiate PC Adder
    pcAdder pc_adder_inst (
        .pc(pc),
        .nextPc(nextPC)
    );

    // Instantiate Instruction Memory
    instructionMemory instr_mem_inst (
        .pc(pc),
        .instOut(instOut)
    );

    // Instantiate IF/ID Pipeline Register
    ifidPipelineReg ifid_inst (
        .clk(clk),
        .instOut(instOut),
        .dinstOut(dinstOut)
    );

    // Extract opcode and function code from dinstOut
    assign op = dinstOut[31:26];
    assign func = dinstOut[5:0];

    // Extract register addresses
    assign rt = dinstOut[20:16];
    assign rd = dinstOut[15:11];

    // Instantiate Control Unit
    controlUnit control_unit_inst (
        .op(op),
        .func(func),
        .wreg(wreg),
        .m2reg(m2reg),
        .wmem(wmem),
        .aluc(aluc),
        .aluimm(aluimm),
        .regrt(regrt)
    );

    // Instantiate RegRt Multiplexer
    regrtMux reg_rt_mux_inst (
        .rt(rt),
        .rd(rd),
        .regrt(regrt),
        .destReg(destReg)
    );

    // Instantiate Register File
    regFile reg_file_inst (
        .clk(clk),
        .wwreg(wwreg),
        .wdestReg(wdestReg),
        .wbData(wbData),
        .rs(dinstOut[25:21]),  // Register source 1
        .rt(rt),               // Register source 2
        .qa(qa),
        .qb(qb)
    );

    // Instantiate Immediate Extender
    immediateExtender imm_extender_inst (
        .imm(dinstOut[15:0]),
        .imm32(imm32)
    );

    // Instantiate ID/EXE Pipeline Register
    idexePipelineReg idexe_inst (
        .clk(clk),
        .wreg(wreg),
        .m2reg(m2reg),
        .wmem(wmem),
        .aluc(aluc),
        .aluimm(aluimm),
        .destReg(destReg),
        .qa(qa),
        .qb(qb),
        .imm32(imm32),
        .ewreg(ewreg),
        .em2reg(em2reg),
        .ewmem(ewmem),
        .ealuc(ealuc),
        .ealuimm(ealuimm),
        .edestReg(edestReg),
        .eqa(eqa),
        .eqb(eqb),
        .eimm32(eimm32)
    );
    
    //instantiate alu mux
    aluMux alu_mux_inst (
        .eqb(eqb),
        .eimm32(eimm32),
        .ealuimm(ealuimm),
        .b(b)
    );
    
    //instantiate alu
    alu alu_inst (
        .eqa(eqa),
        .b(b),
        .ealuc(ealuc),
        .r(r)
    );
    
    //instantiate exememPipelineReg
    exememPipelineReg exemem_inst (
        .clk(clk),
        .ewreg(ewreg),
        .em2reg(em2reg),
        .ewmem(ewmem),
        .edestReg(edestReg),
        .r(r),
        .eqb(eqb),
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mwmem(mwmem),
        .mdestReg(mdestReg),
        .mr(mr),
        .mqb(mqb)
    );
    
    //instantiate dataMemory
    dataMemory data_mem_inst (
        .mr(mr),
        .mqb(mqb),
        .mwmem(mwmem),
        .clk(clk),
        .mdo(mdo)
    );

    //instantiate memwbPipelineReg
    memwbPipelineReg memwb_inst (
        .clk(clk),
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mdestReg(mdestReg),
        .mr(mr),
        .mdo(mdo),
        .wwreg(wwreg),
        .wm2reg(wm2reg),
        .wdestReg(wdestReg),
        .wr(wr),
        .wdo(wdo)
    );
    
    //instantiate wbMux
    wbMux wb_mux_inst (
        .wr(wr),
        .wdo(wdo),
        .wm2reg(wm2reg),
        .wbData(wbData)
    );

endmodule
