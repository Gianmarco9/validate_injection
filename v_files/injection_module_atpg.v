module injection_module ( input a,b,e,f,
			  output y);
	wire sig1,sig2,fN;

	Inv_Gate Inv1(
		.I1(f),
		.O(fN)
	);

	Or_Gate Or1(
		.I1(a),
		.I2(b),
		.O(sig1)
	);

	Or_Gate Or2(
                .I1(e),
                .I2(f),
                .O(sig2)
        );

	And_Gate And1(
		.I1(sig1),
		.I2(sig2),
		.O(y)
	);
	
endmodule	
