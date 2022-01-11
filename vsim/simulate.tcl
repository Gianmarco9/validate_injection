vsim -quiet -voptargs=+acc -t ps work.tb_injection_module
log -r *

#set forbiddenTime 0
#set delay 44000
#
#when -fast {/IM/y'event and /IM/y = 1'h1} {
#	uivar delay
#	uivar forbiddenTime
#	if {$now != $forbiddenTime} {
#		force -freeze /tb_injection_module/IM/y 1'h0 -cancel $delay
#		set forbiddenTime [expr {$now + $delay}]
#	}
#}

run 900 ns 

add wave -divider INPUT -color green -position insertpoint  \
sim:/tb_injection_module/IM/a \
sim:/tb_injection_module/b_i \
sim:/tb_injection_module/e_i \
sim:/tb_injection_module/f_i
add wave -divider SIGNALS -color yellow -position insertpoint  \
sim:/tb_injection_module/IM/sig1 \
sim:/tb_injection_module/IM/sig2
add wave -divider OUTPUTS -color blue -position insertpoint  \
sim:/tb_injection_module/y_i

#quit -f
