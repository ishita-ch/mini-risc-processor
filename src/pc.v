module pc(
    input clk,
    input reset,
    input [15:0] next_pc,
    output reg [15:0] pc_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        pc_out <= 16'b0;
    else
        pc_out <= next_pc;
end

endmodule