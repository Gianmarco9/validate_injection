module tb_injection_module ();

reg a_i,b_i,e_i,f_i;
wire y_i;

	
	initial begin
		a_i = 0; b_i = 0; e_i =0; f_i =0;
		#90000 a_i = 1;
		#90000 f_i = 1; a_i = 0;
		#90000 b_i =1; 
		#130000 e_i = 1; b_i = 0;
		#40000 b_i = 1;
		#60000 b_i = 0;
		#60000 a_i = 1;
		#50000 a_i = 0;
		#30000 b_i = 1;
		#70000 b_i = 0;
	end

	injection_module IM(
		.a(a_i),
		.b(b_i),
		.e(e_i),
		.f(f_i),
		.y(y_i)
	);
endmodule			 
