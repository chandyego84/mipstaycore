`timescale 1ns/1ns

module im_tb;

parameter CLK_PERIOD = 10; // ns

// inputs
reg clk;
reg rst;

initial begin
    $display("im testing.");
    taylor.pc = 0;
    taylor.inst = 0;
    clk = 1;
end

// clk generator
always #((CLK_PERIOD)/2) clk <= ~clk; // 10ns

// Monitor to display current instruction
integer counter = 0;

always @(posedge clk) begin
    if (counter < 14) begin
        if (counter == 0) begin
            $display("[C], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 1) begin
            $display("[O], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
                if (counter == 2) begin
            $display("[R], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 3) begin
            $display("[N], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 4) begin
            $display("[E], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 5) begin
            $display("[L], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 6) begin
            $display("[I], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 7) begin
            $display("[A], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 8) begin
            $display("[S], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 9) begin
            $display("[T], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 10) begin
            $display("[R], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 11) begin
            $display("[E], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 12) begin
            $display("[E], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end
        if (counter == 13) begin
            $display("[T], PC: %0d, Instruction: %8h", $time, taylor.pc, taylor.inst);
        end

        taylor.pc <= taylor.pc + 1;
        counter <= counter + 1;
    end
    else begin
        $display("taylor fetching stopped after 14th boyfriend.");
        $finish;
    end
end

taylor taylor(
    .clk(clk),
    .rst(rst)
);

initial begin
    // Load instruction 1: ADDI $t0, $zero, 0x1234
    taylor.rom[0] = 32'h20081234;
    // Load instruction 2: ADDI $t1, $zero, 0xABCD
    taylor.rom[1] = 32'h2009ABCD;
    // Load instruction 3: ADD $s0, $t0, $t1
    taylor.rom[2] = 32'h01298820;
    // Load instruction 4: SUB $s1, $t0, $t1
    taylor.rom[3] = 32'h01298822;
    // Load instruction 5: AND $s2, $t0, $t1
    taylor.rom[4] = 32'h01298822;
    // Load instruction 6: OR $s3, $t0, $t1
    taylor.rom[5] = 32'h01298825;
    // Load instruction 7: SLT $s4, $t0, $t1
    taylor.rom[6] = 32'h0129882A;
    // Load instruction 8: ADDI $t2, $zero, 0x5678
    taylor.rom[7] = 32'h200A5678;
    // Load instruction 9: ADD $s5, $t1, $t2
    taylor.rom[8] = 32'h012A8820;
    // Load instruction 10: SUB $s6, $t1, $t2
    taylor.rom[9] = 32'h012A8822;
    // Load instruction 11: AND $s7, $t1, $t2
    taylor.rom[10] = 32'h012A8824;
    // Load instruction 12: OR $t3, $t1, $t2
    taylor.rom[11] = 32'h012A8825;
    // Load instruction 13: SLT $t4, $t1, $t2
    taylor.rom[12] = 32'h012A882A;
    // Load instruction 14: NOP
    taylor.rom[13] = 32'h00000000;

     // Reset romory and start simulation
    #2;
    /**
    rom <= 0;
    clk <= 0;
    #2;
    clk <= 1;
    #2;
    clk <= 0;
    #2;
    clk <= 1;
    **/
end

endmodule