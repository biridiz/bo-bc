`include "REG_16.v"

module testbench;

    reg clk = 0;
    reg [0:15] in;
    reg c = 0;

    wire [0:15] out;

    REG_16 T_REG(clk, in, c, out);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;

        #1
        c = 0;
        in = 2;

        #1
        c = 1;

        #2
        $finish;

    end

endmodule