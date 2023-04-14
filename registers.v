/*
32 registers
    - 31 general purpose regs, 1 register containing the value 0

In MIPS Assembly,
symbolic name : number
----------------------
zero : 0 // constant 0
at : 1 // reserved for assembler
v0-v1 : 2-3 // result registers
a0-a3 : 4-7 // argument registers
t0 - t9 : 8-15, 24-25 // temp registers
s0 - s7: 16-12 // saved registers
k0 - k1: 26-27 // kernel registers
gp: 28 // global data pointer
sp: 29 // stack pointer
fp: 30 // frame pointer
ra: 31 // return address
*/
module registers(
    input wire regDest,
    input wire regWrite,
    input wire [31:0] writeData, // only written if regWrite signal is ON
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] rd, // dest reg; determined by regDest
    output reg [31:0] rsData,
    output reg [31:0] rtData
);

reg [31:0] regs [31:0]; // 32 registers

initial begin
    regs[0] = 32'b0; // $0 = 0
end

always @ (rs, rt) begin
    rsData <= regs[rs];
    rtData <= regs[rt];
end

endmodule