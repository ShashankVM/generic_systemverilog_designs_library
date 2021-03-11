module tb;
  parameter WIDTH = 4;
  
  reg clk;
  reg rstn;
  wire [WIDTH-1:0] out;
  
  gray_ctr #(WIDTH)	u0 (.clk (clk),
                .reset (rstn),
                .q (out));
  
  always #10 clk = ~clk;
  
  initial begin
    {clk, rstn} <= 0;
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);                
    $monitor ("T=%0t out=%b", $time, out);
    #50 rstn = 1;
    #50 rstn = 0;
    #50 rstn = 1;
    #50 rstn = 0;
    #800 
    $finish;
  end
  
endmodule
