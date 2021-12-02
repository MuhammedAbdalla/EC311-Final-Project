// Utilized the rand_num_generator to light up the LED correspondin 
// to integer value 0 <= I <= 15

module whackamole(led_bin, buttons_in, enable_in, led_out, increment_out);
    input [2:0] led_bin;
    input [4:0] buttons_in;
    input enable_in;
    output reg [4:0] led_out;
    output reg increment_out = 1'b0;
    reg [2:0] led_current = 3'b000;
    
    always @(*) begin
     if(enable_in == 1'b0) begin
         increment_out = 1'b0;
         if(led_bin != led_current) begin
            case (led_bin)
                3'b001: led_out = 5'b00001;
                3'b010: led_out = 5'b00010;
                3'b011: led_out = 5'b00100;
                3'b100: led_out = 5'b01000;
                3'b101: led_out = 5'b10000;
            endcase
        led_current = led_bin;
        end
        if(buttons_in) begin
            if ((buttons_in[0] == 1'b1) && (led_out[0] == 1'b1)) begin
                led_out = 5'b00000;
                increment_out = 1'b1;
            end else if ((buttons_in[1] == 1'b1) && (led_out[1] == 1'b1)) begin
                led_out = 5'b00000;
                increment_out = 1'b1;
            end else if ((buttons_in[2] == 1'b1) && (led_out[2] == 1'b1)) begin
                led_out = 5'b00000;
                increment_out = 1'b1;
            end else if ((buttons_in[3] == 1'b1) && (led_out[3] == 1'b1)) begin
                led_out = 5'b00000;
                increment_out = 1'b1;
            end else if ((buttons_in[4] == 1'b1) && (led_out[4] == 1'b1)) begin
                led_out = 5'b00000;
                increment_out = 1'b1;
            end
         end    
      end else begin
        led_out = 5'b00000;
        increment_out = 1'b0;
      end
    end// always 
   endmodule