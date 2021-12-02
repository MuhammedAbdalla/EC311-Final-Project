
module top(clock_in, reset_in, level_select_in, buttons_in, digit_select_out, digit_out, led_out);
    input clock_in;
    input [1:0] level_select_in;
    input reset_in;
    input [4:0] buttons_in;
    output [3:0] digit_select_out;
    output [6:0] digit_out;
    output [4:0] led_out;
    
    wire clock_1khz;
    wire clock_half_hz;
    wire clock_1hz;
    wire clock_2hz;
    wire mux3_out;
    wire game_enable;
    wire game_stop;
    wire [3:0] count_5;
    wire [5:0] count_30;
    wire [7:0] bcd30_out;
    wire [3:0] mux2to1_1_out;
    wire [3:0] mux2to1_2_out;
    wire [1:0] count2_out;
    wire [4:0] debouncer_out;
    wire increment_score;
    wire [5:0] score_bin;
    wire [7:0] score_bcd;
    wire [2:0] lsfr_out;
    
    clock_divider CD(.clock_in(clock_in), .clock_out_1khz (clock_1khz), .clock_out_1hz(clock_1hz), .clock_out_half_hz(clock_half_hz), .clock_out_2hz(clock_2hz));
    
    mux3to1 M3TO1( .select_i(level_select_in), .in0(clock_half_hz), .in1(clock_1hz), .in2(clock_2hz), .out_o(mux3_out));
    
    debouncer DB(.clock_in(clock_in), .reset_in(reset_in), .buttons_in(buttons_in), .buttons_out(debouncer_out));
    
    lsfr LSFR(.clk (mux3_out) , .reset(reset_in), .enable(game_stop), .Y(lsfr_out));
    
    whackamole ML (.led_bin(lsfr_out),.buttons_in(debouncer_out),.enable_in(game_stop), .led_out(led_out), .increment_out(increment_score));
    
    counter6 CT6(.reset(reset_in), .increment_in(increment_score), .count_o(score_bin));  
    
    binary_to_bcd BIN2BCD1(.binary_in(score_bin), .bcd_out(score_bcd));
    
    down_counter5 DC5(.clk_hz(clock_1hz), .reset(reset_in), .count5_out(count_5), .count5_enable(game_enable));
    
    down_counter30 DC30(.clk_hz(clock_1hz), .reset(reset_in), .enable(game_enable), .count30_out(count_30), .count30_enable(game_stop));
    
    binary_to_bcd BIN2BCD2(.binary_in(count_30), .bcd_out(bcd30_out));
    
    mux2to1 M2TO1_1(.select_i(game_enable), .in0(count_5), .in1(bcd30_out[3:0]), .out_o(mux2to1_1_out));
    
    mux2to1 M2TO1_2(.select_i(game_enable), .in0(4'b0000), .in1(bcd30_out[7:4]), .out_o(mux2to1_2_out));
    
    counter2 CT2(.clk(clock_1khz), .reset(reset_in), .count_o(count2_out));
    
    seven_segment_decoder SS(.select_i(count2_out), .num_i(score_bcd), .mux1_i(mux2to1_1_out), .mux2_i(mux2to1_2_out), .seg_o(digit_out));
    
    display_control DC(.select_i(count2_out), .digit_select_o(digit_select_out));
    
    
    
endmodule
