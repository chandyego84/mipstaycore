module control (
    input wire [5:0] opcode,
    output reg regDest,
    output reg jump,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg memWrite,
    output reg regWrite,
    // alu controls
    output reg [1:0] aluOp,
    output reg aluSrc
);

parameter RTYPE = 6'h0; // add, sub, and, or, slt

/*I-TYPES*/
parameter ADDI = 6'h8;
parameter BEQ = 6'h4;
parameter BNE = 6'h5;
parameter LW = 6'h23;

/**J-TYPE**/
parameter JUMP = 6'h2;

/*Change control signals depending on current instruction's opcode*/
always @ (opcode) begin
    case (opcode)

    RTYPE: begin
        regDest = 1;
        regWrite = 1;
        aluSrc = 0;
        aluOp = 2'b00; // currently add, change according to r-type instruction
        memWrite = 0;
        memRead = 0;
        memToReg = 0;
        jump = 0;
        branch = 0;
        $display("RTYPE INSTRUCTION");
    end

    ADDI: begin
        regDest = 0;
        regWrite = 1;
        aluSrc = 1;
        aluOp = 2'b00; // add
        memWrite = 0;
        memRead = 0;
        memToReg = 0;
        jump = 0;
        branch = 0;
        $display("ADDI INSTRUCTION");
    end

    BEQ: begin
        regDest = 0;
        regWrite = 0;
        aluSrc = 0;
        aluOp = 2'b01; // sub
        memWrite = 0;
        memRead = 0;
        memToReg = 0;
        jump = 0;
        branch = 1;
        $display("BEQ INSTRUCTION");
    end

    BNE: begin
        regDest = 0;
        regWrite = 0;
        aluSrc = 0;
        aluOp = 2'b01; // sub
        memWrite = 0;
        memRead = 0;
        memToReg = 0;
        jump = 0;
        branch = 0;
        $display("BNE INSTRUCTION");
    end

    LW: begin
        regDest = 0;
        regWrite = 1;
        aluSrc = 1;
        aluOp = 2'b00; // add
        memWrite = 0;
        memRead = 1;
        memToReg = 1;
        jump = 0;
        branch = 0;
        $display("LW INSTRUCTION");
    end

    JUMP: begin
        regDest = 0;
        regWrite = 0;
        aluSrc = 0;
        aluOp = 3'b000;
        memWrite = 0;
        memRead = 0;
        memToReg = 0;
        jump = 1;
        branch = 0;
        $display("JUMP INSTRUCTION");
    end

    endcase
end



endmodule