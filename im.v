// Instruction Memory Block
// 4 KB Memory, 32 bits/instruction
module im(
    input clk,
    input reg [31:0] mem [0:1023],
    output reg [31:0] inst
);

always @(posedge clk) begin
    instruction <= mem[pc >> 2]; // byte-addressable
end

endmodule