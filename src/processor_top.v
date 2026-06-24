module processor_top(
    input clk,
    input reset
);

wire [15:0] pc_current;
wire [15:0] instruction;

wire [3:0] opcode;
wire [3:0] rs1;
wire [3:0] rs2;
wire [3:0] rd;

wire reg_write;
wire mem_read;
wire mem_write;
wire branch;

wire [3:0] alu_control;

wire [15:0] read_data1;
wire [15:0] read_data2;

wire [15:0] alu_result;
wire zero;

assign opcode = instruction[15:12];
assign rs1    = instruction[11:8];
assign rs2    = instruction[7:4];
assign rd     = instruction[3:0];

pc PC(
    .clk(clk),
    .reset(reset),
    .next_pc(pc_current + 16'd1),
    .pc_out(pc_current)
);

instruction_memory IM(
    .address(pc_current),
    .instruction(instruction)
);

control_unit CU(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .branch(branch),
    .alu_control(alu_control)
);

register_file RF(
    .clk(clk),
    .we(reg_write),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(alu_result),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

alu ALU(
    .a(read_data1),
    .b(read_data2),
    .alu_control(alu_control),
    .result(alu_result),
    .zero(zero)
);

endmodule