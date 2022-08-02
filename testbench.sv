////////////////TEST BENCH CODE FOR ELECTRONIC LOCK//////////////////

module electronic_lock_tb;
  reg clk, rst;
  reg [1:0]b ; 
  wire unlock;
  integer   i;
  reg [15:0]data;
  
  electronic_lock dut(clk, rst, b[0], b[1], unlock);
  always #1 clk = ~clk;
  
  initial
    begin
      $monitor("time=%0t, b[o]=%b, b[1]=%b, unlock=%b", $time, b[0], b[1], unlock);
      $dumpfile("output.vcd");
      $dumpvars(1, electronic_lock_tb);
      clk = 0;
      rst = 0;
      #50  rst =1;
      data = 16'b1110101101101110;
      i=0;
      #400 $finish;
      end
  
  always @ (posedge clk) begin
    b  = data >> i;
    i = i+1;
  end
endmodule
    
    
