module keyboard(clk,button,keyf);
input button;
input clk;
output keyf;
reg keyf;

reg [3:0] num;

always@(posedge clk)begin
	if(button==0)begin
		num<=num+1;
		if(num>4'b0110)begin
			keyf<=1;
			num<=4'b0110;
		end
	end
	else if(button!=0) begin
		num<=0;
		keyf<=0;
	end
end

endmodule
