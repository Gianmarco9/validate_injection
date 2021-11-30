module injection_module ( input a,b,c,d,e,f,clk,rstn,
						 output y1,y2);
						 
	wire sig1,sig2;
	reg out1,out2;

	assign sig1 = a || b;
	assign sig2 = e || !f;
	
	always @ (posedge clk) begin
		if (!rstn) begin
			out1 = 1'b0;
			out2 = 1'b0;
		end else begin
			if(sig1 & c) begin
				out1 = 1'b1;
			end else begin 
				out1 = 1'b0;
			end

			if(!d & sig2) begin
				out2 = 1'b1;
			end else begin
				out2 = 1'b0;
			end
		end
	end
	
	assign y1 = out1;
	assign y2 = out2;	
endmodule	
