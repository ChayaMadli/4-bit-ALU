module alu_4bit_tb;

    integer pass_count = 0;
    integer fail_count = 0;

    logic [3:0] A;
    logic [3:0] B;
    logic [2:0] OP;

    logic [3:0] RESULT;
    logic       CARRY_BORROW;
    logic       ZERO;

    logic [3:0] expected_result;
    logic       expected_carry;
    logic       expected_zero;

    alu_4bit dut (
        .A(A),
        .B(B),
        .OP(OP),
        .RESULT(RESULT),
        .CARRY_BORROW(CARRY_BORROW),
        .ZERO(ZERO)
    );

    integer a;
    integer b;
    integer op;

    initial begin

        $dumpfile("alu_exhaustive.vcd");
        $dumpvars(0, alu_4bit_tb);

        for (a = 0; a < 16; a = a + 1) begin
            for (b = 0; b < 16; b = b + 1) begin
                for (op = 0; op < 8; op = op + 1) begin

                    A = a;
                    B = b;
                    OP = op;

                    #1;

                    expected_result = 4'b0000;
                    expected_carry = 1'b0;

                    case (op)

                        0: begin
                            {expected_carry, expected_result} = a + b;
                        end

                        1: begin
                            expected_result = a - b;

                            if (a < b)
                                expected_carry = 1'b1;
                            else
                                expected_carry = 1'b0;
                        end

                        2: begin
                            expected_result = a & b;
                        end

                        3: begin
                            expected_result = a | b;
                        end

                        4: begin
                            expected_result = a ^ b;
                        end

                        default: begin
                            expected_result = 4'b0000;
                            expected_carry = 1'b0;
                        end

                    endcase

                    if (expected_result == 4'b0000)
                        expected_zero = 1'b1;
                    else
                        expected_zero = 1'b0;

                    assert (ZERO == (RESULT == 4'b0000))
                        else $error("ZERO flag assertion failed!");

                    if (OP == 3'b000)
                        assert ({CARRY_BORROW, RESULT} == (A + B))
                            else $error("ADD carry assertion failed!");

                    if (OP == 3'b001)
                        assert (CARRY_BORROW == (A < B))
                            else $error("SUB borrow assertion failed!");

                    if ((RESULT == expected_result) &&
                        (CARRY_BORROW == expected_carry) &&
                        (ZERO == expected_zero)) begin

                        pass_count = pass_count + 1;

                    end
                    else begin

                        fail_count = fail_count + 1;

                        $display("FAIL: A=%0d B=%0d OP=%0d RESULT=%b CARRY=%b ZERO=%b",
                                 A, B, OP, RESULT, CARRY_BORROW, ZERO);

                        $display("EXPECTED: RESULT=%b CARRY=%b ZERO=%b",
                                 expected_result, expected_carry, expected_zero);

                    end

                end
            end
        end

        $display("========================================");
        $display("       4-BIT ALU EXHAUSTIVE TEST");
        $display("========================================");
        $display("Total Tests : %0d", pass_count + fail_count);
        $display("Passed      : %0d", pass_count);
        $display("Failed      : %0d", fail_count);

        if (fail_count == 0)
            $display("STATUS      : ALL TESTS PASSED");
        else
            $display("STATUS      : SOME TESTS FAILED");

        $display("========================================");

        $finish;

    end

endmodule