module MUX_3 (
    input clk,
    input wire [0:7] in_A,
    input wire [0:7] in_B,
    input wire [0:7] in_C,
    input wire [1:0] select,

    output wire [0:15] out
);

    reg [0:15] m;
    assign out = m;

    always @(posedge clk) begin
        if (select == 2'b00) m = m;
        if (select == 2'b01) m = in_A;
        if (select == 2'b10) m = in_B;
        if (select == 2'b11) m = in_C;
    end

endmodule