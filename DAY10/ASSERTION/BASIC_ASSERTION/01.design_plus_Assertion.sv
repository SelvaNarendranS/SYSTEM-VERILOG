// Basic assertions

// basic code
module basic(
  input clk,
  input in,
  output reg out
);
  
  always @(posedge clk) begin
    if(in)
      out = 1;
    else
      out = 0;
  end
  
  // assertion
  always @(posedge clk) begin
    valid : assert(in == out)
      $info("Test Case is Pass");        // true statement
      else
        $error("Output is wrong according to the input --- Fail");      // false statement
  end
  
endmodule
