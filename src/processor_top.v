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

assign opcode = instruction[15:12];
assign rs1    = instruction[11:8];
assign rs2    = instruction[7:4];
assign rd     = instruction[3:0];

pc PC(
    .clk(clk),
    .reset(reset),
    .next_pc(pc_current + 1),
    .pc_out(pc_current)
);

instruction_memory IM(
    .address(pc_current),
    .instruction(instruction)
);

endmodule