
`timescale 1ns / 1ps
module clock_divider(clock_in, clock_out_1khz, clock_out_1hz, clock_out_half_hz, clock_out_2hz);

    input clock_in;
    output reg clock_out_1khz = 1'b0;
    output reg clock_out_1hz = 1'b0;
    output reg clock_out_half_hz = 1'b0;
    output reg clock_out_2hz = 1'b0;

    reg [15:0] count_1khz = 16'd0;
    reg [25:0] count_1hz = 26'd0;
    reg [26:0] count_half_hz = 27'd0;
    reg [24:0] count_2hz = 25'd0;

    parameter [15:0] MAX_1khz = 16'd50000;
    parameter [25:0] MAX_1hz = 26'd50000000;
    parameter [26:0] MAX_half_hz = 27'd100000000;
    parameter [24:0] MAX_2hz = 25'd25000000;


    always @(posedge clock_in) begin
        count_1hz <= count_1hz + 1'd1;
        count_1khz <= count_1khz + 1'd1;
        count_half_hz <= count_half_hz + 1'd1;
        count_2hz <= count_2hz + 1'd1;
        if (count_1hz == (MAX_1hz-1'd1)) begin
            clock_out_1hz <= ~clock_out_1hz;
            count_1hz <= 26'd0;
        end
        if (count_1khz == (MAX_1khz-1'd1)) begin
            clock_out_1khz <= ~clock_out_1khz;
            count_1khz <= 16'd0;
        end
        if (count_half_hz  == (MAX_half_hz-1'd1)) begin
            clock_out_half_hz <= ~clock_out_half_hz;
            count_half_hz <= 27'd0;
        end
        if (count_2hz  == (MAX_2hz - 1'd1)) begin
            clock_out_2hz <= ~clock_out_2hz;
            count_2hz = 25'd0;
        end
    end//always
endmodule
