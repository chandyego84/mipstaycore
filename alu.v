// ALU OPERATIONS
/**
AND = 4'b0000;
OR = 4'b0001;
NOR = 4'b1100;
ADD = 4'b0010;
SUB = 4'b0110;
SLT = 4'b0111; // set on less than
//I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS STANDARD.//
SLL = 4'b0100; // shift left
SRL = 4'b1000; // shift right
//I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS STANDARD.//
**/
module alu (
    // alu control signals
    input wire [3:0] aluControlOp,
    input wire aluSrc, // get from rtData or inst[15:0] sign-extended (imm)
    // data
    input wire [31:0] rsData,
    input wire [31:0] rtData,
    input wire [4:0] shamt,
    input wire [31:0] imm,
    output reg [31:0] result
);

parameter AND = 4'b0000;
parameter OR = 4'b0001;
parameter NOR = 4'b1100;
parameter ADD = 4'b0010;
parameter SUB = 4'b0110;
parameter SLT = 4'b0111; // set on less than
/**I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS STANDARD.**/
parameter SLL = 4'b0100; // shift left
parameter SRL = 4'b1000; // shift right
/**I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS STANDARD.**/

always @ (*) begin
    case(aluControlOp)
    ADD: begin
        result <= aluSrc ? rsData + imm : rsData + rtData; // addi or regular add
    end

    SUB: begin
        result <= rsData - rtData;
    end

    AND: begin
        result <= rsData & rtData; 
    end

    OR: begin
        result <= rsData | rtData;
    end

    NOR: begin
        result <= rsData ~| rtData;
    end

    SLT: begin
        result <= rsData < rtData;
    end

    SLL: begin
        result <= rtData << shamt;
    end

    SRL: begin
        result <= rtData >> shamt;
    end
endcase
end


endmodule