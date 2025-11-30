// static casting real to int & time
module casting_real_int_time();

  real real_data;  
  int int_data; 
  time time_data;

 initial begin
   real_data = 185.1515;
   $display("\nbefore casting real_data = %0.5f(%0.5f)",real_data, real_data);
   
   int_data = int'(real_data); // casting real to int
   $display("after casting real to int = %b(%0d)",int_data, int_data);

   time_data = time'(real_data); // casting real to time
   $display("after casting real to time = %0t(%0t)\n", time_data, time_data);
 end
endmodule