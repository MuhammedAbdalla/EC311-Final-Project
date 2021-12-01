
//Code for 2 to 1 mux
module mux2to1(
    select_i,
    in0,
    in1,
    out_o
    );
    
    input select_i;
    input [3:0] in0;
    input [3:0] in1;
    output reg [3:0] out_o;
    
    always @(*) begin
        case (select_i)
            1'b0: out_o = in0;
            1'b1: out_o = in1;
        endcase
    end// always
endmodule