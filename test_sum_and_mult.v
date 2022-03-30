`include "SUM_AND_MULT.v"

module testbench;

    reg clk = 0;
    reg [0:15] in_A;
    reg [0:15] in_B;
    reg op;

    wire [0:15] out;

    SUM_AND_MULT T_SUM_AND_MULT(clk, in_A, in_B, op, out);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;

        #1
        in_A = 2;
        in_B = 4;

        #2
        op = 1;

        #2
        op = 0;

        #2
        $finish;

    end

endmodule