`include "FSM.v"
`include "BO.v"

module testbench;
    reg clk = 0;
    reg rst = 0;
    reg INICIO = 1;
    reg ZERO = 0;
    reg [0:7] X = 2;
    reg [0:7] A = 3;
    reg [0:7] B = 1;
    reg [0:7] C = 7;

    wire H;
    wire LX;
    wire LH;
    wire LS;
    wire [1:0] M0;
    wire [1:0] M1;
    wire [1:0] M2;
    wire [0:15] RESULT;

    FSM T_FSM(clk, rst, INICIO, ZERO, H, LX, LH, LS, M0, M1, M2);
    BO T_BO(clk, X, A, B, C, H, LX, LH, LS, M0, M1, M2, RESULT);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;
        
        #1
        rst = 1;
        #1
        rst = 0;

        #20
        INICIO = 0;
        $finish;

    end
    
endmodule