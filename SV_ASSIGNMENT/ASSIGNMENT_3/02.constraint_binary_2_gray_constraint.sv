// How can you generate Gray code sequences using SystemVerilog?
// constraint --  binary to gray randomization 

class parent;
  rand bit [7:0]binary;
  rand bit [7:0]gray;
  
  // constraint
  constraint c1 {
    binary != 1;
    gray == ((binary) ^ (binary >> 1));
  }
  
  // post randomization for random binary value to gray code
//   function void post_randomize();
  //     $display("binary binary = %b", b);
//     binary = binary ^(binary >> 1);
//   endfunction
  
  // function to print random generated values
  function void print();
    $display("\tbinary = %b | gray = %b", binary, gray);
  endfunction
  
endclass

module unique_array_constraint;
  parent p1;		// class handle
  
  initial begin 
    p1 = new();		// object allocation
    
    $display("\n----------printing binary to gray randomization elements ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule