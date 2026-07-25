// Q28. Generate addresses 
// 0
// 4
// 8
// 12
// 16

class aligned_address;
  rand bit[31:0] addr;
  protected int temp = 0;
  
  constraint address_align {
      addr == temp * 4;
  }
  
  function void post_randomize();
    temp++;
  endfunction
    
endclass


module tb;
  aligned_address h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED, addr = %0d", $time, h.addr);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 

// class aligned_address;
//   rand bit[31:0] addr[31:0];
  
//   constraint address_align {
//     foreach(addr[i])
//       addr[i] == i * 4;
//   }
    
// endclass


// module tb;
//   aligned_address h;
    
//   initial begin
//     h = new();
    
//     repeat(5) begin
//       if(!h.randomize())
//         $display("Randomization FAILED");
//       else
//         $display("[%0t] Randomization PASSED, addr = %p", $time, h.addr);
//       #1;
//     end
    
//     #10;
//     $finish;
//   end
  
// endmodule 
