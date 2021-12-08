`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 01:48:20 AM
// Design Name: 
// Module Name: lsfr_testbench
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


module lsfr_testbench(

    );
    reg clk;
    reg reset;
    reg enable;
    wire [2:0] Y;
    
    lsfr LSFR(.clk(clk), .reset(reset), .enable(enable), .Y(Y));
    
    initial begin
    clk = 1'b0;
    reset = 1'b1;
    enable = 1'b0;
    end
    
    always begin
    #5 clk = 1'b1;
    #5 clk = 1'b0;
    end
    
    always begin
    #2500 enable = 1'b1;
    end
    
endmodule
