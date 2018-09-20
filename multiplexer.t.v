// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"

module testMultiplexer ();
  // Your test code here
  reg addr0, addr1;
  reg in0, in1, in2, in3;
  wire out;

  // behavioralMultiplexer multiplexer(out, addr0, addr1, in0, in1, in2, in3);
  structuralMultiplexer multiplexer(out, addr0, addr1, in0, in1, in2, in3);

  initial begin
  $dumpfile("multiplexer.vcd");
  $dumpvars();
  $display("Structural Multiplexer Truth Table");
  $display("I0 I1 I2 I3 Addr0 Addr1| Out| Expected Output");
  in0=0;in1=0;in2=0;in3=0;addr0=0;addr1=0; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 0 (Follows I0)", in0, in1, in2, in3, addr0, addr1, out);
  in0=1;in1=0;in2=0;in3=0;addr0=0;addr1=0; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 1 (Follows I0)", in0, in1, in2, in3, addr0, addr1, out);
  in0=0;in1=0;in2=0;in3=0;addr0=1;addr1=0; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 0 (Follows I1)", in0, in1, in2, in3, addr0, addr1, out);
  in0=0;in1=1;in2=0;in3=0;addr0=1;addr1=0; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 1 (Follows I1)", in0, in1, in2, in3, addr0, addr1, out);
  in0=0;in1=0;in2=0;in3=0;addr0=0;addr1=1; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 0 (Follows I2)", in0, in1, in2, in3, addr0, addr1, out);
  in0=0;in1=0;in2=1;in3=0;addr0=0;addr1=1; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 1 (Follows I2)", in0, in1, in2, in3, addr0, addr1, out);
  in0=0;in1=0;in2=0;in3=0;addr0=1;addr1=1; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 0 (Follows I3)", in0, in1, in2, in3, addr0, addr1, out);
  in0=0;in1=0;in2=0;in3=1;addr0=1;addr1=1; #1000
  $display("%b  %b  %b  %b   %b     %b   | %b  | 1 (Follows I3)", in0, in1, in2, in3, addr0, addr1, out);
  $finish();
  end

endmodule
