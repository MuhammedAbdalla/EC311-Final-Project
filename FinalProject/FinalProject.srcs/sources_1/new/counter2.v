`timescale 1ns / 1ps

module counter2(clk, reset, count_o);
    input clk, reset;
    output [1:0] count_o;
    reg [1:0] count_o;
    
    always @ (posedge clk or negedge reset) begin
        if (reset == 1'b0) begin
            count_o = 2'b00;
        end else begin
            count_o = count_o + 1'b1;
        end
    end
endmodule