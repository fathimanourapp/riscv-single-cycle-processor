module riscV_data_mem(
input [31:0] A,
input [31:0] WD,
input WE,
input clk,
output [31:0] RD
);
reg [7:0] d_mem [0:127];
integer i;
initial begin
for (i = 0; i < 128; i = i + 1) begin
d_mem[i] = 8’b0;
end
end
// read
assign RD = {d_mem[A+3], d_mem[A+2], d_mem[A+1], d_mem[A]};
// write
always @(posedge clk) begin
if (WE) begin
{d_mem[A+3], d_mem[A+2], d_mem[A+1], d_mem[A]}<=WD;
end
end
endmodule