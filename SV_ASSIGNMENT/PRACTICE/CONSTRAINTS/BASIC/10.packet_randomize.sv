// Randomize packet size as
// 64 bytes -> 60%
// 512 bytes -> 30%
// 1024 bytes ->10%

class packet;
  rand bit [7:0] a[];
  rand int size;
  
  
  constraint packet_size {
    size dist {64 := 60, 512 := 30, 1024 := 10};
    a.size() == size;
    solve size before a;
  }
  
endclass

module tb;
  packet h;
    
  initial begin
    h = new();
    
    repeat(50) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED size = %0d, a = %0p", $time, h.a.size(), h.a);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
