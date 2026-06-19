module instruction_memory(
    input [15:0] address,
    output [15:0] instruction
);

reg [15:0] memory [0:255];

initial begin

    // ADD R3, R1, R2
    memory[0] = 16'b0000_0001_0010_0011;

    // SUB R4, R3, R1
    memory[1] = 16'b0001_0011_0001_0100;

    // AND R5, R4, R2
    memory[2] = 16'b0010_0100_0010_0101;

    // OR R6, R5, R1
    memory[3] = 16'b0011_0101_0001_0110;

end

assign instruction = memory[address];

endmodule