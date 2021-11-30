`timescale 1ns / 1ps
//EDIT DISPLAY CONTROL TO SUPPORT 1KHZ REFRESH FOR ALL 8 7-SEGMENTS
// Display Control module controls the seven segement display with
// a refresh rate of 1kHz for all 4 of the seven seg displays
module display_control(reset_i, count2, digit_select_o);
    input reset_i;
    input [1:0] count2;
    output reg [2:0] digit_select_o;
    
    parameter [2:0] sevSeg1 = 3'b110;
    parameter [2:0] sevSeg2 = 3'b101;
    parameter [2:0] sevSeg3 = 3'b011;

    always @ (*) begin
        if (reset_i == 0) begin
            digit_select_o = 3'b111;
        end else begin
            if (count2 == 2'b00) begin
                digit_select_o = sevSeg1;
            end else if (count2 == 2'b01) begin
                digit_select_o = sevSeg2;
            end else if (count2 == 2'b10) begin
                digit_select_o = sevSeg3;
            end
        end
    end  
endmodule