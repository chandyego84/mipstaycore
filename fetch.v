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
    // For testing: Initialize instruction memory with preloaded instructions
    im[0] = 32'h20020005; // addi $2, $0, 5	-- $v0 = 5
    im[1] = 32'h20070003; // addi $7, $0, 3 -- $a3 = 3
    im[2] = 32'h20840003; // addi $4, $0, 3 -- $a0 = 3             
    im[3] = 32'h00e22025; // or $4, $7, $2 -- $a0 = $v0 or $a0 = 3
    im[4] = 32'h00642824; // and $5, $3, $4 -- $a1 = $v1 and $a0 = 0
    im[5] = 32'h00a42820; // add $5, $5, $4 -- $a1 = $a1 + $a0 = 3
    im[6] = 32'h0064302a; // slt $6, $3, $4 -- 
    im[7] = 32'h2005000a; // addi $5, $0, 10 -- 
    im[8] = 32'h00c53820; // add $7, $6, $5 -- 
    im[9] = 32'h00e23822; // sub $7, $7, $2 -- 
end

assign inst = im[pc];

endmodule