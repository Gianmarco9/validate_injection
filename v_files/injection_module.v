module injection_module ( input a,b,e,f,
			  output y);
	
	integer now = 0;
	integer fd;
	reg clk;
	wire sig1,sig2;

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
			@(a or b or e or f or sig1 or sig2);
			$fwrite(fd,now," ps:	a=",a," b=",b," e=",e," f=",f," -> sig1=",sig1," sig2=",sig2," -> y=");
			$fdisplay(fd,y);
		end
		$fclose(fd);
	end

	assign sig1 = a || b;
	assign sig2 = e || !f;
	

	assign y = sig1^sig2;
	
endmodule	
