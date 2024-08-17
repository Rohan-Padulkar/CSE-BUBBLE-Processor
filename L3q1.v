`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:25 02/04/2023 
// Design Name: 
// Module Name:    q1 
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
module up_down_4bitcounter (
out,
up_down,
clk,
//data,
reset
);

//Output Ports
output [3:0] out;

//Input Ports
//input [3:0] data;
input up_down, clk, reset;

//Internal Variables
reg [3:0] out;

//Start of Code
always @(negedge clk)
if (reset) begin // active high reset
out <= 4'b0 ;
end else if (up_down) begin
out <= out + 1;
end else begin
out <= out - 1;
end

endmodule 
