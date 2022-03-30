module SUM_AND_MULT (
    input clk,
    input wire [0:15] in_A,
    input wire [0:15] in_B,
    input wire op,

    output wire [0:15] out
);

    reg [0:15] total;
    assign out = total;

    always @(posedge clk) begin
        if (op == 1) total = (in_A * in_B);
        else total = (in_A + in_B);
    end

endmodule