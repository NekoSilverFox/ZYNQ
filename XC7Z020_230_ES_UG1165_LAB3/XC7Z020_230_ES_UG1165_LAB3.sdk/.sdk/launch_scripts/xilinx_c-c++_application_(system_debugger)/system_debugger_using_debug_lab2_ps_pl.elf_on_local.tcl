connect -url tcp:127.0.0.1:3121
source C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.sdk/lab3_ps_pl_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
loadhw C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.sdk/lab3_ps_pl_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
dow C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_230_ES_UG1165_LAB3/XC7Z020_230_ES_UG1165_LAB3.sdk/lab2_ps_pl/Debug/lab2_ps_pl.elf
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
con
