#! /env/python

import sys
import shutil
import re

#argv[0]: nome del programma stesso
#argv[1]: nome del programma da modificare
#argv[2]: nuovo nome del programma
#argv[3]: ST
#argv[4]: signal
if len(sys.argv) != 5:
	print("[ERROR] : wrong number of arguments")
	sys.exit(-1)

run = sys.argv[1]
trashed = sys.argv[2]
shutil.move(run, trashed)

destination = open(run,"w")
source = open(trashed,"r")
 
ST = sys.argv[3]
pattern1 = '^when -fast {/' 
pattern2 = '^\s*force'
if ST == "F":
	toPass = "STF"
elif ST == "R":
	toPass = "STR"

signal = sys.argv[4];

if ST == "F": 
	write1 = "when -fast {/" + signal + "'event and /" + signal + " = 1'h0} {"
	write2 = "\t\tforce -freeze /tb_injection_module/" + signal + " 1'h1 -cancel $delay"
#	print("ciao1")	
	for line in source:
#		print(line)
		result1 = re.match(pattern1,line)	
		result2 = re.match(pattern2,line)
		if result1:
			destination.write(write1 + "\n")		
		elif result2:
			destination.write(write2 + "\n")			
		else:	
			destination.write(line)
elif ST == "R":
	write1 = "when -fast {/" + signal + "'event and /" + signal + " = 1'h1} {"
	write2 = "\t\tforce -freeze /tb_injection_module/" + signal + " 1'h0 -cancel $delay"
#	print("ciao2")
	for line in source:
#		print(line)
		result1 = re.match(pattern1,line)	
		result2 = re.match(pattern2,line)
		if result1:
			destination.write(write1 + "\n")	
		elif result2:
			destination.write(write2 + "\n")			
		else:	
			destination.write(line)
else:
	print("[ERROR] : wrong ST")
	sys.exit(-1)	

source.close()
destination.close()		

shutil.move("./files/signal.txt","./files/c.txt")
bo = open("./files/signal.txt","w")
bo.write(toPass + "_" + signal.split("/")[0] + "_" + signal.split("/")[1] + ".txt")
bo.close()
