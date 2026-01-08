// Create a typdef Instr_t of struct for the instruction and then declare the memory as array of Instr_t. 

module typedef_struct;
  
  // structure
  typedef struct {
    string   name;
    bit[7:0] age;
    real     height;
    longint  number;
  } instr_t;
  
  instr_t data[5];		// array of structure
  
  initial begin 
    // initialization of array of structure
    data[0] = '{"sam", 26, 5.8, 7894_34};
    data[1] = '{"jack", 21, 6.4, 5471_25};
    data[2] = '{"Asta", 16, 5.3, 9785_87};
    data[3] = '{"yuno", $random, 7.2, $random};
    
    // display statement
    $display("The array of structure");
    foreach (data[i])
      $display("The elements in the structure - %0d = %0p", i, data[i]);
  end
      
endmodule

