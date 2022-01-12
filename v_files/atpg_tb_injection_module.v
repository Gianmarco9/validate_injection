module tb_injection_module ();

	reg a_i,b_i,e_i,f_i;
	wire y_i;
	integer now = 0;
        integer fd;
        reg clk;

        initial begin
                clk = 1'b1;
                forever clk = #1 ~clk;
        end

        always @ (clk) begin
                now = now + 1;
        end

        initial begin
                fd = $fopen("../report/faulty_simulation.txt","w");
                while(1) begin
                        @(a_i,b_i,e_i,f_i,y_i);
                        $fwrite(fd,now," ps:	y=");
                        $fdisplay(fd,y_i);
                end
                $fclose(fd);
        end


	initial begin
		a_i = 0; b_i = 0; e_i =0; f_i =0;
		//pattern0
		#90000 a_i = 0; b_i = 0; e_i =0; f_i =1;
		#90000 a_i = 1; b_i = 0; e_i =0; f_i =1;
		//pattern1
		#90000 a_i = 0; b_i = 0; e_i =1; f_i =0; 
		#130000 a_i = 1; b_i = 1; e_i =1; f_i =0;
		//pattern2
		#40000 a_i = 0; b_i = 0; e_i =0; f_i =1;
		#60000 a_i = 0; b_i = 1; e_i =0; f_i =1;
		//pattern3
		#60000 a_i = 1; b_i = 1; e_i =1; f_i =0;
		#50000 a_i = 0; b_i = 0; e_i =0; f_i =1;
		//pattern4
		#30000 a_i = 1; b_i = 0; e_i =0; f_i =1;
		#70000 a_i = 0; b_i = 0; e_i =0; f_i =0;
		//pattern5
		#60000 a_i = 0; b_i = 1; e_i =0; f_i =1;
		#50000 a_i = 1; b_i = 1; e_i =1; f_i =1;

	end

	injection_module IM(
		.a(a_i),
		.b(b_i),
		.e(e_i),
		.f(f_i),
		.y(y_i)
	);
endmodule			 
