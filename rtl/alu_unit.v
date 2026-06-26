module riscV_ALU
(
input [31:0] A, B,
input [2:0] ALUControl, // 000=ADD, 001=SUB, 010=AND, 011=OR, 101=SLT
output reg [31:0] Y,
output
Cout
);
reg [31:0] BB;
reg
Cin;
wire [32:0]
wire
sum;
slt;
// Select B or ~B for sub and SLT
always @(*) begin
case (ALUControl)
3’b001: BB = ~B;
3’b101: BB = ~B;
default: BB = B;
endcase
end
// Select Cin for Sub and SLT
always @(*) begin
case (ALUControl)
3’b001: Cin = 1’b1;
3’b101: Cin = 1’b1;
default: Cin = 1’b0;
endcase
end
assign sum = A + BB + Cin;
assign slt = sum[31];
assign Cout = sum[32];
// Output MUX
always @(*) begin
case (ALUControl)
3’b000: Y = sum[31:0];
3’b001: Y = sum[31:0];
3’b010: Y = A & B;
3’b011: Y = A | B;
3’b101: Y = {{31{1’b0}}, slt};
default: Y = {32{1’b0}};
endcase
end
endmodule