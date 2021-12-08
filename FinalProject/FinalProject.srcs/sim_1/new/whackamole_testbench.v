`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 10:31:03 PM
// Design Name: 
// Module Name: whackamole_testbench
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


module whackamole_testbench(

    );
    //reg reset_in;
    reg [2:0] led_bin;
    reg [4:0] buttons_in;
    reg enable_in;
    wire [4:0] led_out;
    wire increment_out;
    
    whackamole WM(.led_bin(led_bin), .buttons_in(buttons_in), .enable_in(enable_in), .led_out(led_out), .increment_out(increment_out));
    
    initial begin 
    led_bin = 3'b001;
    buttons_in = 5'b00000;
    enable_in = 1'b1;
    end
    
    always begin
    #50 led_bin = led_bin+1'b1;
    if(led_bin == 3'b101) begin
        led_bin = 3'b001;
    end
  
    end
    
    always begin
    #5 buttons_in = 5'b00001;
    #5 buttons_in = 5'b00010;
    #5 buttons_in = 5'b00100;
    #5 buttons_in = 5'b01000;
    #5 buttons_in = 5'b10000;
    end
    
    always begin
    #50 enable_in = 1'b0;
    end
    
    

endmodule
