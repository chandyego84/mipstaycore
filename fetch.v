// Fetch Instruction Block
module fetch (
    input wire [9:0] pc,
    output wire [31:0] inst
);

// TODO: Make address byte-addressable, word-aligned? or is this for data memory?
    // Each address = 8-bit byte
    // Address must be a multiple of 4 to access
reg [31:0] im [0:1023]; // instruction memory

initial begin
    // Initialize instruction memory with preloaded instructions
    im[0] = 32'h20100001; // ADDI
    im[1] = 32'h012A4820; // ADD
    im[2] = 32'h20100006; // ADDI
    im[3] = 32'h012A4822; // SUB
    im[4] = 32'h112A002A; // BEQ
    im[5] = 32'h012A4822; // SUB
    im[6] = 32'h112A002B; // BEQ
    im[7] = 32'h8C0A0000; // LOAD WORD
    im[8] = 32'h8C0A0000; // LOAD WORD
end

assign inst = im[pc];

endmodule