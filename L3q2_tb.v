`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:12:47 02/04/2023
// Design Name:   sequence_detector_overlapping_mealy
// Module Name:   /home/ise/Lab3/q3tb.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sequence_detector_overlapping_mealy
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module q3tb;

	// Inputs
	reg clk;
	reg rst;
	reg data_in;

	// Outputs
	wire data_out;

	// Instantiate the Unit Under Test (UUT)
	sequence_detector_overlapping_mealy uut (
		.clk(clk), 
		.rst(rst), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin 
clk = 1'b1;
forever #5 clk = ~clk;
end

initial begin
	#5;
	rst = 1'b1;
	#10; 
	rst = 1'b0;
	#5;
	data_in = 1'b1;
	#8;
	data_in = 1'b0;
	#8;
	data_in = 1'b1;
	#8;
	data_in = 1'b0;
	#8;
	data_in = 1'b1;
	#8;
	data_in = 1'b0;
	#8;
	data_in = 1'b1;
	#8;
	data_in = 1'b1;
	#8;
	data_in = 1'b0;
	#8;
	data_in = 1'b1;
	#12;
	data_in = 1'b0;
	#8;
	data_in = 1'b1;
	#8;
	data_in = 1'b0;
	#8;
	data_in = 1'b1;
	#8;
	$finish;
end
      
endmodule