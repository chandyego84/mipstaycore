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

/**Instruction Fetch**/
always @ (posedge(clk)) begin
    inst <= rom[pc];
end

/**Instruction Decode, Register Fetch**/


endmodule