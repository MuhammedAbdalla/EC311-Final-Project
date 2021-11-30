`timescale 1ns / 1ps

module down_counters(clk_hz, reset, count5_out, count30_out);
    input clk_hz, reset;
    output count5_out, count30_out;
    
    parameter [2:0] five = 3'b101;
    parameter [4:0] thirty = 5'b11110;
    
    reg count5_out, count30_out;
    reg [2:0] downcount5 = five;
    reg [4:0] downcount30 = thirty;
    
    // count down from 5
    always @ (posedge clk_hz or negedge reset) begin
        if (reset == 0 | count5_out == 1'b1) begin
            downcount5 = five;
            count5_out = 1'b0;
        end else begin
            downcount5 = downcount5 - 1'b1;
            if (downcount5 == 0) begin
                count5_out = 1'b1;
            end
        end
    end
    
    // count down from 30
    always @ (posedge clk_hz or negedge reset) begin
        if (reset == 0 | count30_out == 1'b1) begin
            downcount30 = thirty;
            count30_out = 1'b0;
        end else begin
            downcount30 = downcount30 - 1'b1;
            if (downcount30 == 0) begin
                count30_out = 1'b1;
            end
        end
    end
endmodule
