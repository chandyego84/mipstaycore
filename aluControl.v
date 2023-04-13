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
parameter r_slt = 6'b101010;

/**FUNCTION : ALU CONTROL**/
parameter AND = 4'b0000;
parameter OR = 4'b0001;
parameter ADD = 4'b0010;
parameter SUB = 4'b0110;
parameter SLT = 4'b0111;

always @ (aluOp) begin
    case(aluOp)
    RTYPE: begin
        aluControlOp <= funct == r_add ? ADD : (funct == r_sub ? SUB : 
                                (funct == r_and ? AND : 
                                (funct == r_or ? OR : 
                                (funct == r_slt ? SLT : ADD)))); // defaults to ADD
    end

    ITYPE: begin
        aluControlOp <= ADD; // same for J-type, though it does not care about ALU
    end

    BRANCH: begin
        aluControlOp <= SUB;
    end

    default: begin
        aluControlOp <= ADD; // default to ADD
    end

    endcase
end


endmodule