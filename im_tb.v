`timescale 1ns/1ns

module im_tb;

parameter CLK_PERIOD = 10; // ns

// inputs
reg clk;
reg rst;

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,im_tb);

    $display("im testing.\n");

    rst = 0;
    clk = 0;

    taylor.pc = 0;

end

// clk generator
always #((CLK_PERIOD)/2) clk <= ~clk; // 10ns

// Monitor to display current instruction
integer counter = 0;

always @(posedge clk) begin
    if (counter < 9) begin
        //$display("[%0d], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        counter <= counter + 1;
    end
    else begin
        $display("taylor fetching stopped.");
        $finish;
    end
end

taylor taylor(
    .clk(clk),
    .rst(rst)
);

endmodule