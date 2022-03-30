module REG_8 (
    input clk,
    input wire [0:7] in,
    input wire c,

    output wire [0:15] out
);

    reg [0:15] m;
    assign out = m;

    always @(posedge clk) begin
        if (c == 1) m = in;
        else m = m;
    end

endmodule