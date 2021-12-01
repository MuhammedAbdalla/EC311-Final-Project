//Code for 3 to 1 mux
module mux3to1(
    select_i,
    in0,
    in1,
    in2,
    out_o
    );
    
    input [1:0] select_i;
    input in0;
    input in1;
    input in2;
    output out_o;
    reg out_o;
    
    always @(*) begin
        case (select_i)
            2'b00: out_o = in0;
            2'b01: out_o = in1;
            2'b11: out_o = in2;
        endcase
    end// always
endmodule