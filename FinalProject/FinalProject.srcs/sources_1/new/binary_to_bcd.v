`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 08:14:13 PM
// Design Name: 
// Module Name: binary_to_bcd
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


module binary_to_bcd(binary_in, bcd_out); //uses double dabble algorithm
    input [5:0] binary_in;
    output reg [7:0] bcd_out = 8'b0;
    reg [3:0] ones = 4'b0000;
    reg [3:0] tens = 4'b0000;
    reg [5:0] binary_shift;
    reg [2:0] i;
    parameter MAX = 3'b101;
    
    always @(binary_in) begin
        ones = 4'b0000;
        tens = 4'b0000;
        binary_shift = binary_in;
        for(i = 0; i < 3'b110; i = i+1'b1) begin
            if(ones >= MAX) begin
                ones = ones + 2'b11;
            end
            if(tens >= MAX) begin
                tens = tens + 2'b11;
            end
            tens = {tens[2:0], ones[3]};
            ones = {ones[2:0], binary_shift[5]};
            binary_shift = {binary_shift[4:0], 1'b0};
            bcd_out = {tens, ones};
        end
    end //always
    
endmodule
