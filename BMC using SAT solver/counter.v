module counter(input clk, input rst, output reg [1:0] count);
    always @(posedge clk) begin
        if (rst)
            count <= 2'b00;
        else
            count <= count + 1;
    end


    `ifdef FORMAL


        reg f_past_valid = 0;
        always @(posedge clk) begin
            f_past_valid <= 1;

            if (!f_past_valid) begin
                assume(rst);
            end


            // The counter should never reach state 2'b11 (decimal 3)
            if (f_past_valid) begin
                assert(count != 2'b11);
            end
        end
    `endif
endmodule
