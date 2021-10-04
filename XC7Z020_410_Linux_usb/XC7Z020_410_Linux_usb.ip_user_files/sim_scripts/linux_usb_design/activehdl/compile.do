vlib work
vlib activehdl

vlib activehdl/processing_system7_bfm_v2_0_5
vlib activehdl/xil_defaultlib

vmap processing_system7_bfm_v2_0_5 activehdl/processing_system7_bfm_v2_0_5
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../XC7Z020_410_Linux_usb.srcs/sources_1/bd/linux_usb_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_410_Linux_usb.srcs/sources_1/bd/linux_usb_design/ipshared/2527/hdl" \
"../../../../XC7Z020_410_Linux_usb.srcs/sources_1/bd/linux_usb_design/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_410_Linux_usb.srcs/sources_1/bd/linux_usb_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_410_Linux_usb.srcs/sources_1/bd/linux_usb_design/ipshared/2527/hdl" \
"../../../bd/linux_usb_design/ip/linux_usb_design_processing_system7_0_0/sim/linux_usb_design_processing_system7_0_0.v" \
"../../../bd/linux_usb_design/hdl/linux_usb_design.v" \

vlog -work xil_defaultlib "glbl.v"

