module riscV_main_decoder (
input [6:0] op,
output reg
RegWrite,
output reg [1:0] ImmSrc,
output reg
ALUSrc,
output reg
output reg
output reg
MemWrite,
ResultSrc,
Branch,
output reg [1:0] ALUOp
);
always @(*) begin
RegWrite = 0;
ImmSrc
= 2’b00;
ALUSrc
= 0;
MemWrite = 0;
ResultSrc = 0;
Branch
= 0;
ALUOp
case (op)
= 2’b00;
7’b0000011: begin // lw
RegWrite = 1;
ImmSrc
= 2’b00;
ALUSrc
= 1;
MemWrite = 0;
ResultSrc = 1;
Branch
= 0;
ALUOp
end
= 2’b00;
7’b0100011: begin // sw
RegWrite = 0;
ImmSrc
= 2’b01;
ALUSrc
= 1;
MemWrite = 1;
ResultSrc = 0;
Branch
= 0;
ALUOp
end
= 2’b00;
7’b0110011: begin // R-type
RegWrite = 1;
ImmSrc
= 2’bxx;
ALUSrc
= 0;
MemWrite = 0;
ResultSrc = 0;
Branch
= 0;
ALUOp
end
= 2’b10;
7’b1100011: begin // beq
RegWrite = 0;
ImmSrc
= 2’b10;
ALUSrc
= 0;
MemWrite = 0;
ResultSrc = 0;
Branch
= 1;
ALUOp
end
= 2’b01;
default: begin
RegWrite = 0;
ImmSrc
= 2’b00;
ALUSrc
= 0;
MemWrite = 0;
ResultSrc = 0;
Branch
= 0;
ALUOp = 2’b00;
end
endcase
end
endmodule