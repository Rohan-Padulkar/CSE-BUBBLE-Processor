module fp_add(
    input wire [31:0] a,
    input wire [31:0] b,
    output reg [31:0] c
);

    // Extract the exponent and mantissa from the inputs
    wire [30:23] exp_a = a[30:23];
    wire [22:0] mant_a = a[22:0];
    wire [30:23] exp_b = b[30:23];
    wire [22:0] mant_b = b[22:0];

    // Determine which input has the larger exponent and adjust the smaller one
    wire [30:23] larger_exp;
    wire [22:0] larger_mant;
    wire [6:0] exp_diff = exp_a - exp_b;
    wire sign = a[31] ^ b[31];

    if (exp_diff[6] == 1) begin
        larger_exp = exp_a;
        larger_mant = mant_a;
        mant_b = {1'b1, mant_b};
        exp_b = exp_a - 1;
    end
    else if (exp_diff[6:0] == 7'b0000000) begin
        larger_exp = exp_a;
        larger_mant = {1'b1, mant_a};
        mant_b = {1'b1, mant_b};
        exp_b = exp_a - 1;
    end
    else begin
        larger_exp = exp_b;
        larger_mant = mant_b;
        mant_a = {1'b1, mant_a};
        exp_a = exp_b - 1;
    end

    // Perform the mantissa addition
    wire [23:0] sum_mant = larger_mant + mant_a;

    // Normalize the result
    wire [24:0] normalized_mant;
    wire [8:0] norm_shift;
    if (sum_mant[23] == 1) begin
        normalized_mant = sum_mant >> 1;
        norm_shift = 1;
    end
    else begin
        normalized_mant = sum_mant;
        norm_shift = 0;
    end

    // Compute the exponent of the result
    wire [30:23] sum_exp = larger_exp + norm_shift;

    // Pack the result into a 32-bit floating-point value
    assign c[31] = sign;
    assign c[30:23] = sum_exp;
    assign c[22:0] = normalized_mant;

endmodule