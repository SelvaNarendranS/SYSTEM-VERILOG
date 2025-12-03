// typedef data type variable

typedef bit [3:0]value1;
typedef logic [7:0]value2;
typedef int value3;

module typedef_datatypes;
  value2 array_logic[5];			// array of unique data type
  
  initial begin 
    value1 bit_data;
    value2 logic_data;
    value3 int_data;				//	creating handle for each individual typedef
    
    bit_data   = 10;
    logic_data = 245;
    int_data   = 314534;
    
    $display("bit_data = %0d", bit_data);
    $display("logic_data = %0d", logic_data);
    $display("logic_data = %0d", int_data);
    
    array_logic = '{31, 46, 94, 64, 224};
    $display("array_logic = %p", array_logic);
  end
endmodule