`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 07:37:50 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(clock_in, reset_in, buttons_in, buttons_out);
    input clock_in;
    input reset_in;
    input [4:0] buttons_in;
    output reg [4:0] buttons_out = 5'b00000;
    
   
    reg deb_count_start = 1'b0;
    //reg [4:0] deb_count = 5'b00000;
    reg [17:0] deb_count = 18'b000000000000000000;
    reg output_exist = 1'b0;
    reg button_out = 1'b0;
    reg button_in;
    
     always @(*) begin
        if (buttons_in[0] == 1'b1) begin 
            button_in = buttons_in[0];
         end else if (buttons_in[1] == 1'b1) begin
            button_in = buttons_in[1];
        end else if (buttons_in[2] == 1'b1) begin
            button_in = buttons_in[2];
        end else if (buttons_in[3] == 1'b1) begin
            button_in = buttons_in[3];
        end else if (buttons_in[4] == 1'b1) begin
            button_in = buttons_in[4];
        end
    end //always
    
    //parameter[4:0] MIN = 5'b00000;
    //parameter[4:0] MAX = 5'b11111;
    parameter[17:0] MIN = 18'b000000000000000000;
    parameter[17:0] MAX = 18'b111111111111111111;
    always @(posedge clock_in or negedge reset_in) begin
        if (reset_in == 1'b0) begin
            button_out <= 1'b0;
            deb_count_start <= 1'b0;
            deb_count <= MIN;
            output_exist <= 1'b0;
        end else begin
            if (button_in == 1'b1) begin
                if (output_exist == 1'b1) begin
                    button_out <= 1'b0;
                end else begin
                    if (deb_count_start == 1'b0) begin
                        deb_count_start <= 1'b1;
                    end
                    if (deb_count_start == 1'b1) begin
                        deb_count <= deb_count + 1'b1;
                    end
                    if (deb_count == MAX) begin
                        button_out <= 1'b1;
                        deb_count_start <= 1'b0;
                        deb_count <= MIN;
                        output_exist <= 1'b1;
                    end
               end
            end else begin
                button_out <= 1'b0;
                deb_count_start <= 1'b0;
                deb_count <= MIN;
                output_exist <= 1'b0;
            end
        end //else
    end //always 
    
    always @(*) begin
        if (buttons_in[0] == 1'b1) begin 
            buttons_out = {4'b0000, button_out};
         end else if (buttons_in[1] == 1'b1) begin
            buttons_out = {4'b000, button_out, 1'b0};
        end else if (buttons_in[2] == 1'b1) begin
            buttons_out = {2'b00, button_out, 2'b00};
        end else if (buttons_in[3] == 1'b1) begin
            buttons_out = {1'b0, button_out, 3'b000};
        end else if (buttons_in[4] == 1'b1) begin
            buttons_out = {button_out, 4'b0000};
        end
    end //always
          
endmodule
