`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2021 08:43:51 PM
// Design Name: 
// Module Name: binary_BCD_decoder
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


module binary_BCD_decoder(binary, BCD);
    input [5:0] binary;
    output reg [7:0] BCD;
    always @ (*) begin
        case (binary)
                6'b000000: BCD = 8'b00000000;
                6'b000001: BCD = 8'b00000001;   
        endcase
    end
endmodule
