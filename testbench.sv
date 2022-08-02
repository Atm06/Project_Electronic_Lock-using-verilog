// Code your testbench here
// or browse Examples
module tb;
  reg clk,in,rstn;
  wire out;
  integer i;
  reg[15:0] data;
  always #10clk=~clk;
  det_01011 u0(.clk(clk),.rstn(rstn),.in(in),.out(out));
  initial begin $monitor("i=%0d,Time=%0d,rstn=%b,in=%b,out=%b",i,$time,rstn,in,out);
    $dumpfile("tb.vcd");
    $dumpvars(1,tb);
    clk=0;
    rstn=0;
    #50 
    rstn=1;
    data = 16'b0101101011010110;
    i=0;
    #400
    $finish;
  end
  always @(posedge clk) begin
    in=data >>i;
    i=i+1;
  end
endmodule
  
