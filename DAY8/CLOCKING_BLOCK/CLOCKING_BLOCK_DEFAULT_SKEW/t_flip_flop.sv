// clocking block - with default skew
// t flip flop - design

module dff(
  input clk, rst, t,
  output reg q, q_bar
);
  
  always_ff @(posedge clk) begin
    if(rst)
      q <= 0;
    else begin
      case(t)
        0 : q <= q;
        1 : q <= ~q;
      endcase
    end
  end
  
  assign q_bar = ~q;
endmodule
  