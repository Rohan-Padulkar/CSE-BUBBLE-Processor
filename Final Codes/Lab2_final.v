`timescale  1ns / 1ps
module N_2bitadder(S,Cout,A, B, Cin);
parameter N=16;
input  [N-1:0] A, B;
input  Cin;
output Cout;
output [N-1:0] S;

wire   [N:0] c;

assign c[0] = Cin;

genvar i;
generate
    for (i = 0; i < N; i=i+1) 
    begin : loop
		FullAdder fa(A[i],B[i],c[i],S[i],c[i+1]);
    end
endgenerate

assign Cout = c[N];

endmodule
module FullAdder(FA_A, FA_B, Cin, FA_S, Cout);
    input  FA_A, FA_B, Cin;
    output FA_S, Cout;
    assign {Cout,FA_S} = FA_A + FA_B + Cin;

endmodule

module N_bitadder(S,cout,A,B);
parameter N = 32;
input [N-1:0] A,B;
output [N-1:0]S;
output cout;
wire [N/2-1:0] s1,s0;
wire c0,c1,c;

N_2bitadder a1(S[N/2-1:0],c,A[N/2-1:0],B[N/2-1:0],1'b0);
N_2bitadder a2(s0,c0,A[N-1:N/2],B[N-1:N/2],1'b0);
N_2bitadder a3(s1,c1,A[N-1:N/2],B[N-1:N/2],1'b1);

assign S[N-1:N/2] = (c==0) ? s0:s1; 
assign cout = (c==0) ? c0:c1;

endmodule


module tb_new;

	// Inputs
    parameter N = 32;
	reg [N-1:0] A;
	reg [N-1:0] B;

	// Outputs
	wire [N-1:0] S;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	N_bitadder uut (
		.S(S), 
		.cout(cout), 
		.A(A), 
		.B(B)
	);

    wire [N-1:0]result;
    wire check;
    assign result = A + B;
    assign check = result^{cout,S};

	initial begin
		// Initialize Inputs
	
		

		// Wait 100 ns for global reset to finish
		#100;
        A  = 432; B = 5345;
		#10 A = 234234; B = 321423;
        
	end

    initial begin
        $monitor("A=%d B=%d output = %d carry = %d result = %d check = %d",A,B,S,cout,result,check);
    end
      
endmodule