module ieee754_addition(
  input [31:0] a, // first floating point number in IEEE 754 format
  input [31:0] b, // second floating point number in IEEE 754 format
  output reg [31:0] result // the sum of a and b in IEEE 754 format
);

  reg sign_a, sign_b; // sign bit of a and b
  reg [7:0] exponent_a, exponent_b; // exponent bits of a and b
  reg [22:0] fraction_a, fraction_b; // fraction bits of a and b
  reg [23:0] sum; // the sum of fraction_a and fraction_b
  reg carry; // carry bit used in addition
  reg [7:0] exponent_diff; // difference between exponent_a and exponent_b

  always @(*) begin
    // extract sign, exponent, and fraction bits from a and b
    sign_a = a[31];
    sign_b = b[31];
    exponent_a = a[30:23];
    exponent_b = b[30:23];
    fraction_a = a[22:0];
    fraction_b = b[22:0];

    // calculate the difference between the exponents
    exponent_diff = exponent_a - exponent_b;

    // shift the smaller fraction right by the exponent difference
    if (exponent_diff > 0) begin
      fraction_b = {fraction_b >> exponent_diff, {exponent_diff{1'b0}}};
    end else if (exponent_diff < 0) begin
      fraction_a = {fraction_a >> -exponent_diff, {(-exponent_diff){1'b0}}};
    end

    // add the fractions
    carry = 1'b0;
    for (int i = 23; i >= 0; i = i - 1) begin
      sum[i] = fraction_a[i] + fraction_b[i] + carry;
      carry = sum[i] > 1;
      sum[i] = sum[i] & 1;
    end

    // normalize the sum
    if (carry == 1) begin
      exponent_a = exponent_a + 1;
      sum[22:0] = sum[21:0];
      sum[23] = 1'b0;
    end

    // combine the sign, exponent, and fraction bits of the result
    result[31] = sign_a ^ sign_b;
    result[30:23] = exponent_a;
    result[22:0] = sum;
  end

endmodule