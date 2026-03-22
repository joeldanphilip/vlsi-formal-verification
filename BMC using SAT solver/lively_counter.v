module counter(input clk, input rst, output reg [1:0] count);
    always @(posedge clk) begin
        if (rst)
            count <= 2'b00;
        else
            count <= count + 1;
    end

    // --- Formal Verification Properties ---
    `ifdef FORMAL
        reg f_past_valid = 0;
        always @(posedge clk) begin
            f_past_valid <= 1;
            
            if (!f_past_valid) begin
                assume(rst);
            end

            // LIVENESS PROPERTY
            if (f_past_valid && !rst) begin
                assert property (s_eventually count == 2'b00);
            end
        end
    `endif
endmodule
