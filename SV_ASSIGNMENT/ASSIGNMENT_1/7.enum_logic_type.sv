// What is enumerated type? Define enumerated type for the following set of opcodes - ADD=2, SUB-3, JE=10, JNE-11, LD= 12, ST-13 with type logic and size 4 bits
module enum_type_logic;
  
  // enum value for respective variavle
  typedef enum logic [3:0] {
    ADD = 2, 
    SUB = 3,
    JE  = 10,
    JNE = 11,
    LD  = 12,
    ST  = 13
  } opcode;
  
  // declared new variable name for enum
  opcode op;
  
  initial begin 
    
    for(int i = 0; i <= 15; i++) begin
      op = opcode'(i);
      if(op.name != "")
        $display("opcode = %0d(%s)", op, op.name);
      else
        $display("value %0d not defined opcode", i);
    end
  end
endmodule