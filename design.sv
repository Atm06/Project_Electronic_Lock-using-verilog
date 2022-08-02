// Code your design here
module det_01011(input clk, input rstn, input in , output out);
  parameter	 s0      =0,
  			 s01     =1,
 			 s010    =2,
  			 s0101   =3,
 		     s01011  =4,
  			 s2      =5;
  reg[2:0]cur_state,next_state;
  assign out= cur_state == s01011 ? 1:0;
  always @(posedge clk)begin
    if(!rstn)
      cur_state<=s0;
    else
       cur_state<=next_state;
  end
  always @ (cur_state or in) begin
    case( cur_state)
      s0:begin
        if (in) next_state=s01;
        else next_state=s0;
      end
      s01:begin
        if (in) next_state=s010;
        else next_state=s01;
      end
      s010:begin
        if (in) next_state=s0101;
        else next_state=s0;
      end
      s0101:begin
        if (in) next_state=s01011;
        else next_state=s010;
      end
      s01011:begin
        if (in) next_state=s010;
        else next_state=s2;
   // s2= unlock s0=reset
      end
    endcase
  end
endmodule
      
