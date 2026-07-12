// Q11. Generate unique array elements.

class unique_elements;
  rand bit [3:0] a[10];
  
  
  constraint unique_elements_array {
    unique {a};
    
//     foreach(a[i]) {
//       foreach(a[j]) {
//         if(i != j)
//           a[i] != a[j];
//       }
//     } 
  }
  
endclass

module tb;
  unique_elements h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED, a = %0p", $time, h.a);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
