// CPU Top Block
// taylor is a low performance MIPS single-cycle processor
// 1 cycle = 1 ns = 1 instruction
// 4 KB instruction memory = 1000 instructions
module taylor(
    input clk,
    input rst
);

reg [9:0] pc; // 1000 instructions
wire [9:0] nextPc; // next program counter value; currently w/out branching or jumps

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

assign rs = inst[25:21];
assign rt = inst[20:16];
assign rd = inst[15:11];
assign i_imm = inst[15:0]; // need to sign-extend to 32 bits
assign j_addr = inst[25:0]; // need to perform: (PC + 4[31:28]) << 2 = 32 bits

/**Controller**/
wire [1:0] aluOp;
wire regDest;
wire jump;
wire branch;
wire memRead;
wire memToReg;
wire memWrite;
wire regWrite;

/**ALU Control Unit**/
wire [3:0] aluControlOp;

assign opcode = inst[31:26];
assign funct = inst[5:0];
assign nextPc = pc + 1;

/**Register Unit**/
wire [31:0] writeData;
wire [31:0] rsData;
wire [31:0] rtData;

/**Fetch Instruction**/
fetch fetchBlock(
    .pc(pc),
    .inst(nextInst)
);

/**Register Unit**/
registers regUnit(
    .regDest(regDest),
    .regWrite(regWrite),
    .writeData(writeData),
    .rs(rs),
    .rt(rt),
    .rd(rd),
    .rsData(rsData),
    .rtData(rtData)
);

/**Alter control signals based on instruction**/
control controller(
    .opcode(opcode),
    .aluOp(aluOp)
);

/**ALU Control**/
aluControl aluControlUnit(
    .aluOp(aluOp),
    .funct(funct),
    .aluControlOp(aluControlOp)
);

always @ (posedge(clk)) begin
    if (rst) begin
        pc <= 10'b0;
    end

    else begin
    //$display("[%0d]: Instruction %h, rsData %d, PC %0d ", $time, nextInst, rsData, pc);
    /**Instruction Fetch**/
    inst <= nextInst;

    /**Instruction Decode**/
    /*
    R-type: opcode [31:26], rs[25:21], rt[20:16], rd[15:11], shamt[10:6], funct[5:0]
    I-type: opcode [31:26], rs[25:21], rt[20:16], imm[15:0]
    J-type: opcode [31:26], addr[25:0]
    */

    /**Execution**/

    /**Memory Access**/

    /**Writeback**/

    // updating pc
    pc <= nextPc;

    end

end

endmodule