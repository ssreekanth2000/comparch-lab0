`include "adder.v"

module fulladder4bit_tb ();

   // Registers for adder input.
   reg signed [3:0] a, b;

   // Output of the inputs
   wire signed [3:0] sum;
   wire              carryout;
   wire              overflow;

   FullAdder4bit add(sum, carryout, overflow, a, b);

   initial begin
      $dumpfile("test.vcd");
      $dumpvars();
      $monitor("%d %d %d %d %d", a, b, sum, carryout, overflow);

      // 5 + 3 positive overflow, carry
      a = 4'b0101;
      b = 4'b0011;
      #600

        // -7 - 2 negative overflow, carry
        a = 4'1001;
      b = 4'b1110;
      #600

        // 5 + 2 positive overflow, no carry
        a = 4'b1011;
      b = 4'b0111;
      #600

        // -3 - 5 negative numbers, no overflow
        a = 4'b0101;
      b = 4'b1100;
      #600

        // 7 + 0 extreme positive addition
        a = 4'b0111;
      b = 4'0111;
      
      $finish;
   end
endmodule
