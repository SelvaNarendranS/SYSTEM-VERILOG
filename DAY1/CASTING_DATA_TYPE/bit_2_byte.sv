// static casting bit to byte
module casting_bit_byte();

 byte byte_data;  
 bit [3:0] bit_data; 

 initial begin
   bit_data = 4'b1011;
   $display("\nbefore casting bit_data = %0b(%0d)",bit_data, bit_data);
   
   byte_data = byte'(bit_data); // casting bit to byte
   $display("after casting bit to byte = %b(%0d)\n",byte_data, byte_data);
 end
endmodule