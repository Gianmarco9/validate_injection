module injection_module ( input a,b,c,d,e,f,clk,rstn;
						 output y1,y2);
						 
	reg sig1,sig2;
	
	always @ (posedge clk)
		if (!rstn)
			sig1 = 1'b0;
			sig2 = 1'b0;
			y1 = 1'b0;
			y2 = 1'b0;
		else begin
			if((sig1 || a || b) & c)
				y1 <= 1'b1;
				sig1 = 1'b1;
			else begin
				y1 <= 1'b0;
				sig1 = 1'b0;
			end
			
			if((sig2 || !d) & (e || !f))
				y2 <= 1'b1;
				sig2 = 1'b1;
			else begin
				y2 <= 1'b0;
				sig2 = 1'b0;
			end
		end

	
endmodule	