// FORK - JOIN_ANY
module fork_join_any;
  initial begin
    $display("\n Starting of the initial block");
    $display("time = %0t - start of initial", $time); #3;
    
    $display("time = %0t - entering fork join", $time);
    fork      
      #5 $display("time = %0t - signal A delay 5", $time);
      #2 $display("time = %0t - signal B delay 2", $time);
      #3 $display("time = %0t - signal c delay 3", $time);
    join_any
    $display("time = %0t - Event detected has Exit from the fork join", $time);
    
    #2 $display("time = %0t - signal D outside fork join delay 2", $time);
    
    $display("time = %0t - end of initial delay", $time);
    $display(" ending of the initial block\n");
  end
endmodule