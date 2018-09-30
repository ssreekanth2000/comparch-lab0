// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
    reg address0, address1;
    reg in0, in1, in2, in3;
    wire out;

    structuralMultiplexer multiplexer (out,address0,address1,in0,in1,in2,in3);


    initial begin
    $display(" in0 in1 in2 in3 |A0 A1| Out");
    in0=1;in1=0;in2=0;in3=0;address0=0;address1=0; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=1;in1=1;in2=0;in3=0;address0=1;address1=0; #1000
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=1;in1=0;in2=1;in3=0;address0=0;address1=1; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=1;in1=1;in2=1;in3=0;address0=1;address1=1; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=1;in1=1;in2=1;in3=1;address0=0;address1=0; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=0;in1=1;in2=1;in3=1;address0=1;address1=0; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=0;in1=1;in2=0;in3=1;address0=0;address1=1; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    in0=0;in1=1;in2=0;in3=0;address0=1;address1=1; #1000 
    $display("%b  %b %b   %b  |%b  %b | %b | ", in0, in1, in2, in3, address0, address1, out);
    end
    initial begin
    in0=0;in1=0;in2=0;in3=0;address0=0;address1=0; #1000
    $dumpfile("multiplexer.vcd"); 
    $dumpvars(0, testMultiplexer);
    
    end

endmodule
