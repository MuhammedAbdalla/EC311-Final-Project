module whackamole(clock_in, reset_in, buttons_in, increment_out, led_out);
    input clock_in;
    input reset_in;
    input [4:0] buttons_in;
    output reg increment_out = 1'b0;
    output reg [4:0] led_out = 5'b00000;
    reg [2:0] Y;
    reg [2:0] Y_next;
    reg w1;
    
    always @(buttons_in) begin   //checks if the corresponding LED is on whenever the user pushes a button
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
    always@(*) begin
        w1= Y[1]^Y[0];
        Y_next={w1,Y[2:1]}; 
        case (Y_next)
            3'b000: led_out = 5'b00001;
            3'b001: led_out = 5'b00001;
            3'b010: led_out = 5'b00010;
            3'b011: led_out = 5'b00100;
            3'b100: led_out = 5'b01000;
            3'b101: led_out = 5'b10000;
            3'b110: led_out = 5'b00010;
            3'b111: led_out = 5'b00100;
        endcase
    end //always
    

    always @(posedge clock_in or negedge reset_in) begin  //light up a random LED every clock cycle
        increment_out = 1'b0;
        if (reset_in==1'b0) begin;
            Y<=3'b001;
     
        end else begin
            Y<= Y_next;
        end
    end //always 
endmodule