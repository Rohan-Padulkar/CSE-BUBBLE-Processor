`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:39 02/05/2023
// Design Name:   Count4Down
// Module Name:   /home/ise/L3/xz.v
// Project Name:  L3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Count4Down
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module xz;

	// Inputs
	reg reset_n;
	reg clk;

	// Outputs
	wire [3:0] q;

	// Instantiate the Unit Under Test (UUT)
	Count4Down uut (
		.reset_n(reset_n), 
		.clk(clk), 
		.q(q)
	);

	initial begin 
    forever begin 
        clk <= 0; 
        #5  
        clk <= 1; 
        #5 
        clk <= 0; 
    end 
end 

  initial begin 

    reset_n = 0; 
    #12 
    reset_n = 1; 
    #170 
    reset_n = 0; 
    #12 
    reset_n = 1; 

    #200  $finish;
  end
      
endmodule

