module injection_module ( input a,b,e,f,
			  output y);
						 
	wire sig1,sig2;

	assign sig1 = a || b;
	assign sig2 = e || !f;
	

	assign y = sig1^sig2;	
endmodule	
