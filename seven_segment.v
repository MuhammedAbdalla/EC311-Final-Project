module seven_segment_decoder(num, display);
    input [3:0] num;
    output [6:0] display;
    reg [6:0] z,display; 
    // Seven seg display combinations for each 4 bit number
    //0 thru f: 0 to 9 & a to f
    always @ (*) begin
        case (num)
            4'b0000 : z = 7'b1111110;
            4'b0001 : z = 7'b0110000;
            4'b0010 : z = 7'b1101101; 
            4'b0011 : z = 7'b1111001;
            4'b0100 : z = 7'b0110011;
            4'b0101 : z = 7'b1011011;  
            4'b0110 : z = 7'b1011111;
            4'b0111 : z = 7'b1110000;
            4'b1000 : z = 7'b1111111;
            4'b1001 : z = 7'b1111011;
            4'b1010 : z = 7'b1110111; 
            4'b1011 : z = 7'b0011111;
            4'b1100 : z = 7'b1001110;
            4'b1101 : z = 7'b0111101;
            4'b1110 : z = 7'b1001111;
            4'b1111 : z = 7'b1000111;
        endcase
        display[0] = ~z[0];
        display[1] = ~z[1];
        display[2] = ~z[2];
        display[3] = ~z[3];
        display[4] = ~z[4];
        display[5] = ~z[5];
        display[6] = ~z[6];  
    end    
endmodule