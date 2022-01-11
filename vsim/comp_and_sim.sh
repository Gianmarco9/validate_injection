#! /bin/bash

[ -e work ] && rm -rf work
vlib work

vlog -quiet -work ./work ../v_files/pdt2002.v
vlog -quiet -work ./work ../v_files/injection_module_atpg.v
#vlog -quiet -work ./work ../v_files/injection_module.v
vlog -quiet -work ./work ../v_files/tb_injection_module.v

vsim -do simulate.tcl
