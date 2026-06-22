module control_unit(
    input [3:0] opcode,

    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg branch,

    output reg [3:0] alu_control
);

always @(*) begin

    reg_write  = 0;
    mem_read   = 0;
    mem_write  = 0;
    branch     = 0;
    alu_control = 4'b0000;

    case(opcode)

        4'b0000: begin // ADD
            reg_write = 1;
            alu_control = 4'b0000;
        end

        4'b0001: begin // SUB
            reg_write = 1;
            alu_control = 4'b0001;
        end

        4'b0010: begin // AND
            reg_write = 1;
            alu_control = 4'b0010;
        end

        4'b0011: begin // OR
            reg_write = 1;
            alu_control = 4'b0011;
        end

        4'b0100: begin // XOR
            reg_write = 1;
            alu_control = 4'b0100;
        end

        4'b0101: begin // LOAD
            reg_write = 1;
            mem_read = 1;
        end

        4'b0110: begin // STORE
            mem_write = 1;
        end

        4'b0111: begin // BEQ
            branch = 1;
            alu_control = 4'b0001;
        end

        default: begin
            reg_write = 0;
        end

    endcase

end

endmodule