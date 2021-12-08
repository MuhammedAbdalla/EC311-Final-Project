`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 08:01:02 PM
// Design Name: 
// Module Name: debouncer_testbench
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


module debouncer_testbench(
    );
    reg clock_in, reset_in;
    reg [4:0] buttons_in;
    wire [4:0] buttons_out;
    
    debouncer DB(.clock_in(clock_in), .reset_in(reset_in), .buttons_in(buttons_in), .buttons_out(buttons_out));
    
    initial begin
    clock_in = 1'b0;
    reset_in = 1'b1; 
    buttons_in = 5'b00000;
    end
    
    always begin
    #1 clock_in = 1'b1;
    #1 clock_in = 1'b0;
    end
   
    
    always begin
    #1 buttons_in[3] = 1'b1;
    #1 buttons_in[3] = 1'b0;
    end
    
    
    always begin
    #100 reset_in = 1'b0;
    #10 reset_in = 1'b1;
    
    end
endmodule