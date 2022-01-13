#! /bin/bash

[ -e work ] && rm -rf work
vlib work

#vlog -quiet -work ./work ../v_files/pdt2002.v
#vlog -quiet -work ./work ../v_files/atpg_injection_module.v
vlog -quiet -work ./work ../v_files/injection_module.v
vlog -quiet -work ./work ../v_files/rand_tb_injection_module.v
#vlog -quiet -work ./work ../v_files/atpg_tb_injection_module.v
#vlog -quiet -work ./work ../v_files/atpg_tb_injection_module_constr_a.v

vsim -c -do simulate.tcl
