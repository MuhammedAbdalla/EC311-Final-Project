`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 07:08:28 PM
// Design Name: 
// Module Name: clock_divider_testbench
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


module clock_divider_testbench(

    );
    reg clock_in;
    wire clock_out_1hz;
    wire clock_out_1khz;
    wire clock_out_half_hz;
    wire clock_out_2hz;
    
    clock_divider CD(.clock_in (clock_in), .clock_out_1khz(clock_out_1khz), .clock_out_1hz(clock_out_1hz), .clock_out_half_hz(clock_out_half_hz), .clock_out_2hz(clock_out_2hz));
    
    
    initial begin
    clock_in = 1'b0;
    end
    
    always begin
    #1 clock_in=1'b1;
    #1 clock_in=1'b0;
    end
    
endmodule