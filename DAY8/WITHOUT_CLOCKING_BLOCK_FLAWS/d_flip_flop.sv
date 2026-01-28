// clocking block - Race condition(without clocking block)
// D flip flop - design

module dff(
  input clk, rst, d,
  output reg q, q_bar
);
  
  always_ff @(posedge clk) begin
    if(rst)
      q <= 0;
    else
      q <= d;
  end
  
  assign q_bar = ~q;
endmodule
  