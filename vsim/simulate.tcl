vsim -quiet -voptargs=+acc -t ns work.tb_injection_module
log -r *
#STF
#when -fast { /clk_i'event and /clk_i = 1'h1 } {
#	force -freeze /tb_injection_module/IM/sig1 [examine /tb_injection_module/IM/sig1] -cancel { 44 ns }
#}
#

set lst [list]

#STF
#when -fast { /IM/sig1'event and /IM/sig1 = 1'h1 } {
#	uivar lst
#	lappend lst $now
#}

#run 700 ns

#restart -f

#nowhen *

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

set flag 1
force -freeze sim:/tb_injection_module/IM/sig1 1'h1 {5 ns} -cancel {44 ns}
#foreach var $lst {
#	if {$flag == 1} {
#		force -freeze sim:/tb_injection_module/IM/sig1 1'h0 $var -cancel { 44 ns }
#		puts buono
#	} else {
#		set flag 1
#		puts nobuono
#	}
#}

run 700 ns

