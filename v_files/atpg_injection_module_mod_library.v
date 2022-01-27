module injection_module ( input a,b,e,f,
			  output y);
	wire sig1,sig2;

	OR2_X1 Or1(
		.A1(a),
		.A2(b),
		.ZN(sig1)
	);

	OR2_X1 Or2(
                .A1(e),
                .A2(~f),
                .ZN(sig2)
        );

	XOR2_X1 Xor1(
		.A(sig1),
		.B(sig2),
		.Z(y)
	);
	
endmodule	
