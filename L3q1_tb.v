`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:32 02/04/2023
// Design Name:   up_down_4bitcounter
// Module Name:   /home/ise/Lab3/q1tb.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: up_down_4bitcounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module q1tb;

	// Inputs
	reg up_down;
	reg clk;
	//reg [3:0] data;
	reg reset;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	up_down_4bitcounter uut (
		.out(out), 
		.up_down(up_down), 
		.clk(clk), 
		//.data(data), 
		.reset(reset)
	);

	initial begin
    clk = 0;
    reset = 0;
    up_down = 1;
    #10 reset = 1;
    #10 reset = 0;
    #25 
	 up_down = 0;
	 #45 $finish;
  end
  
  always begin
    #1 clk = ~clk;
  end
      
endmodule

