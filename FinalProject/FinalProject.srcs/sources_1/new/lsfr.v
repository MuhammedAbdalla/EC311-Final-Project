`timescale 1ns / 1ps

// randum number generatoir
module lsfr( clk, reset, Y );

    input clk;
    input reset;
    output[2:0] Y;
    reg [2:0] Y, Y_next;
    reg w1;
    
    always @(posedge clk or negedge reset) begin
        if (reset==1'b0) begin
            Y<=3'b001;
        end else begin
            Y<= Y_next;
        end
    end //always block
 
    always @(*)begin 
        w1= Y[1]^Y[0];
        Y_next={w1,Y[2:1]}; 
     end
    
endmodule 