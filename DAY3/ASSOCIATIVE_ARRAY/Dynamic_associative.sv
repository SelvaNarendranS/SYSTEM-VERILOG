// Dynamic array of associative array 
module dynamic_associative;
  int dyn_assoc[] [string];  
  		// Dynamic & associative 
  
  initial begin 
    dyn_assoc = new[2];
    dyn_assoc[0]["A"] = 10;
    dyn_assoc[0]["B"] = 20;
    
    dyn_assoc[1]["A"] = 100;
    dyn_assoc[1]["S"] = 1;
    dyn_assoc[1]["Z"] = 12548;
    
    $display("\ndynamic_associative entire = %p", dyn_assoc);
    $display("dynamic_associative size = %0d", dyn_assoc.size());
    foreach(dyn_assoc[i,KEY])
      $display("Dynamic_associative column wise dyn_assoc[%0d][%s] = %0d", i, KEY, dyn_assoc[i][KEY]);
    
    dyn_assoc = new[3];
    dyn_assoc = '{'{"A":100, "B":200, "c":300},
                  '{"A":7800, "S":1000},
                  '{"A":4500, "G":569, "c":3025, "F":348}};
    $display("\ndynamic_associative entire = %p", dyn_assoc);
    $display("dynamic_associative size = %0d", dyn_assoc.size());
    foreach(dyn_assoc[i,KEY])
      $display("Dynamic_associative column wise dyn_assoc[%0d][%s] = %0d", i, KEY, dyn_assoc[i][KEY]);
  end
endmodule