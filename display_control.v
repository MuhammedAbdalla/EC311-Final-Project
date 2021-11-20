
//EDIT DISPLAY CONTROL TO SUPPORT 1KHZ REFRESH FOR ALL 8 7-SEGMENTS

// Display Control module controls the seven segement display with
// a refresh rate of 1kHz for all 4 of the seven seg displays
module display_control(reset, count2, count16, count4bit, digit_select);
    input reset;
    input [1:0] count2;
    input [15:0] count16;
    output [3:0] digit_select, count4bit;
    
    reg [3:0] digit_select, count4bit;
    
    parameter [3:0] sevSeg1 = 4'b1110;
    parameter [3:0] sevSeg2 = 4'b1101;
    parameter [3:0] sevSeg3 = 4'b1011;
    parameter [3:0] sevSeg4 = 4'b0111;

    always @ (*) begin
        if (reset == 1'b0) begin
            digit_select = 4'b1111;
            count4bit = 4'b0000;
        end else begin
            if (count2 == 2'b00) begin
                digit_select = sevSeg1;
                count4bit = count16[3:0];
            end else if (count2 == 2'b01) begin
                digit_select = sevSeg2;
                count4bit = count16[7:4];
            end else if (count2 == 2'b10) begin
                digit_select = sevSeg3;
                count4bit = count16[11:8];
            end else if (count2 == 2'b11) begin
                digit_select = sevSeg4;
                count4bit = count16[15:12];
            end
        end
    end  
endmodule