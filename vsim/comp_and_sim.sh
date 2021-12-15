#! /bin/bash

[ -e work ] && rm -rf work
vlib work

vlog -quiet -work ./work ../v_files/injection_module.v
vlog -quiet -work ./work ../v_files/tb_injection_module.v

vsim -c -do simulate.tcl
