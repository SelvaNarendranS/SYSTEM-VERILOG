// Q27. Generate addr aligned to 4 bytes

class data_align;
  rand bit[31:0] addr;
  
  rand bit [7:0] byte1;
  rand bit [7:0] byte2;
  rand bit [7:0] byte3;
  rand bit [7:0] byte4;
  
  constraint address_align {
    addr[1:0] == 2'b00;			// 4 byte allignment constraint
    
    solve addr before byte1, byte2, byte3, byte4;
    
    byte1 == addr[7:0];
    byte2 == addr[15:8];
    byte3 == addr[23:16];
    byte4 == addr[31:24];
    
  }
    
endclass


module tb;
  data_align h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED, addr = %b | b1 = %b | b2 = %b | b3 = %b | b4 = %b", $time, h.addr, h.byte1, h.byte2, h.byte3, h.byte4);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
