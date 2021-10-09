connect -url tcp:127.0.0.1:3121
source C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_240_ES_AXI_CDMA/XC7Z020_240_ES_AXI_CDMA.sdk/design_axi_cdma_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS2 201706300081" && level==0} -index 1
fpga -file C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_240_ES_AXI_CDMA/XC7Z020_240_ES_AXI_CDMA.sdk/design_axi_cdma_wrapper_hw_platform_0/design_axi_cdma_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
loadhw C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_240_ES_AXI_CDMA/XC7Z020_240_ES_AXI_CDMA.sdk/design_axi_cdma_wrapper_hw_platform_0/system.hdf
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
dow C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_240_ES_AXI_CDMA/XC7Z020_240_ES_AXI_CDMA.sdk/axi_cdma/Debug/axi_cdma.elf
bpadd -addr &main
