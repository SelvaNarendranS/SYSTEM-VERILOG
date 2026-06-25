// Generating a Sorted Array
// Write a class sorter containing a dynamic array values[] of size exactly 8 (16-bit integers). Write constraints to ensure that the array is always strictly sorted in ascending order (e.g., values[0] < values[1] < ... < values[7]).

class sorter;
  rand shortint values[];
  
  constraint size {
    values.size() == 8;
  }
  
  constraint ascending_order {
    
    foreach(values[i]) {
      if(i > 0)
        values[i] > values[i-1];
    }
  }
  
endclass

module tb;
  sorter sort;

initial begin
    sort = new();
    
    repeat(10) begin
      if(!sort.randomize())
        $display("randomization faied");
      else
        $display(" values = %0p", sort.values);
    end
  end
  
endmodule
