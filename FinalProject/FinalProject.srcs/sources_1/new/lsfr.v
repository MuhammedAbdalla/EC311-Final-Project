`timescale 1ns / 1ps

// randum number generatoir
module lsfr(clk, reset, enable, Y );

    input clk;
    input reset;
    input enable;
    output [2:0] Y = 3'b001;
    reg [2:0] Y, Y_next;
    reg w1;
    reg [2:0] w2;
    
    always @(posedge clk or negedge reset) begin
        if (reset==1'b0) begin
            Y<=3'b001;
        end else begin
            if(enable == 1'b0) begin
                Y <= Y_next;
            end 
        end
    end //always block
 
    always @(*)begin 
        if(enable == 1'b0) begin
            w1= Y[1]^Y[0];
            w2={w1,Y[2:1]}; 
            case (w2)
                3'b000: Y_next = 3'b100;
                3'b110: Y_next = 3'b011;
                3'b111: Y_next = 3'b101;
                default : Y_next = w2;
            endcase
        end
     end
    
endmodule 