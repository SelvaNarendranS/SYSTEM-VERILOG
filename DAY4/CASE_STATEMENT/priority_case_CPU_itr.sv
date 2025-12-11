// PRIORITY CASEZ
// CPU interrupt controller gets interrupt signals
module priority_case;
  logic [3:0]in;
  logic [2:0]out;
  
  always_comb begin
    out = 0;
    priority case(in)
      1 : out = 0;			// high priority
      2 : out = 1;
      4 : out = 2;
      8 : out = 3;			// low priority
    endcase
  end
  
  initial begin
    $monitor("Time = %0t | in = %0d | out = %0d(%0s)", $time, in, out, ((out ==0) ? "itr0" : 
                                                              	  		(out == 1) ? "itr1" : 
                                                                 		(out == 2) ? "itr2" :
                                                                  		(out == 3) ? "itr3" : "no"));
    
    // initialize
    in = 0; #1;
    
    repeat(10) begin
      in = $random; #1;
    end
  end
  
endmodule