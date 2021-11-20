//counter16 is a 16 bit counter and the main counter for the digital system.
module counter16(reset, increment_in, count_o);
    input reset, increment_in;
    output [15:0] count_o;
    reg [15:0] count_o;
    
    always @ (posedge increment_in or negedge reset) begin
        if (reset == 1'b0) begin
            count_o <= 16'b000000000000000;
        end else begin
            count_o <= (count_o + 1'b1);
        end
    end
endmodule