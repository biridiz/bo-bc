`include "FSM.v"

module testbench;

    reg INICIO = 0;
    reg rst = 0;
    reg clk = 0;
    
    
    wire H;
    wire LX;
    wire LH;
    wire LS;
    wire [1:0] M0;
    wire [1:0] M1;
    wire [1:0] M2;

    FSM T_FSM(clk, rst, INICIO, H, LX, LH, LS, M0, M1, M2);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;
        
        #1
        rst = 1;
        #1
        rst = 0;

        #1
        INICIO = 1;

        #14
        INICIO = 0;
        #2        
        $finish;

    end
    
endmodule