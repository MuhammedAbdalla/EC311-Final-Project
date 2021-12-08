`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 09:17:00 PM
// Design Name: 
// Module Name: binary_to_bcd_testbench
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


module binary_to_bcd_testbench(

    );
    
    reg [5:0] binary_in;
    wire [7:0] bcd_out;
    
    binary_to_bcd B2B(.binary_in(binary_in), .bcd_out(bcd_out));
    
    initial begin
    binary_in = 6'b000000;
    end
    
    always begin
    #5 binary_in = binary_in + 1'b1;
    end
    
endmodule
