module tb_injection_module ();

reg a_i,b_i,e_i,f_i;
wire y_i;

	
	initial begin
		a_i = 0; b_i = 0; e_i =0; f_i =0;
		#90 a_i = 1;
		#90 f_i = 1; a_i = 0;
		#90 b_i =1; 
		#130 e_i = 1; b_i = 0;
		#40 b_i = 1;
		#60 b_i = 0;
		#60 a_i = 1;
		#50 a_i = 0;
		#30 b_i = 1;
		#70 b_i = 0;
	end

	injection_module IM(
		.a(a_i),
		.b(b_i),
		.e(e_i),
		.f(f_i),
		.y(y_i)
	);
endmodule			 
