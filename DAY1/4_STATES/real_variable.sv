// 4 states - real variable data type 
`timescale 1ns/1ps
module vaiable_real;
  real      a;		// 64 bit unsigned floating point
  shortreal b;		// 32 bit unsigned floating point
  realtime	c;		// 64 bit unsigned floating point
  
  initial begin
    
    $display("\nDefault value of real = %0.5f", a);
    $display("Default value of shortreal = %0.3f", b);
    $display("Default value of realtime = %0.3f", c);
    
    #5.48;
    // Initialize
	a = 614.3143; 		//real
	b = 10.36;			//shortreal
	c = $realtime;		//realtime
    
    $display("\nDefault value of real = %0.5f", a);
    $display("Default value of shortreal = %0.3f", b);
    $display("Default value of realtime = %0.3f", c);
    
    #4;
    // Initialize
	a = 'bxx1z; 		//real
	b = 'b001zzxx;		//shortreal
	c = $realtime;		//realtime
    
    $display("\nDefault value of real = %0.5f", a);
    $display("Default value of shortreal = %0.3f", b);
    $display("Default value of realtime = %0.3f", c);
    
  end
endmodule
