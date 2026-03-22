module top(input A, B, C, output F);


    assign F = (A & B) | (A & B & C);
endmodule
