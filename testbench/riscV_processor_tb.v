module riscV_processor_tb;
reg clk;
riscV_processor dut (
.clock(clk)
);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
dut.pc = 32’d0;
dut.regis.rf[9] = 32’h00000010; // x9 base address
dut.regis.rf[5] = 32’h00000005;
// x5
11
dut.regis.rf[6] = 32’h00000000;
dut.regis.rf[4] = 32’h00000000;
dut.regis.rf[8] = 32’h00000000;
// lw x6,-4(x9)
dut.dmem.d_mem[12] = 8’b00010100;
dut.dmem.d_mem[13] = 8’b00000000;
dut.dmem.d_mem[14] = 8’b00000000;
dut.dmem.d_mem[15] = 8’b00000000;
#250;
$stop;
end
endmodule
