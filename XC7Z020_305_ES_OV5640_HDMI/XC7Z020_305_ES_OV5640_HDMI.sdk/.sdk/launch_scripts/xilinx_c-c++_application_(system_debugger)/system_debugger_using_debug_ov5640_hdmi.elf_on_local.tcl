connect -url tcp:127.0.0.1:3121
source C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_305_ES_OV5640_HDMI/XC7Z020_305_ES_OV5640_HDMI.sdk/ov5640_hdmi_design_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-HS2 201706300081" && level==0} -index 1
fpga -file C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_305_ES_OV5640_HDMI/XC7Z020_305_ES_OV5640_HDMI.sdk/ov5640_hdmi_design_wrapper_hw_platform_0/ov5640_hdmi_design_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
loadhw -hw C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_305_ES_OV5640_HDMI/XC7Z020_305_ES_OV5640_HDMI.sdk/ov5640_hdmi_design_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
dow C:/Users/mi/Desktop/Programma/ZYNQ/XC7Z020_305_ES_OV5640_HDMI/XC7Z020_305_ES_OV5640_HDMI.sdk/ov5640_hdmi/Debug/ov5640_hdmi.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-HS2 201706300081"} -index 0
con
