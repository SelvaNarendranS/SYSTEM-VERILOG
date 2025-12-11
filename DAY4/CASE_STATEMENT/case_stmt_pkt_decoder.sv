// CASE (Normal case)
// A packet decoder
module case_stmt;
  logic [3:0]info;
  enum logic[4:0]{LOAD, STORE, JUMP, ALU_OP, INVALID}data;
  logic [4:0]out;
  
  always_comb begin
    out = 0;
    case(info)
      LOAD    : begin
        out[0] = 1;
        data   = LOAD;
      end
      STORE   : begin 
        out[1] = 1;
        data   = STORE;
      end
      JUMP    :  begin
        out[2] = 1;
        data   = JUMP;
      end
      ALU_OP  :  begin
        out[3] = 1;
        data   = ALU_OP;
      end
      default :  begin
        out[4] = 1;
        data   = INVALID;
      end
    endcase
  end
  
  initial begin
    $monitor("$time = %0t | info = %0d | out = %s(%b)", $time, info, data, out);
    // initialize
    info = 0; #1;
    
    info = 2; #1;
    info = 4; #1;
    info = 1; #1;
    info = 3; #1;
    info = 0; #1;
    
  end
endmodule