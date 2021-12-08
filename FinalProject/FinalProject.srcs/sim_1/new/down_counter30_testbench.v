
module down_counter30_testbench(

    );
    
    reg clk_hz, reset, enable;
    wire [5:0] count30_out;
    wire count30_enable;
    
    down_counter30 DC30(.clk_hz(clk_hz), .reset(reset), .enable(enable), .count30_out(count30_out), .count30_enable(count30_enable));
    
    initial begin
    clk_hz = 1'b0;
    reset = 1'b1;
    enable = 1'b0;
    end
    
    always begin
    #1 clk_hz = 1'b1;
    #1 clk_hz = 1'b0;
    end
    
    always begin 
    #30 enable = 1'b1;
    end
endmodule