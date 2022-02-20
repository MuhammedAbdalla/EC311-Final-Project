`timescale 1ns / 1ps
module counter6(reset, increment_in, count_o);
    input reset, increment_in;
    output [5:0] count_o;
    reg [5:0] count_o;
    
    always @ (posedge increment_in or negedge reset) begin
        if (reset == 0) begin
            count_o <= 6'b000000;
        end else begin
            count_o <= (count_o + 1'b1);
        end
    end
endmodule
