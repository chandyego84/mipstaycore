// ALU OPERATIONS
/**
AND = 4'b0000;
OR = 4'b0001;
NOR = 4'b1100;
ADD = 4'b0010;
SUB = 4'b0110;
SLT = 4'b0111; // set on less than
//I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS CORRECT/STANDARD.//
SLL = 4'b0100; // shift left
SRL = 4'b1000; // shift right
//I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS CORRECT/STANDARD.//
**/
module alu (
    // alu control signals
    input wire [1:0] aluOp,
    input wire aluSrc, // get from data2 or inst[15:0] sign-extended
    // data
    input wire [31:0] data1,
    input wire [31:0] data2,
    input wire [31:0] imm,
    output reg [31:0] result
);

parameter AND = 4'b0000;
parameter OR = 4'b0001;
parameter NOR = 4'b1100;
parameter ADD = 4'b0010;
parameter SUB = 4'b0110;
parameter SLT = 4'b0111; // set on less than
/**I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS CORRECT/STANDARD.**/
parameter SLL = 4'b0100; // shift left
parameter SRL = 4'b1000; // shift right
/**I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS CORRECT/STANDARD.**/

always @ (*) begin
    case(aluOp)
    ADD: begin
        result <= aluSrc ? data1 + imm : data1 + data2; // addi or regular add
    end

    SUB: begin
        result <= data1 - data2;
    end

    AND: begin
        result <= data1 & data2; 
    end

    OR: begin
        result <= data1 | data2;
    end

    NOR: begin
        result <= data1 ~| data2;
    end

    SLT: begin
        result <= data1 < data2;
    end

    SLL: begin
        result <= data1 << data2;
    end

    SRL: begin
        result <= data1 >> data2;
    end
endcase
end


endmodule