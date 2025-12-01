// static casting logic to byte
module casting_logic_byte();

  byte byte_data;  
  bit [7:0] logic_data; 

 initial begin
   logic_data = 'b1011xzx;
   $display("\nbefore casting logic_data = %0b(%0d)",logic_data, logic_data);
   
   byte_data = byte'(logic_data); // casting logic to byte
   $display("after casting bit to byte = %b(%0d)\n",byte_data, byte_data);
 end

endmodule
