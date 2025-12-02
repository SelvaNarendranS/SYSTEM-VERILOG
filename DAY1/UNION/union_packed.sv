// union packed
module union_packed;
  union packed{
    bit [7:0]a;					// for packed same data type & same size are allowed
    bit [7:0]b;
    bit [7:0]c;
  } data;							// union memory created by greatest 8bit size by variable name
  
  initial begin
    data.a = 'hf9;
    $display("union data.a = %p", data);			// assign int
    
    data.b = 'haf;								// assign byte so previous value also altered
    $display("union data.b = %p", data);
    
    data.c = 'hd6;							// assign integer so previous value also altered
    $display("union data.c = %p", data);
  end
endmodule