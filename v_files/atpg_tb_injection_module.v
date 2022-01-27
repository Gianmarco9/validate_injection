`celldefine
`ifdef functional
   `timescale 1ps / 1ps
   `delay_mode_zero
`else
   `timescale 1ps / 1ps
   `delay_mode_path
`endif

module tb_injection_module ();

	reg a_i,b_i,e_i,f_i;
	wire y_i;
        integer fd;

       	initial begin
		fd = $fopen("../report/faulty_simulation.txt","w");
		a_i = 0; b_i = 0; e_i =0; f_i =0;
		//pattern0
		#50000 a_i = 0; b_i = 0; e_i =0; f_i =1;
		#50000 a_i = 1; b_i = 0; e_i =0; f_i =1;
		#1 $fwrite(fd,"101 ns:    y=");
                $fdisplay(fd,y_i);
		//pattern1
		#49999 a_i = 0; b_i = 0; e_i =1; f_i =0; 
		#50000 a_i = 1; b_i = 1; e_i =1; f_i =0;
		#1 $fwrite(fd,"201 ns:    y=");
                $fdisplay(fd,y_i);
		//pattern2
		#49999 a_i = 0; b_i = 0; e_i =0; f_i =1;
		#50000 a_i = 0; b_i = 1; e_i =0; f_i =1;
		#1 $fwrite(fd,"301 ns:    y=");
                $fdisplay(fd,y_i);
		//pattern3
		#49999 a_i = 1; b_i = 1; e_i =1; f_i =0;
		#50000 a_i = 0; b_i = 0; e_i =0; f_i =1;
		#1 $fwrite(fd,"401 ns:    y=");
                $fdisplay(fd,y_i);
		//pattern4
		#49999 a_i = 1; b_i = 0; e_i =0; f_i =1;
		#50000 a_i = 0; b_i = 0; e_i =0; f_i =0;
		#1 $fwrite(fd,"501 ns:    y=");
                $fdisplay(fd,y_i);
		//pattern5
		#49999 a_i = 0; b_i = 1; e_i =0; f_i =1;
		#50000 a_i = 1; b_i = 1; e_i =1; f_i =1;
		#1 $fwrite(fd,"601 ns:    y=");
                $fdisplay(fd,y_i);

		$fclose(fd);
	end

	injection_module IM(
		.a(a_i),
		.b(b_i),
		.e(e_i),
		.f(f_i),
		.y(y_i)
	);
endmodule			 
