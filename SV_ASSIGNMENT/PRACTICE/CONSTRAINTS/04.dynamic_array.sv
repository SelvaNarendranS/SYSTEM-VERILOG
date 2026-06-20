// Write a class memory_transaction that contains a dynamic array data_q[] of bytes (bit [7:0]). Write constraints to ensure:
// The size of the array is between 5 and 15.
// The element at index 0 must be 8'hA5.
// Every element at an odd index (1, 3, 5...) must be a multiple of 3.

class memory_transaction;
  rand bit[7:0] data_q[];
  rand bit[3:0] size;
  
  constraint size_gen {
    data_q.size() inside {[5:15]};
  }
  
  constraint dynamic_data {
    foreach(data_q[i]) {
      (i == 0) -> (data_q[i] == 8'hA5);
      (i % 2 == 1) -> (data_q[i] % 3 == 0);
    }
  }
  
endclass

module tb;
  memory_transaction trans;
  
  initial begin
    trans = new();
    
    repeat(10) begin
      if(!trans.randomize())
        $display("randomization faied");
      else
        $display("data_q = %0p", trans.data_q);
    end
  end
  
endmodule
