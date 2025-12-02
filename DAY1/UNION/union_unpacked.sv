// union unpacked
module union_unpacked;
  union {
    int aint[4];
    byte bbyte[2];
    integer cinteger;
  } data;							// union memory created by greatest 32bit size of int & integer by variable name
  
  initial begin
    data.aint = '{3162542, 7641, 69874, 6143};
    $display("union data.a = %p", data);			// assign int
    
    data.bbyte = '{31, 214};						// assign byte so previous value also altered
    $display("union data.bbyte = %p", data);
    
    data.cinteger = 864314;							// assign integer so previous value also altered
    $display("union data.integer = %p", data);
  end
endmodule