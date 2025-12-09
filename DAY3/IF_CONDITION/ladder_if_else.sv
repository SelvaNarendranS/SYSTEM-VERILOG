// conditional statements
// check grade using ladderif else condition
module ladder_if_else;
  byte mark;
  
  initial begin
    // initialize
    repeat(10) begin
      mark = $urandom_range(30, 100); #1;
      if(mark >= 90)
        $display("mark = %0d | grade = A ", mark);
      else if(mark >= 75)
        $display("mark = %0d | grade = B ", mark);
      else if(mark >= 60)
        $display("mark = %0d | grade = C ", mark);
      else if(mark >= 40)
        $display("mark = %0d | grade = D ", mark);
      else
        $display("mark = %0d | grade = FAIL ", mark);
    end
  end
endmodule