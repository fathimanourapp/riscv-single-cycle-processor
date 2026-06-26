module riscV_instr_mem(
input [31:0] A,
output [31:0] RD
);
reg [31:0] i_mem [0:31];
initial begin
{i_mem[3], i_mem[2], i_mem[1], i_mem[0]} = 32’hFFC4A303; // lw x6,-4(x9)
{i_mem[7], i_mem[6], i_mem[5], i_mem[4]} = 32’h0064A423; // sw x6, 8(x9)
{i_mem[11], i_mem[10], i_mem[9], i_mem[8]} = 32’h0062E233; // or x4,x5,x6
{i_mem[15], i_mem[14], i_mem[13], i_mem[12]} = 32’h0062A433; // slt x8, x5, x6
{i_mem[19], i_mem[18], i_mem[17], i_mem[16]} = 32’hFE420AE3; // beq x4,x4,L7
end
assign RD = {i_mem[A+3], i_mem[A+2], i_mem[A+1], i_mem[A]};
endmodule