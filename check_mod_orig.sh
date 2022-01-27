#!/bin/sh

diff report_100/golden_simulation.txt report_100_mod_libr/golden_simulation.txt >> check_libr/gold_diff.txt
diff report_100/STF_IM_Or1_I1.txt report_100_mod_libr/STF_IM_Or1_A1.txt >> check_libr/STF_Or1_A1_diff.txt
diff report_100/STR_IM_Or1_I1.txt report_100_mod_libr/STR_IM_Or1_A1.txt >> check_libr/STR_Or1_A1_diff.txt
diff report_100/STF_IM_Or1_I2.txt report_100_mod_libr/STF_IM_Or1_A2.txt >> check_libr/STF_Or1_A2_diff.txt
diff report_100/STR_IM_Or1_I2.txt report_100_mod_libr/STR_IM_Or1_A2.txt >> check_libr/STR_Or1_A2_diff.txt
diff report_100/STF_IM_Or2_I1.txt report_100_mod_libr/STF_IM_Or2_A1.txt >> check_libr/STF_Or2_A1_diff.txt
diff report_100/STR_IM_Or2_I1.txt report_100_mod_libr/STR_IM_Or2_A1.txt >> check_libr/STR_Or2_A1_diff.txt
diff report_100/STF_IM_Or2_I2.txt report_100_mod_libr/STF_IM_Or2_A2.txt >> check_libr/STF_Or2_A2_diff.txt
diff report_100/STR_IM_Or2_I2.txt report_100_mod_libr/STR_IM_Or2_A2.txt >> check_libr/STR_Or2_A2_diff.txt
diff report_100/STF_IM_Xor1_I1.txt report_100_mod_libr/STF_IM_Xor1_A.txt >> check_libr/STF_Xor1_A_diff.txt
diff report_100/STR_IM_Xor1_I1.txt report_100_mod_libr/STR_IM_Xor1_A.txt >> check_libr/STR_Xor1_A_diff.txt
diff report_100/STF_IM_Xor1_I2.txt report_100_mod_libr/STF_IM_Xor1_B.txt >> check_libr/STF_Xor1_B_diff.txt
diff report_100/STR_IM_Xor1_I2.txt report_100_mod_libr/STR_IM_Xor1_B.txt >> check_libr/STR_Xor1_B_diff.txt
diff report_100/STF_IM_Xor1_O.txt report_100_mod_libr/STF_IM_Xor1_Z.txt >> check_libr/STF_Xor1_Z_diff.txt
diff report_100/STR_IM_Xor1_O.txt report_100_mod_libr/STR_IM_Xor1_Z.txt >> check_libr/STR_Xor1_Z_diff.txt
