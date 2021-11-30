`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 09:03:17 PM
// Design Name: 
// Module Name: down_counters_t
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module down_counters_t();
    reg clk, reset;
    wire c5, c30;
    
    down_counters dc(.clk_hz(clk), .reset(reset), .count5_out(c5), .count30_out(c30));
    
    initial begin
        clk  = 1'b1;
        reset = 1'b0;
        #1 reset = 1'b1;
    end
    
    always begin
        #0.5 clk = (clk == 1'b1) ? 1'b0: 1'b1;
    end
endmodule
