// 2D packed and 1D unpacked
module static_array;		   //   	row * width
  logic [3:0][7:0]arr[0:4];   // packed --> 4*8 = 32bit array width
  							  // unpacked --> 5 = 5 locations each ahas 32 bit size
  initial begin				  //            row 
    // Initialize
    arr = '{100,400,700,1000,1300};
    
    // Display initialize values
    $display("staic mixed array entire arr  = %p\n", arr);
    
    // reallocate values to specific bit & individual array element access
    arr[3] = 1600;
    $display("static mixed array unpacked row element arr[3] = %p\n", arr[3]);
    
    
    $display("\nPart select byte level access Before changing arr[%0d] = %p",0, arr[0]);
    $display("Part select byte level access Before changed arr[%0d][%0d] = %b\n",0, 2, arr[0][2]);
    arr[0][2] = 'd200;
    $display("Part select byte level access After changed arr[%0d] = %p",0, arr[0]);
    $display("Part select byte level access After changed arr[%0d][%0d] = %b\n",0, 2, arr[0][2]);
    
    $display("Part select bit level access Before changing arr[%0d][%0d] = %b",0, 2, arr[0][2]);
    $display("Part select bit level access Before changed arr[%0d][%0d][%0d] = %b\n",0, 2, 3, arr[0][2][3]);
    arr[0][2][3] = 'd0;
    $display("Part select bit level access After changed arr[%0d][%0d] = %b",0, 2, arr[0][2]);
    $display("Part select bit level access After changed arr[%0d][%0d][%0d] = %b\n",0, 2, 3, arr[0][2][3]);
    
    $display("\nstatic mixed array entire arr = %p", arr);
    foreach(arr[i]) begin
      $display("static mixed Unpacked array arr[%0d] = %0d", i, arr[i]);
      foreach(arr[i][j]) begin
        foreach(arr[i][j][k])
          $display("static mixed packed array arr[%0d][%0d][%0d] = %0d", i, j, k, arr[i][j][k]);
      end
    end
  end    
endmodule