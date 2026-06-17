// Write a SystemVerilog class packet_config. It should have a 32-bit variable address. Constrain address so that it falls either in the range 0x1000 to 0x1FFF or in the range 0x3000 to 0x3FFF. Also, ensure the address is always a multiple of 4.

class packet_config;
  rand bit [31:0]address;
  
  constraint addr {
    address inside {[32'h1000:32'h1FFF], [32'h3000:32'h3FFF]};
    address % 4 == 0;
  }
  
endclass

module tb;
  
  packet_config pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("address = 32'h%8h", pkt.address);
    end
    
  end
endmodule
