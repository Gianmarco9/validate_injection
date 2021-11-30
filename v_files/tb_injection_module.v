`define REF_CLK_PERIOD   (2*15.25us)  // 32.786 kHz --> FLL reset value --> 50 MHz
`define CLK_PERIOD       40.00ns      // 25 MHz

module tb_injection_module ();

reg a_i,b_i,c_i,d_i,e_i,f_i,clk_i,rstn_i,tst_clk;
wire y1_i,y2_i;

	initial begin
		tst_clk = 1'b1;
		forever tst_clk = #1 ~tst_clk;
	end

	initial
	begin
		 clk_i = 1'b1;
		forever clk_i = #20 ~clk_i;
		
	end

	initial
	begin
		rstn_i = 0; a_i = 0; b_i = 0; c_i = 0; d_i =0; e_i =0; f_i =0;
		#90 rstn_i = 1; a_i = 1;
		#90 c_i = 1; f_i = 1; a_i = 0;
		#90 b_i =1; c_i = 0; 
		#130 a_i = 0; e_i = 1; b_i = 0;
	end

	injection_module IM(
		.a(a_i),
		.b(b_i),
		.c(c_i),
		.d(d_i),
		.e(e_i),
		.f(f_i),
		.clk(clk_i),
		.rstn(rstn_i),
		.y1(y1_i),
		.y2(y2_i)
	);
endmodule			 
