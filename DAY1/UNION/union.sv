// union 
module union_declere;
  union {
    int aint;
    byte bbyte;
    integer cinteger;
  } data;							// union memory created by greatest 32bit size of int & integer by variable name
  
  initial begin
    data.aint = 31642;
    $display("union data.a = %p", data);			// assign int
    
    data.bbyte = 8'hff;								// assign byte so previous value also altered
    $display("union data.bbyte = %p", data);
    
    data.cinteger = 864314;							// assign integer so previous value also altered
    $display("union data.integer = %p", data);
  end
endmodule