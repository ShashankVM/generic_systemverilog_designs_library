module binary_ctr
  #(parameter WIDTH=4)
  (input logic clk, 
             reset,
             mode, 
   output logic [WIDTH-1:0] q);    
   
  logic [WIDTH-1:0] counter;
  
  always_ff @ (posedge clk) 
    if (reset == 1) q <= 'b0;
    else            q <= (mode == 1) ? q + 1 : q - 1; 
  end
  
endmodule
