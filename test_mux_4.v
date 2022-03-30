`include "MUX_4.v"

module testbench;

    reg clk = 0;
    reg [0:15] in_A;
    reg [0:15] in_B;
    reg [0:15] in_C;
    reg [0:15] in_D;
    reg [1:0] select;

    wire [0:15] out;

    MUX_4 T_MUX(clk, in_A, in_B, in_C, in_D, select, out);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;

        #1
        in_A = 2;
        in_B = 4;
        in_C = 1;
        in_D = 7;

        #2
        select = 2'b00;

        #2
        select = 2'b01;

        #2
        select = 2'b10;

        #2
        select = 2'b11;

        #2
        $finish;

    end

endmodule