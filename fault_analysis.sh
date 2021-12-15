#!/bin/sh

while IFS= read -r line; do 
	python ./py_files/modificaFile.py ./vsim/simulate.tcl ./vsim/trashed.tcl $line; 
#	cat vsim/simulate.tcl
	rm ./vsim/trashed.tcl;
	var=$(cat files/signal.txt)
	if test -f "report/${var}"; then
		echo "$var exist"
	else
		echo "$var analysis"
		cd vsim
		./comp_and_sim.sh; #here the check difference between golden and faulty is done manually checking the waveforms
		cd ..
		diff report/golden_simulation.txt report/faulty_simulation.txt >> report/${var}
		rm report/faulty_simulation.txt
	fi
done < ./files/all_signals.txt


