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

HOW DO I TEST THIS??? GOODNESS GRACIOUS.
*/
module registers(
    input wire regDest,
    input wire regWrite,
    input wire [31:0] writeData, // only written if regWrite signal is ON
    input wire [4:0] rs, // rs address
    input wire [4:0] rt, // rt address
    input wire [4:0] rd, // rd address; deteremined by regDest
    output reg [31:0] rsData,
    output reg [31:0] rtData
);

reg [31:0] regs [31:0]; // 32 registers, one word each
reg [4:0] writeReg; // address of reg to write to

integer r;
initial begin
    // TODO: Ensure register $0 CANNOT be changed. must stay $zero
    for (r = 0; r < 32; r = r + 1) begin
        regs[r] = 32'b0;
    end
end

always @ (rs, rt) begin
    writeReg = regDest ? rd : rt;

    // TOOD: DOES NOT WORK UNTIL REGISTERS ACTUALLY WRITTEN INTO
    rsData <= regs[rs];
    rtData <= regs[rt];
end

always @ (writeData) begin
    if (regWrite == 1'b1)
        regs[writeReg] = writeData;
end

endmodule