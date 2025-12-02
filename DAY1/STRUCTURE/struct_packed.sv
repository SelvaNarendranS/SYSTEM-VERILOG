// structure packed
module struct_packed;
  struct packed{
    logic [15:0]data1;			// data1 + data2 + data3+ data4
    logic [7:0]data2;			//  16 + 8 + 4 + 2 = 30 bits size of structure
    reg [3:0]data3;
    bit [1:0]data4;
  }info;
  
  initial begin
    
    info = '{16'hab3, 8'hfa, 4'hd, 3};				// packed assign
    $display("\ninfo order assignment = %p", info);
    
    info.data3 = 4'hf;								// packed member access
    $display("info individual member = %p", info);
    
    $display("info individual member access = %0h", info.data2); 
    
    info[29:7] = 'hdba32;							// Packed index range access
    $display("info individual member access = %p\n", info);
  end
endmodule
    
    
    
    