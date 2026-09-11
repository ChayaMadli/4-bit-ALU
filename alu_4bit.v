module alu_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] OP,
    output reg [3:0] RESULT,
    output reg       CARRY_BORROW,
    output reg       ZERO
);

    always @(*) begin

        RESULT = 4'b0000;
        CARRY_BORROW = 1'b0;

        case (OP)

            3'b000: begin
                {CARRY_BORROW, RESULT} = A + B;
            end

            3'b001: begin
                RESULT = A - B;

                if (A < B)
                    CARRY_BORROW = 1'b1;
                else
                    CARRY_BORROW = 1'b0;
            end

            3'b010: begin
                RESULT = A & B;
            end

            3'b011: begin
                RESULT = A | B;
            end

            3'b100: begin
                RESULT = A ^ B;
            end

            default: begin
                RESULT = 4'b0000;
                CARRY_BORROW = 1'b0;
            end

        endcase

        if (RESULT == 4'b0000)
            ZERO = 1'b1;
        else
            ZERO = 1'b0;

    end

endmodule