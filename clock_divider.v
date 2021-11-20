// Can add more clocks for 3 different levels


//Clock divider splits the 100MHz clock into 1kHz and 1Hz
//1kHz clock output is for the refresh rate of the 7-seg displays
//1Hz clock out put is the for the automatic counting mode for counter16
module clock_divider(clk, reset, khz, hz);
    input clk, reset;
    output khz, hz;
    
    reg khz, hz;
    
    parameter [50:0] zero = 9'd000000000;
    
    reg [50:0] c_khz = zero;
    reg [50:0] c_hz = zero;
    
    parameter [50:0] divHZ = 50'd100000000;
    parameter [50:0] divKHZ = 50'd10000;
    //implement reset for all internal counter
    always @ (posedge clk or negedge reset) begin
        if (reset == 1'b0) begin
            c_khz <= zero;
            c_hz <= zero;
            khz <= 1'b0;
            hz <= 1'b0;
         end else begin
            
            // kHz clock handler
            c_khz = c_khz + 50'd1;
            if (c_khz >= (divKHZ-1)) begin
                c_khz = zero;
            end
            khz = (c_khz<divKHZ/2)?1'b1:1'b0;
            
            // Hz clock handler
            c_hz = c_hz + 50'd1;
            if (c_hz  >= (divHZ-1)) begin
                c_hz <= zero;
            end  
            hz = (c_hz<divHZ/2)?1'b1:1'b0;
                      
         end
     end
endmodule