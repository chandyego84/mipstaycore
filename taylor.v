// CPU Top Block
// taylor is a low performance MIPS single-cycle processor
// 1 cycle = 1 ns = 1 instruction
// 4 KB instruction memory = 1000 instructions
module taylor(
    input clk,
    input rst,
    output reg [9:0] pc // 1000 instructions
);

always @(posedge clk) begin
    if (rst) begin
        pc <= 10'b0;
    end
end

reg [31:0] rom [0:1023]; // instruction memory
reg [31:0] inst; // current instruction

/**Instruction types**/
reg [5:0] opcode;
reg [4:0] rs;
reg [4:0] rt;
reg [4:0] rd;
reg [4:0] shamt;
reg [5:0] funct;

reg [15:0] i_imm;

reg [25:0] j_addr;

always @ (posedge(clk)) begin
    /**Instruction Fetch**/
    inst <= rom[pc];
    pc <= pc + 1;

    /**Instruction Decode, Register Fetch**/
    /*
    R-type: opcode [31:26], rs[25:21], rt[20:16], rd[15:11], shamt[10:6], funct[5:0]
    I-type: opcode [31:26], rs[25:21], rt[20:16], imm[15:0]
    J-type: opcode [31:26], addr[25:0]
    */
    opcode <= rom[pc][31:26];

    /////$display("T: %0d, PC: %0d, OPCODE: %0h", $time, pc, opcode);

    case (opcode)
    // R-type
    6'h0: begin
        $display("R-Type Instruction: %h\n", inst);
    end
    // addi
    6'h8: begin 
        $display("Addi Instruction: %h\n", inst);
    end
    // addiu
    6'h9: begin
        $display("Addiu Instruction: %h\n", inst);
    end
    // andi
    6'hc: begin
        $display("Andi Instruction: %\n", inst);
    end
    // beq
    6'h4: begin
        $display("Beq Instruction: %h\n", inst);
    end
    // bne
    6'h5: begin
        $display("Addiu Instruction: %h\n", inst);
    end
    // lw
    6'h23: begin
        $display("Lw Instruction: %h\n", inst);
    end
    6'h2b: begin
        $display("Sw Instruction: %h\n", inst);
    end
    // ori
    6'hd: begin
        $display("Ori Instruction: %h\n", inst);
    end
    endcase
end

endmodule