//Code for 7 segment decoder
module seven_segment_decoder(
    select_i,
    num_i,
    count5_i,
    seg_o);
    
    input [1:0] select_i;
    input [7:0] num_i;
    input [3:0] count5_i;
    output reg [6:0] seg_o;
    reg [3:0] d_i;
    
    always @(*) begin
        case (select_i)
            2'b00: d_i = num_i[3:0];
            2'b01: d_i = num_i[7:4];
            2'b10: d_i = count5_i;
        endcase
        case (d_i)
            4'b0000: seg_o = 7'b0000001;
            4'b0001: seg_o = 7'b1001111;
            4'b0010: seg_o = 7'b0010010;
            4'b0011: seg_o = 7'b0000110;
            4'b0100: seg_o = 7'b1001100;
            4'b0101: seg_o = 7'b0100100;
            4'b0110: seg_o = 7'b0100000;
            4'b0111: seg_o = 7'b0001111;
            4'b1000: seg_o = 7'b0000000;
            4'b1001: seg_o = 7'b0000100;
            4'b1010: seg_o = 7'b0001000;
            4'b1011: seg_o = 7'b1100000;
            4'b1100: seg_o = 7'b0110001;
            4'b1101: seg_o = 7'b1000010;
            4'b1110: seg_o = 7'b0110000;
            4'b1111: seg_o = 7'b0111000;
         endcase
    end
          
endmodule