// Write a module that checks if a string is a palindrome (reads the same forwards and backwards). For example, check if "racecar" is a palindrome.

module palindrome;
  string data;
  string temp;
  int i;
  bit flag = 0;
  
  initial begin
    data = "racecar";
    $display("The input string = %s", data);
    
    for(i = data.len(); i >=0; i--) begin
      temp = {temp, data[i]};
    end
    $display("string reversed = %s", temp);
    
    $display("The given string is a %0s", (data == temp) ? "PALINDROME" : "NOT A PALINDROME");
    
    // method 2
//     for(i = 0; i >= data.len()/2; i++) begin
//       if(data[i] != temp[i])
//         flag = 1;
//     end
    
//     if(flag)
//       $display("The given string is a NOT A PALINDROME");
//     else
//       $display("The given string is a PALINDROME");
  end
endmodule
