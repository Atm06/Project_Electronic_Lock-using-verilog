/////////////DESIGN BENCH CODE FOR ELECTRONIC LOCK SYSTEM///////////

module electronic_lock(clk, rst, b[0],b[1], unlock);
 output reg unlock;
 input clk,rst;
  input [1:0]b;

 reg [2:0] state;
 reg [2:0] next_state;

//State Assignments//
  parameter [2:0] s_rst  = 3'b000;
  parameter [2:0] s0     = 3'b001;
  parameter [2:0] s01    = 3'b010;
  parameter [2:0] s010   = 3'b011;
  parameter [2:0] s0101  = 3'b100;
  parameter [2:0] s01011 = 3'b101;

//Implement State transition//
always @(posedge clk)
 begin
  if (rst)
   state = s_rst;
  else
   state = next_state;
 end

  always @(state,b[0],b[1])
 begin
  case(state)
    s_rst: next_state = b[0] ? s0   : b[1] ? s_rst  : state;
    s0:    next_state = b[0] ? s0   : b[1] ? s01    : state;
    s01:   next_state = b[0] ? s010 : b[1] ? s_rst  : state;
    s010:  next_state = b[0] ? s0   : b[1] ? s0101  : state;
    s0101: next_state = b[0] ? s0101: b[1] ? s01011 : state;
    s01011:next_state = b[0] ? s0   : b[1] ? s_rst  : state;
   default:next_state = s_rst;
  endcase
 end

always @(state)
 begin
  case(state)
   s_rst : unlock <= 1'b0;
   s0    : unlock <= 1'b0;
   s01   : unlock <= 1'b0;
   s010  : unlock <= 1'b0;
   s0101 : unlock <= 1'b0;
   s01011: unlock <= 1'b1;
   default:unlock <= 1'b0;
  endcase
 end
endmodule
