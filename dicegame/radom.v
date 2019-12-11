module radom(clk,keyf,num1,num2,clr,rst);//clk need to be high 
input clk;
input keyf;
input clr;
input rst;

output [3:0] num1;
output [3:0] num2;
reg [3:0] num1;
reg [3:0] num2;

reg [3:0] save_num;

reg [3:0] state;


always@(posedge clk or posedge rst)begin
			if(rst==1)begin
				num1<=0;
				num2<=0;
				state<=4'b0000;
				save_num<=0;
			end
			else begin
				save_num<=save_num % 6 + 1;
				case(state)
					4'b0000:begin
						if(clr==1)begin
							state<=4'b0001;
							num1<=0;
							num2<=0;
						end
						else begin 
							state<=4'b0000;
						end
					end
					4'b0001:begin
						if(keyf==1)begin
							num1<=save_num;
							state<=4'b0010;
						end
						else begin 
							state<=4'b0001;
						end
					end
					4'b0010:begin
						if(keyf==0)begin
							num2<=save_num;
							state<=4'b0000;
						end
						else begin 
							state<=4'b0010;
						end
					end
				endcase
			end
end
endmodule

