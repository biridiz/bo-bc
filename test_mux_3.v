`include "MUX_3.v"

module testbench;

    reg clk = 0;
    reg [0:7] in_A;
    reg [0:7] in_B;
    reg [0:7] in_C;
    reg [1:0] select = 2'b00;

    wire [0:15] out;

    MUX_3 T_MUX(clk, in_A, in_B, in_C, select, out);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;

        #1
        in_A = 2;
        in_B = 4;
        in_C = 1;

        #1
        select = 2'b11;

        #2
        select = 2'b00;

        #1
        select = 2'b01;

        #2
        select = 2'b00;

        #1
        select = 2'b10;

        #2
        $finish;

    end

endmodule