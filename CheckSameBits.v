module CheckSameBits(
    input [31:0] A,
    input [31:0] B,
    output reg O
);

always @* begin
    O = (A & B) == A; // Bitwise AND followed by comparison
end

endmodule

module CheckSameBits_tb;

reg [31:0] A, B;
wire O;

CheckSameBits UUT(
    .A(A),
    .B(B),
    .O(O)
);

initial begin
    // Test case 1: All bits are the same
    A = 32'b10101010101010101010101010101010;
    B = 32'b10101010101010101010101010101010;
    #10;
    $display("Test case 1: A=%b, B=%b, O=%b", A, B, O);

    // Test case 2: All bits are not the same
    A = 32'b10101010101010101010101010101010;
    B = 32'b01010101010101010101010101010101;
    #10;
    $display("Test case 2: A=%b, B=%b, O=%b", A, B, O);

    // Test case 3: A and B are both zeros
    A = 32'b00000000000000000000000000000000;
    B = 32'b00000000000000000000000000000000;
    #10;
    $display("Test case 3: A=%b, B=%b, O=%b", A, B, O);

    // Test case 4: A and B are both ones
    A = 32'b11111111111111111111111111111111;
    B = 32'b11111111111111111111111111111111;
    #10;
    $display("Test case 4: A=%b, B=%b, O=%b", A, B, O);

end

endmodule
