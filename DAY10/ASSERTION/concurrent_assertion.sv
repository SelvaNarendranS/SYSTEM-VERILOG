module tb;
  bit clk;
  bit [3:0] a;
  bit [4:0] b;
  
  initial begin 
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $display("[%0t] a = %0d | b = %0d", $time, a, b);
    
    repeat(15) begin
      a = $random;
      b = $random;		#4;
    end
    
    $finish;
  end
  
  // sequence and boolean expression
  sequence seq1;
    @(posedge clk) ((a & b) <= 20);
  endsequence
  
  // sequence and boolean expression
  sequence seq2;
    @(posedge clk) ((a | b) <= 20);
  endsequence
  
  property check;
    @(posedge clk) seq1 and` seq2;
  endproperty
  
  a_b_true_condition : assert property (check)
    $display("[%0t] Pass: a = %0d | b = %0d", $time, a, b);
  else
    $error("[%0t] Pass: a = %0d | b = %0d", $time, a, b);
endmodule
