`define REF_CLK_PERIOD   (2*15.25us)  // 32.786 kHz --> FLL reset value --> 50 MHz
`define CLK_PERIOD       40.00ns      // 25 MHz

module tb_injection_module ();

reg a_i,b_i,c_i,d_i,e_i,f_i,clk_i,rstn_i;
wire y1_i,y2_i;

	generate
		if (CLK_USE_FLL) begin
			initial
			begin
				#(`REF_CLK_PERIOD/2);
				clk_i = 1'b1;
				forever clk_i = #(`REF_CLK_PERIOD/2) ~clk_i;
			end
		end else begin
			initial
			begin
				#(`CLK_PERIOD/2);
				clk_i = 1'b1;
				forever clk_i = #(`CLK_PERIOD/2) ~clk_i;
			end
		end
	endgenerate

	initial
	begin
		rstn = 0;
		#90 ns; rstn = 1; a = 1;
		#90 ns; c = 1; f = 1;
		#90 ns; b =1; c = 0; 
		#130 ns; a = 0; e = 1;
	end

	injection_module IM(
		.a(a_i),
		.b(b_i),
		.c(c_i),
		.d(d_i,
		.e(e_i),
		.f(f_i),
		.clk(clk_i),
		.rstn(rstn_i),
		.y1(y1_i),
		.y2(y2_i)
	);
					 