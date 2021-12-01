`timescale 1ns / 1ps

module down_counter5(clk_hz, reset, count5_out, count5_enable);
    input clk_hz, reset;
    output reg [2:0] count5_out = 3'b101;
    output reg count5_enable = 1'b0;
    
    
    // count down from 5
    always @ (posedge clk_hz or negedge reset) begin
        if (reset == 1'b0) begin
            count5_out = 3'b101;
            count5_enable = 1'b0;
        end else begin
            count5_out = count5_out - 1'b1;
            if (count5_out == 0) begin
                count5_enable = 1'b1;
            end
        end
    end
endmodule
    
 

 module down_counter30(clk_hz, reset, count30_out, count30_enable);
    input clk_hz, reset;
    output reg [5:0] count30_out = 6'b011110;
    output reg count30_enable = 1'b0;
    
    
    // count down from 30
    always @ (posedge clk_hz or negedge reset) begin
        if (reset == 1'b0) begin
            count30_out = 6'b011110;
            count30_enable = 1'b0;
        end else begin
            count30_out = count30_out - 1'b1;
            if (count30_out == 0) begin
                count30_enable = 1'b1;
            end
        end
    end
endmodule
    
 
    
 