module gray_ctr
  #(parameter WIDTH=4)
  (input logic clk,                
   input logic reset,
   output logic [WIDTH-1:0] q);    
   
  logic [WIDTH-1:0] counter;
  
  always_ff @ (posedge clk or posedge reset) 
    if (reset) counter <= 0;
    else       counter <= counter + 1;      
   
  always_comb begin
    q[WIDTH-1] = counter[WIDTH-1];
    foreach (counter[i]) 
      q[i-1] = counter[i]^counter[i-1];  
  end  
  
endmodule
