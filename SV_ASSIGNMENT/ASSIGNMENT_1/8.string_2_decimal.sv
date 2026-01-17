// Write a module that converts a numeric string (e.g., "12345") to an integer and performs arithmetic on it. For example, add 100 to the integer and display the result 

module casting_string_longint();

 longint lngint_data;  
 string string_data; 

 initial begin
   string_data = "5";
   lngint_data = string_data.atoi();		// atoi function used to convert string to decimal
   $display("\nNumeric string to decimal in string = %0s   \nAfter conversion = %0b(%0d)",string_data, lngint_data, lngint_data);
   
   lngint_data += 100;		// adding an decimal value
   $display("Sum result = %0d", lngint_data);
 
 end
endmodule