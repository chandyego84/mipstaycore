// ALU Control Unit: determines what ALU operation will be performed
module aluControl(
    input wire [1:0] aluOp, 
    input wire [5:0] funct,
    output reg [3:0] aluControlOp // operation to be performed in ALU unit
);

/**ALU OPS**/
parameter RTYPE = 2'b10; // use funct for alu control
parameter ITYPE = 2'b00; // add
parameter BRANCH = 2'b01; // sub

/**FUNCT CODES FOR R-TYPES**/
parameter r_add = 6'b100000;
parameter r_sub = 6'b100010;
parameter r_and = 6'b100100;
parameter r_or = 6'b100101;
parameter r_nor = 6'b100111;
parameter r_slt = 6'b101010; // set on less than
parameter r_sll = 6'b000000; // shift left
parameter r_srl = 6'b000010; // shift right

/**FUNCTION : ALU CONTROL**/
parameter AND = 4'b0000;
parameter OR = 4'b0001;
parameter NOR = 4'b1100;
parameter ADD = 4'b0010;
parameter SUB = 4'b0110;
parameter SLT = 4'b0111; // set on less than
/**I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS CORRECT/STANDARD.**/
parameter SLL = 4'b0100; // shift left
parameter SRL = 4'b1000; // shift right
/**I MADE UP THESE ALU CONTROL CODES FOR SHIFTING. IDK WHAT IS CORRECT/STANDARD.**/

always @ (aluOp) begin
    $display("aluOp is CHANGING!!!: %b", funct);
    case(aluOp)
    RTYPE: begin
        aluControlOp <= funct == r_and ? AND :
                        (funct == r_or ? OR :
                        (funct == r_nor ? NOR :
                        (funct == r_add ? ADD :
                        (funct == r_sub ? SUB :
                        (funct == r_slt ? SLT :
                        (funct == r_sll ? SLL :
                        (funct == r_srl ? SRL : ADD))))))); // default to add. TODO: change default?
    end

    ITYPE: begin
        aluControlOp <= ADD; // same for J-type, though it does not care about ALU
    end

    BRANCH: begin
        aluControlOp <= SUB;
    end

    default: begin
        aluControlOp <= ADD; // default to ADD. TODO: Change this?
    end

    endcase
end


endmodule