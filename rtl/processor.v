module riscV_processor (
input clock
);
// PC
reg [31:0] pc;
wire [31:0] pc_next, pc_plus4, pc_branch;
always @(posedge clock)
pc <= pc_next;
assign pc_plus4 = pc + 32’d4;
// Instruction Memory
wire [31:0] instr;
riscV_instr_mem imem (
.A(pc),
.RD(instr)
);
wire [6:0] op
wire [4:0] rs1
wire [4:0] rs2
wire [4:0] rd
= instr[6:0];
= instr[19:15];
= instr[24:20];
= instr[11:7];
wire [2:0] funct3 = instr[14:12];
wire
funct7 = instr[30];
// Control Unit
wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
wire [1:0] ImmSrc;
wire [2:0] ALUControl;
riscV_control_unit cu (
.op(op),
.funct3(funct3),
.funct7(funct7),
.RegWrite(RegWrite),
.ImmSrc(ImmSrc),
.ALUSrc(ALUSrc),
.MemWrite(MemWrite),
.ResultSrc(ResultSrc),
.Branch(Branch),
.ALUControl(ALUControl)
);
// Register File
wire [31:0] RD1, RD2, WD3;
riscV_regfile regis (
.clk(clock),
.WE3(RegWrite),
.A1(rs1),
.A2(rs2),
.A3(rd),
.WD3(WD3),
.RD1(RD1),
.RD2(RD2)
);
// Immediate Generator
wire [31:0] ImmExt;
riscV_imm_op immgen (
.Instr(instr),
.ImmSrc(ImmSrc),
.ImmExt(ImmExt)
);
// ALU + SrcB mux
wire [31:0] SrcB, ALUResult;
wire Cout;
assign SrcB = (ALUSrc) ? ImmExt : RD2;
riscV_ALU alu_a (
.A(RD1),
.B(SrcB),
.ALUControl(ALUControl),
.Y(ALUResult),
.Cout(Cout)
);
// Data Memory
wire [31:0] ReadData;
riscV_data_mem dmem (
.clk(clock),
.WE(MemWrite),
.A(ALUResult),
.WD(RD2),
.RD(ReadData)
);
// Result mux
assign WD3 = (ResultSrc) ? ReadData : ALUResult;
// Branch + PC mux
wire Zero = (ALUResult == 32’b0);
assign pc_branch = pc + ImmExt;
assign pc_next = (Branch && Zero) ? pc_branch : pc_plus4;
endmodule
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
dut.regis.rf[6] = 32’h00000000; // x6
dut.regis.rf[4] = 32’h00000000; // x4
dut.regis.rf[8] = 32’h00000000; // x8
// lw x6,-4(x9)
dut.dmem.d_mem[12] = 8’b00010100;
dut.dmem.d_mem[13] = 8’b00000000;
dut.dmem.d_mem[14] = 8’b00000000;
dut.dmem.d_mem[15] = 8’b00000000;
#250;
$stop;
end
endmodule