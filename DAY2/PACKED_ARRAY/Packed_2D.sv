module packed_2D;
  logic [3:0][7:0]logic_2d;
  bit [3:0][16:0]bit_2d;
  
  initial begin
    // initialize values
    logic_2d = '{156, 235, 147, 2};  
    bit_2d = 'hfa_79;
    bit_2d[3] = 'b1;
    
    // Display initialize values
    $display("Packed 2D array logic_2d = %p(%b)", logic_2d, logic_2d);
    $display("Packed 2D array bit_2d = %p(%b)", bit_2d, bit_2d);
    
    // reallocate values to specific bit 
    logic_2d[3][4:1] = 'h10;
    bit_2d[2][8:0] = 'd148;
    
    // Display new allocated values
    $display("Packed 2D array logic_2d = %p(%b)", logic_2d, logic_2d);
    $display("Packed 2D array bit_2d = %p(%b)", bit_2d, bit_2d);
    
  end
endmodule