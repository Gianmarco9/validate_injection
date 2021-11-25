module injection_module ( input a,b,c,d,e,f,clk,rstn,
						 output y1,y2);
						 
	reg sig1,sig2,out1,out2;
	
	always @ (posedge clk) begin
		if (!rstn) begin
			sig1 = 1'b0;
			sig2 = 1'b0;
			out1 = 1'b0;
			out2 = 1'b0;
		end else begin
			if((sig1 || a || b) & c) begin
				sig1 = 1'b1;
				out1 = 1'b1;
			end else begin 
				sig1 = 1'b0;
				out1 = 1'b0;
			end

			if((sig2 || !d) & (e || !f)) begin
				sig2 = 1'b1;
				out2 = 1'b1;
			end else begin
				sig2 = 1'b0;
				out2 = 1'b0;
			end
		end
	end
	
	assign y1 = out1;
	assign y2 = out2;	
endmodule	
