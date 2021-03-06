module pianxuan(a,b,c,d,g,e,n,clk);
input [7:0]a;
input [7:0]b;
input [7:0]c;
input [7:0]d;
input [7:0]g;
input clk;
output [7:0]e;
output [4:0]n;
reg [7:0]e;
reg [4:0]n;
reg [3:0]f;



always @(posedge clk)
begin
case(f)
 4:begin
  e<=g;
  n<=5'b11110;
  f<=3;
 end
 3:begin 
  e<=a;
  n<=5'b11101;
  f<=2;
 end
 2:begin
  e<=b;
  n<=5'b11011;
  f<=1;
 end
 1:begin
  e<=c;
  n<=5'b10111;
  f<=0;
 end
 0:begin
  e<=d;
  n<=5'b01111;
  f<=4;
 end
endcase 
end
endmodule
