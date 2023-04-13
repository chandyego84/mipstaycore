module control (
    input reg opcode,
    output wire regDest,
    output  wire jump,
    output wire branch,
    output wire memRead,
    output wire memToReg,
    output wire memWrite,
    output wire regWrite,
    // alu controls
    output wire [2:0] aluOp,
    output wire aluSrc
);



endmodule