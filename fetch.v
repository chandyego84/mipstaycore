// Fetch Instruction Block
module fetch (
    input wire [9:0] pc,
    output wire [31:0] inst
);

reg [31:0] rom [0:1023]; // instruction memory

initial begin
    // Initialize instruction memory with preloaded instructions
    rom[0] = 32'h20100001; // ADDI
    rom[1] = 32'h012A4820; // ADD
    rom[2] = 32'h20100006; // ADDI
    rom[3] = 32'h012A4822; // SUB
    rom[4] = 32'h112A002A; // BEQ
    rom[5] = 32'h012A4822; // SUB
    rom[6] = 32'h112A002B; // BEQ
    rom[7] = 32'h8C0A0000; // LOAD WORD
    rom[8] = 32'h8C0A0000; // LOAD WORD
end

assign inst = rom[pc];

endmodule