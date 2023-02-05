module lab1_part2 (input wire a, b, sel, output wire y);
  assign y = (sel == 1'b0) ? a : b;
endmodule
