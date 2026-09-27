module tb_sunchronous_rst;

    reg a, b, rst, clk;
    wire [1:0] y;

    sunchronous_rst DUT (
        .a(a),
        .b(b),
        .rst(rst),
        .clk(clk),
        .y(y)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b a=%b b=%b -> y=%b",
                   $time, rst, a, b, y);

        rst = 1; a = 0; b = 0;
        @(posedge clk); #1;

        rst = 0; a = 0; b = 1;
        @(posedge clk); #1;

        a = 1; b = 0;
        @(posedge clk); #1;

        a = 0; b = 0;
        @(posedge clk); #1;

        a = 1; b = 1;
        @(posedge clk); #1;

        rst = 1;
        @(posedge clk); #1;

        $display("Testbench completed.");
        $finish;
    end

endmodule