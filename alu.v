/*
 * Module ALU
 * 
 * Inputs: a, b, c
 * Outputs: out
 * Function: sum = LSB of a + b + c
 * carry = MSB of a + b + c
 */

`include "fulladder.v"
'include "multiplxer.v"
'include "decoder.v"
`define OR or #50
`define AND and #50
`define XOR xor #50
`define NOT not #50

module alu(input a, b, c,s0,s1
                 output out, carry);

   // Intermediate   bits.
   wire                 inva, invb, add0,noand0,add1,naor1,xo1,noand1 ;


   'XOR(inva,a,s0)
   'XOR(invb,b,s1)

  //
   fulladder
     f0(add,carry,inva,invb,c)
   'NAND(naor1,inva,invb)
   'XOR(xo1,inva,invb)
   'OR(noand0,inva,invb)
   'NOT(noand1,noand)
   multiplexer
     m0(out,s0,s1,naor1,x01,noand1,add1)






   
endmodule
