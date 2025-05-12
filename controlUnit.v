`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Course: PSU CMPEN 331
// Name: Jameson McMullen
// 
// Create Date: 04/19/2025 08:05:42 PM
// Project Name: Lab 5
// Module Name: controlUnit
//////////////////////////////////////////////////////////////////////////////////


module controlUnit(
    input [5:0] op,        // Opcode (bits 31:26 of dinstOut)
    input [5:0] func,      // Function code (bits 5:0 of dinstOut, for R-types)
    output reg wreg,       // Write register enable
    output reg m2reg,      // Memory to register
    output reg wmem,       // Write memory enable
    output reg [3:0] aluc, // ALU control (4-bit operation code)
    output reg aluimm,     // ALU immediate select
    output reg regrt       // Register rt select
);

    // Control logic executed on any input change
    always @(*) begin
        case (op)
            6'b100011: begin // Load Word
                wreg = 1'b1;      // Enable register write
                m2reg = 1'b1;     // Data comes from memory
                wmem = 1'b0;      // No memory write
                aluc = 4'b0010; // ALU performs addition
                aluimm = 1'b1;    // Use immediate value for address offset
                regrt = 1'b1;     // Write to rt
            end
            6'b000000: begin //r type inst
                case (func)
                    6'b100000: begin //add
                        wreg = 1'b1;      //enable reg write
                        m2reg = 1'b0;     //write alu result
                        wmem = 1'b0;      //no memory write
                        aluc = 4'b0010;   //alu add operation
                        aluimm = 1'b0;    //use register inputs
                        regrt = 1'b0;     //write to rd
                    end
                    default: begin
                        //default vals
                        wreg = 1'b0;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluc = 4'b0000;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                    end
                endcase
            end
        endcase
    end

endmodule
