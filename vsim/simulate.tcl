vsim -quiet -voptargs=+acc -t ns work.tb_injection_module
log -r *

#STF
#when -fast { /IM/sig1'event and /IM/sig1 = 1'h1 } {
	#when -fast -label pd {tst_clk'event} {
	#	if {/tb_injection_module/IM/sig1 = 1'h0} {
#		force -freeze /tb_injection_module/IM/sig1 1'h1 -cancel { 44 ns }
	#	nowhen pd
	#}
#}


#set lst [list]
#set flag 0
#set previousTime  0
#set nowTime  0
#set forbiddenTime  0

#STF
#when -fast -label main { /IM/sig1'event and /IM/sig1 = 1'h1 } {
#	uivar flag
#	set flag 1
#}

#when -fast -label pd {tst_clk'event} {
#	uivar flag;
#	if {[examine /tb_injection_module/IM/sig1] == "1'h0" && $flag == 1} {
#		puts [examine /tb_injection_module/IM/sig1]
#		set flag 0
#		force -freeze /tb_injection_module/IM/sig1 1'h1 -cancel { 44 ns } 
#	}
#}

#when -fast -label pd {tst_clk'event} {
#	uivar forbidTime
#	uivar previousTime
#	uivar nowTime
#
#	set previousTime $nowTime
#	if { [examine /tb_injection_module/IM/sig1] == "1'h0" } {
#		set nowTime 0
#	} elseif { [examine /tb_injection_module/IM/sig1] == "1'h1" } {
#		set nowTime 1
#	}
#	if {$previousTime == 1 && $nowTime == 0 && $now != $forbidTime} {
#		puts $now
#		puts $forbidTime
#		force -freeze /tb_injection_module/IM/sig1 1'h1 -cancel { 44 ns }
#		set forbidTime [expr {$now + 45}]
#	}
#}

set forbiddenTime 0

when -fast {/IM/sig1'event and /IM/sig1 = 1'h0} {
	uivar forbiddenTime
	if {$now != $forbiddenTime || $forbiddenTime == 0} {
		force -freeze /tb_injection_module/IM/sig1 1'h1 -cancel { 44 ns }
		set forbiddenTime [expr {$now + 44}]
	}
}


run 900 ns

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

#force -freeze sim:/tb_injection_module/IM/sig1 1'h1 {40 ns} -cancel {84 ns}
#foreach var $lst {
#	puts $var
#	set delay [expr {$var + 44}]
#	puts $delay
#
#	if {$var != 0} {
#		force -freeze sim:/tb_injection_module/IM/sig1 1'h1 $var -cancel $delay
#		puts buono
#	} else {
#		set flag 1
#		puts nobuono
#	}
#}

#run 700 ns

