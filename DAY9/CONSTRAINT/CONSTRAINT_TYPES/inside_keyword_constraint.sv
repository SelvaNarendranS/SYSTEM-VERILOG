// constraint -- inside keyword & its various implementations

// define for dedine based range
`define START 50
`define END   3150


class parent #(parameter MIN = 20,
               parameter MAX = 100);
  
  rand int unsigned a;
  rand int unsigned b;
  rand int unsigned c;
  rand int unsigned d;
  rand int unsigned e;
  rand int unsigned f;
  rand int unsigned g;
  
  // constraints
  
  // specific range of value  -- constant range
  constraint c1 {			
    a inside {[20:115]};	// range constraint -- generates random values with in the specific range declared in constraint
  }
  
  // specific set of values
  constraint c2 {			
    b inside {121, 167, 3197, 479, 94788, 2};		// randomization of values with a pre-determined valued(loaded values --(shuffle of the given values))
  }
  
  // Combination of set of values and range
  constraint c3 {
    c inside {[10:136], 140, 149, 197, [201:364], 452, 473, 5561};		// randomization of values with specfic range and can also able to neglect specific values with in the range
  }
  
  // Define based range in constraint
  constraint c4 {			
    d inside {[`START:`END]};	// generates random values with in the specific range declared by the define declared -- it's simular to range constraint
  }
  
  // variavle based range in constraint
  constraint c5 {			
    e inside {[a:b]};	// range is not determined it is randomnly generated or it can be allocated at run time -- which are used as minimum and maximum range to generate random values
  }
  
  // Parameter based range in constraint
  constraint c6 {			
    f inside {[MIN:MAX]};	// generates random values with in the specific range declared by the Parameter declared -- it's simular to range constraint
  }
  
  // Inverted inside constraint
  constraint c7 {			
    !(g inside {[20:115]});	// invert range constraint -- generates random values out of the specific range declared in constraint
  }
  
  // function to print random generated values
  function void print();
    $display("a = %0d | b = %0d | c = %0d | d = %0d | e = %0d | f = %0d | g = %0d ", a, b, c, d, e, f, g);
  endfunction
  
endclass

module inside_range_of_values;
  parent p1;	// class parent handle
  
  initial begin
    p1 = new();		// parent object allocation
    
    $display("\n----------printing inside keyword constraints ramdomized values----------------");
    repeat(5) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end     
  end
endmodule