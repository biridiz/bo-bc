`include "REG_8.v"
`include "REG_16.v"
`include "MUX_3.v"
`include "MUX_4.v"
`include "SUM_AND_MULT.v"

module BO (
    input clk,
    // input rst,
    input wire [0:7] X,
    input wire [0:7] A,
    input wire [0:7] B,
    input wire [0:7] C,
    input wire H,
    input wire LX,
    input wire LH,
    input wire LS,
    input wire [1:0] M0,
    input wire [1:0] M1,
    input wire [1:0] M2,

    output wire [0:15] RESULT
);

    wire [0:15] OUT_reg_LH;
    wire [0:15] OUT_mux_M0;
    wire [0:15] OUT_reg_LS;
    wire [0:15] OUT_reg_LX;
    wire [0:15] OUT_mux_M2;
    wire [0:15] OUT_mux_M1;
    wire [0:15] OUT_sum_and_mult;

    assign RESULT = OUT_reg_LS;

    REG_8 reg_LX(clk, X, LX, OUT_reg_LX);
    MUX_3 mux_M0(clk, A, B, C, M0, OUT_mux_M0);

    MUX_4 mux_M2(clk, OUT_reg_LX, OUT_mux_M0, OUT_reg_LS, OUT_reg_LH, M2, OUT_mux_M2);
    MUX_4 mux_M1(clk, OUT_mux_M0, OUT_reg_LX, OUT_reg_LS, OUT_reg_LH, M1, OUT_mux_M1);

    SUM_AND_MULT sum_and_mult(clk, OUT_mux_M2, OUT_mux_M1, H, OUT_sum_and_mult);

    REG_16 reg_LS(OUT_sum_and_mult, LS, OUT_reg_LS);
    REG_16 reg_LH(OUT_sum_and_mult, LH, OUT_reg_LH);

endmodule