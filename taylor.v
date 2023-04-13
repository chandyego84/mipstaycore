// CPU Top Block
// taylor is a low performance MIPS single-cycle processor
// 1 cycle = 1 ns = 1 instruction
// 4 KB instruction memory = 1000 instructions
module taylor(
    input clk,
    input rst
);

reg [9:0] pc; // 1000 instructions
wire [9:0] nextPc;

reg [31:0] inst; // current instruction
wire [31:0] nextInst; // next instruction; from fetchBlock

/**Instruction fields**/
wire [5:0] opcode;
wire [4:0] rs;
wire [4:0] rt;
wire [4:0] rd;
wire [4:0] shamt;
wire [5:0] funct;

wire [15:0] i_imm;

wire [25:0] j_addr;

assign nextPc = pc + 1;

fetch fetchBlock (
    .pc(pc),
    .inst(nextInst)
);

always @ (posedge(clk)) begin
    if (rst) begin
        pc <= 10'b0;
    end

    else begin
    /**Instruction Fetch**/
    inst <= nextInst;
    /**Instruction Decode, Register Fetch**/
    /*
    R-type: opcode [31:26], rs[25:21], rt[20:16], rd[15:11], shamt[10:6], funct[5:0]
    I-type: opcode [31:26], rs[25:21], rt[20:16], imm[15:0]
    J-type: opcode [31:26], addr[25:0]
    */

    /**Execution**/

    /**Memory Access**/

    /**Writeback**/

    pc <= nextPc;

    end

end

endmodule