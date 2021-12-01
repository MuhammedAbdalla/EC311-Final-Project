`timescale 1ns / 1ps
//EDIT DISPLAY CONTROL TO SUPPORT 1KHZ REFRESH FOR ALL 8 7-SEGMENTS
// Display Control module controls the seven segement display with
// a refresh rate of 1kHz for all 4 of the seven seg displays

//Code for display control module
module display_control(
    select_i,
    digit_select_o);
    
    input [1:0] select_i;
    output [3:0] digit_select_o;
    reg [3:0] digit_select_o;
    
    always @(*) begin
        case (select_i)
            2'b00: digit_select_o = 4'b1110;
            2'b01: digit_select_o = 4'b1101;
            2'b10: digit_select_o = 4'b1011;
            2'b11: digit_select_o = 4'b0111;
        endcase
    end//always
endmodule
