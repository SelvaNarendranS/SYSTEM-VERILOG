// Write a class arbiter with a 2-bit variable port_id declared as randc. Instantiate this class and call randomize() 10 times in a loop. Write the code to print the value each time. Explain (in comments) what output you expect.

class arbiter;
  randc bit[1:0] port_id;
endclass

module tb;
  int temp[$];
  int cyc = 0;
  
  arbiter a;
  
  initial begin
    a = new();
    
    repeat(10) begin
      if(a.randomize()) begin
        cycle(a.port_id);
        temp.push_back(a.port_id);
        $display("a = %0d --- cycle = %0d", a.port_id, cyc);
      end
      else
        $display("randomization faied");
    end
  end
  
  function void cycle(int val);
    foreach(temp[i]) begin
      if(temp[i] == val) begin
        cyc++;
        temp.delete();
      end
    end
  endfunction
    
endmodule
