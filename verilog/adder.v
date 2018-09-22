/*
 * Module adder
 * 
 * Inputs: a[4], b[4]
 * Outputs: sum[4], carry, overflow
 * Function: sum = Least 4 significant bits of a + b + c
 * carry = MSB of a + b + c
 * overflow = the sum is more than 4 bits.
 * Comment Integer 2's complement addition.
 */

`include "fulladder.v"

module FullAdder4bit (output [3:0] sum,
                      output      carryout, overflow,
                      input [3:0] a, b);

   // Intermediate carry bits
   wire                           carry0, carry1, carry2;

   // Get the first carry bit by using a halfadder
   halfadder half(a[0], b[0], sum[0], carry0);

   // Use this carry bit to cascade through the rest of the numbers
   // and the corresponding carry bit.
   fulladder
     add0(a[1], b[1], carry0, sum[1], carry1),
     add1(a[2], b[2], carry1, sum[2], carry2),
     add2(a[3], b[3], carry2, sum[3], carryout);

   // There is an overflow iff the last two carry bits are different.
   `XOR (overflow, carry2, carryout);
endmodule
