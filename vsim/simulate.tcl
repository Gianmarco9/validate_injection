vsim -quiet -voptargs=+acc -t ns work.tb_injection_module
log -r *
add wave -divider CLK -position insertpoint  \
sim:/tb_injection_module/clk_i
add wave -divider INPUT -color green -position insertpoint  \
sim:/tb_injection_module/rstn_i \
sim:/tb_injection_module/a_i \
sim:/tb_injection_module/b_i \
sim:/tb_injection_module/c_i \
sim:/tb_injection_module/d_i \
sim:/tb_injection_module/e_i \
sim:/tb_injection_module/f_i
add wave -divider SIGNALS -color yellow -position insertpoint  \
sim:/tb_injection_module/IM/sig1 \
sim:/tb_injection_module/IM/sig2
add wave -divider OUTPUTS -color blue -position insertpoint  \
sim:/tb_injection_module/y1_i \
sim:/tb_injection_module/y2_i

#STF
when -fast { /tb_injection_module/IM/sig1'event and /tb_injection_module/IM/sig1 = 1'h0 } { 
	force -freeze sim:/tb_injection_module/IM/sig1 1'h1 0
	force -deposit -freeze sim:/tb_injection_module/IM/sig1 1'h0 {44 ns}
}

run 400 ns
