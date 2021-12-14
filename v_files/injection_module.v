module sig (input a,b,output c,d);
	assign c = a;
	assign d = b;
endmodule

module injection_module ( input a,b,e,f,
			  output y,sig1_o,sig2_o);
		
	wire sig1,sig2;

	assign sig1 = a || b;
	assign sig2 = e || !f;
	

	assign y = sig1^sig2;
	
endmodule	
