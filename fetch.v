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
    im[0] = 32'h2004001b; // ADDI
    im[1] = 32'h38850005; // XORI
    im[2] = 32'h00853020; // ADD
    im[3] = 32'h00a43822; // SUB
    im[4] = 32'h00e6402a; // SLT
    im[5] = 32'h00e04825; // OR
    im[6] = 32'h00e05024; // AND
    im[7] = 32'h00075840; // SLL
    im[8] = 32'h00076042; // SRL
end

assign inst = im[pc];

endmodule