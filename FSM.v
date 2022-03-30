module FSM (
    input clk,
    input rst,
    input INICIO,
    input ZERO,

    output wire H,
    output wire LX,
    output wire LH,
    output wire LS,
    output wire [1:0] M0,
    output wire [1:0] M1,
    output wire [1:0] M2
);

    reg [0:3] STATE;
    wire [0:3] NEXT_STATE;

    assign NEXT_STATE[0] = (STATE[1] & STATE[2] & STATE[3]) | (STATE[0] & ~STATE[3]);
    assign NEXT_STATE[1] = (~STATE[1] & STATE[2] & STATE[3]) | (STATE[1] & ~STATE[2] | STATE[1] & ~STATE[3]);
    assign NEXT_STATE[2] = (~STATE[0] & ~STATE[2] & STATE[3]) | (STATE[2] & ~STATE[3]);
    assign NEXT_STATE[3] = (~STATE[3] & INICIO);
    
    assign H = (~STATE[0] & ~STATE[1]) | (~STATE[0] & ~STATE[2]);      
    assign LX = ~STATE[0] & ~STATE[1] & ~STATE[2] & ~STATE[3];
    assign LS = STATE[1]&~STATE[2]&STATE[3]|STATE[0]&STATE[3];
    assign LH = ~STATE[0]&~STATE[1]&STATE[3]|STATE[2]&STATE[3];
    assign M0[1] = (STATE[1] & ~STATE[2]) | STATE[0];
    assign M0[0] = (~STATE[1] & STATE[2]) | STATE[0];
    assign M1[1] = STATE[1]&STATE[2];
    assign M1[0] = ~STATE[0]&~STATE[1]&~STATE[2];
    assign M2[1] = STATE[2] | STATE[0];
    assign M2[0] = STATE[2] | STATE[0]; 

    always @(posedge clk) begin
        if (rst) begin
            STATE <= 0;
        end else begin
            STATE <= NEXT_STATE;
        end
    end

endmodule