// modport with task
// design - converter(binary2gray/ gray2binary)

module converter #(parameter WIDTH = 8) (intf.dut intff);
  
  reg [WIDTH-1:0]sft_reg;
  integer i;
  
  always @(*) begin
    if(intff.rst) begin
      intff.b2g = 0;
      intff.g2b = 0;
      sft_reg	= 0;
    end
    else begin
      if(intff.en) begin		// en == 1 -- binary 2 gray
        sft_reg 	= intff.data_in >> 1;
        intff.b2g   = intff.data_in ^ sft_reg;
      end
      else begin			// en == 0 -- gray 2 binary
        sft_reg[WIDTH-1] = intff.data_in[WIDTH-1];		// Msb bit convertion
        for(i = WIDTH-2; i >= 0; i--) begin
          sft_reg[i] = sft_reg[i+1] ^ intff.data_in[i]; // remaining bits convertion
        end
        intff.g2b = sft_reg;		// output of gray 2 binary
      end
    end
  end
  
endmodule