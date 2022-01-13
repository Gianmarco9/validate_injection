LIBRERIE:
	-pdt2002 -> libreria gate logici
MODULI:
	-injection_module.v -> circuito semplice in cui vengono stampati tutti i segnali in base a "tb_injection_module_rand.v" per avere una descrizione dettagliata sul comportamento del circuito 
	e per verificare se lo script di fault_injection funziona effettivamente per ogni caso(delay < clk, delay = clk, delay > clk) e ogni segnale propagandosi sull'output.
	
	-atpg_injection_module.v -> mudulo identico al precedente ma vengono usati gate della libreria per essere utilizzato con l'ATPG e valutare i segnali interni.
TB:
	-rand_tb_injection_module.v -> tb usato con injection_module.v
	-atpg_tb_injection_module.v -> tb usato per comparare fault_coverage con ATPG
	-atpg_tb_injection_module_constr_a.v -> tb usato per comparare fault_coverage con patterns ottenuti aggiungendo constraint ad a 0.
	
	
