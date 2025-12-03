// userdefined typedef enum
module typedef_enum;
  typedef enum logic[2:0]{apple, grapes, mango, orange}fdata;
  int temp;
  
  initial begin
    fdata fruits1;			// creating handle name for enum typedef
    fdata fruits2;
    
    fruits1 = mango;
    temp = fruits1;
    $display("Current fruit = %s(%0d)", fruits1.name(), temp);
    
    fruits1 = grapes;
    temp = fruits1;
    $display("Current fruit = %s(%0d)", fruits1.name(), temp);
    
    fruits2 = orange;
    temp = fruits2;
    $display("Current fruit = %s(%0d)", fruits2.name(), temp);

  end
endmodule