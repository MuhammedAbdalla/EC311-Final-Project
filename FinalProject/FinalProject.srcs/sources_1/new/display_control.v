`timescale 1ns / 1ps
//EDIT DISPLAY CONTROL TO SUPPORT 1KHZ REFRESH FOR ALL 8 7-SEGMENTS
// Display Control module controls the seven segement display with
// a refresh rate of 1kHz for all 4 of the seven seg displays
module display_control(reset, countdown5, count2, count6, count3bit, digit_select);
    input reset;
    input [1:0] count2;
    input [2:0] countdown5;
    input [5:0] count6;
    output [2:0] digit_select, count3bit;
    
    reg [2:0] digit_select, count3bit;
    
    parameter [2:0] sevSeg1 = 3'b110;
    parameter [2:0] sevSeg2 = 3'b101;
    parameter [2:0] sevSeg3 = 3'b011;

    always @ (*) begin
        if (reset == 0) begin
            digit_select = 3'b111;
            count3bit = 3'b000;
        end else begin
            if (count2 == 2'b00) begin
                digit_select = sevSeg1;
                count3bit = count6[3:0];
            end else if (count2 == 2'b01) begin
                digit_select = sevSeg2;
                count3bit = count6[7:4];
            end else if (count2 == 2'b10) begin
                digit_select = sevSeg3;
                count3bit = countdown5;
            end
        end
    end  
endmodule