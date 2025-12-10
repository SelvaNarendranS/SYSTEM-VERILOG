// WHILE LOOP
// print numbers from 1 to 10, but stop the loop when the value becomes 5.
module while_loop;
  int max = 10;
  int stop = 5;
  byte i = 1;
  
  initial begin
    $write("the values = "); 
    while( i <= 5) begin
      $write("%0d ", i);
      i++;
    end
  end
endmodule