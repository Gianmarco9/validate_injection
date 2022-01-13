read_netlist pdt2002.v
read_netlist atpg_injection_module.v
run_build_model injection_module
#add_pi_constraints 0 a
run_drc
set_faults -model transition
add_faults -all
set_patterns -internal
run_atpg -auto_compression
#write_faults faults.txt -all -uncollapsed -replace
#write_patterns test_vectors.stil -format stil -internal 
