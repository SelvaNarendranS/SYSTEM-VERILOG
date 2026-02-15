// Write a constraint to generate payload data for testing.

class base;
  
  typedef enum {DATA, CORNER_CASE, CTRL, ERROR} pkt_type_enum;
  
  rand pkt_type_enum pkt_type;		// randomize data load type 
  rand int payload_size;			// payload size randomize
  rand bit [7:0] payload[];			// the output variable -- dynamic array
  
  // constraint
    
  // specifing inputs need to randomize based on the types
  constraint payload_size_randomize {
    (pkt_type == DATA)        -> payload_size inside {[1:210]};		// implication constraint -- specific set of range
    (pkt_type == CORNER_CASE) -> payload_size == 2;					// boundary condition
    (pkt_type == CTRL) 	   	  -> payload_size inside {[1:20]}; 		// control inputs
    (pkt_type == ERROR) 	  -> payload_size == 1;					// error injection
  }
  
  constraint payload_size_allocate {
    payload.size() == payload_size;		// allocating payload size
  }
  
  constraint pay_load_input_specify {
    foreach(payload[i]) {
      if(pkt_type == DATA)
        payload[i] inside {[20:230]};					// specific set of range data
      else if(pkt_type == CORNER_CASE) 
        payload[i] inside {8'h00, 8'hFF};				// specific set of values of boundary condition
      else if(pkt_type == CTRL)
        payload[i] == 33;								// repeated value
      else
        payload[i] inside {0, 127, 128, [250:255]};		// error checking places -- error injection
    }
  }
  
  constraint c1 {
    pkt_type dist {
      DATA        := 50, // 50% weight
      CORNER_CASE := 20, // 20% weight
      CTRL        := 10, // 10% weight
      ERROR       := 20  // 20% weight
    };
  }
  
  function void print();
    $display("  		 %0d	 |		%0s		|	%0p	", payload_size, pkt_type, payload);
  endfunction
  
endclass

module tb;
  base b1; 				// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of payload data for testing ---");
    $display("		payload_size | 	pkt_type	| payload");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      