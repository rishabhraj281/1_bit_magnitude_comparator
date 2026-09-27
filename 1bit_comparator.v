module sunchronous_rst(
input wire  a,
input wire  b,
input wire rst,
input wire clk,
output reg [1:0]y
);
always@(posedge clk)begin
if(rst)
y<=2'b10;
else begin
case(1'b1)
a<b:y<=2'b01;
a>b:y<=2'b10;
a==b:y<=2'b00;
default:y<=2'b10;
endcase
end
end
endmodule
