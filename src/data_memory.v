module data_memory(
    input clk,
    input mem_write,
    input mem_read,

    input [15:0] address,
    input [15:0] write_data,

    output reg [15:0] read_data
);

reg [15:0] memory [0:255];

always @(posedge clk) begin
    if(mem_write)
        memory[address] <= write_data;
end

always @(*) begin
    if(mem_read)
        read_data = memory[address];
    else
        read_data = 16'b0;
end

endmodule