module Float_adder(input [31:0] a, input [31:0] b, output reg [31:0] result);

  integer i;
  reg sign_a, sign_b;
  reg [7:0] exp_a, exp_b;
  reg [23:0] fraction_a, fraction_b;
  reg [24:0] sum;
  reg carry; 
  wire [7:0] exp_diff; 
  assign exp_diff = a[30:23]- b[30:23];

  always @(*) begin
   
    sign_a = a[31];
    sign_b = b[31];
    exp_a = a[30:23];
    exp_b = b[30:23];
    fraction_a = {1'b1,a[22:0]};
    fraction_b = {1'b1,b[22:0]};

    if (exp_diff > 0) begin
    //     fraction_b[22:23-exponent_diff]<= 0;
    //   fraction_b[22-exponent_diff:0] <= fraction_b[22:exponent_diff];
        fraction_b = fraction_b >> exp_diff;
    end else begin
    //   fraction_a[22:23-exponent_diff]<= 0;
    //   fraction_a[22-exponent_diff:0] <= fraction_a[22:exponent_diff];
        fraction_a = fraction_a >> exp_diff;
    end
  

    sum = fraction_a + fraction_b;

    if (sum[24] == 1) begin
      exp_a = exp_a + 1;
      result[22:0] = sum[23:1];
    end
    else result[22:0]= sum[22:0];

    result[31] = sign_a ^ sign_b;
    result[30:23] = exp_a;
  end

endmodule

module testbench;

  // module instantiation
  reg [31:0] a;
  reg [31:0] b;
  wire [31:0] result;
  Float_adder add(
    .a(a), 
    .b(b), 
    .result(result)
  );

  // output declaration
  

  // simulation
  initial begin
    a = 32'b01000000101010011001100110011010;
    b = 32'b10111111100011001100110011001101;
#5;

    $display("%b", result);
  end

// 01000000011000000000000000000000
// 01000000011000000000000000000000
endmodule