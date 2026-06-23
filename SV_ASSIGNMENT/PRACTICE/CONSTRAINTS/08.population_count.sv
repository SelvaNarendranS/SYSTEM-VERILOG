  // Constraining Bit Count (Population Count)
  // Write a class data_word with a 32-bit variable word. Constrain word so that it has exactly 12 bits set to 1 (i.e., $countones(word) == 12). Additionally, ensure that the most significant nibble (bits 31:28) is never zero.

  class data_word;
    rand bit [31:0] word;

    constraint bit_count {
      $countones(word) == 12;

      word[31:28] != 4'b0000;
    }

  endclass

  module tb;
    data_word dw;

  initial begin
      dw = new();

      repeat(10) begin
        if(!dw.randomize())
          $display("randomization faied");
        else
          $display(" word = %b", dw.word);
      end
    end

  endmodule
