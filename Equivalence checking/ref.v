module ref(input clk,input a, input b,output reg y);
always @(posedge clk) y<=a&b;
endmodule
