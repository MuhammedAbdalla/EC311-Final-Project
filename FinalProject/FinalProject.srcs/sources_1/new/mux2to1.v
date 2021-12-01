
//Code for 2 to 1 mux
module mux2to1(
    select_i,
    in0,
    in1,
    out_o
    );
    
    input select_i;
    input in0;
    input in1;
    output out_o;
    reg out_o;
    
    always @(*) begin
        case (select_i)
            1'b0: out_o = in0;
            1'b1: out_o = in1;
        endcase
    end// always
endmodule