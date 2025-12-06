// Bitwise operator
module bitwise_operator;
  byte a, b;
  
  initial begin
    a = 'b1010_1111;
    b = 'b0001_1011;
    																			// bitwise
    $display("\n  a bitwise and(&) b            = %b", a & b);					// &		
    $display("a bitwise (inclusive)(|) or b   = %b", a | b);					// |
    $display(" negation a(~)                  = %b", ~a );						// ~
    $display("a bitwise xor(exclusive)(^) b   = %b", a ^ b);					// ^
    $display("a xnor (~^ or ^~) b             = %b / %b \n", a~^ b, a^~ b);		// ~^ or ^~
  end
endmodule