`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:41 02/05/2023 
// Design Name: 
// Module Name:    L3Q1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DFlipFlop
(
  input wire    reset_n,
  input wire    clk,
  input wire    d,
  output wire   q,
  output wire   q_n
);

  wire w1, w2, w3, w4, w5, w6;

  //master
  nand na1(w1, d, clk);
  nand na2(w2, clk, ~d);
  nand na3(w3, w1, w4);
  nand na4(w4, w3, w2);

  //slave
  nand na5(w5, w3, ~clk);
  nand na6(w6, ~clk, ~w3);
  nand na7(q, reset_n, w5, q_n);
  nand na8(q_n, q, w6);

endmodule
module Count4Down 
(
  input wire      reset_n,
  input wire      clk,
  //input wire mode,
  output [3:0]    q
);

   wire qn0, qn1, qn2, qn3;

	DFlipFlop ff0(reset_n, clk, qn0, q[0], qn0);
   DFlipFlop ff1(reset_n, q[0], qn1, q[1], qn1);  
	DFlipFlop ff2(reset_n, q[1], qn2, q[2], qn2);
	DFlipFlop ff3(reset_n, q[2], qn3, q[3], qn3);
	

endmodule

