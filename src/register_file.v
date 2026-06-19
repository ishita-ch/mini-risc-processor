module register_file(
    input clk,
    input we,

    input [3:0] rs1,
    input [3:0] rs2,
    input [3:0] rd,

    input [15:0] write_data,

    output [15:0] read_data1,
    output [15:0] read_data2
);

reg [15:0] registers [0:15];

always @(posedge clk) begin
    if (we)
        registers[rd] <= write_data;
end

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

endmodule