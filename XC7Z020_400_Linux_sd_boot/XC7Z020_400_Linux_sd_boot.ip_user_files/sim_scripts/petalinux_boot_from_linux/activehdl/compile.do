vlib work
vlib activehdl

vlib activehdl/processing_system7_bfm_v2_0_5
vlib activehdl/xil_defaultlib

vmap processing_system7_bfm_v2_0_5 activehdl/processing_system7_bfm_v2_0_5
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../XC7Z020_400_Linux_sd_boot.srcs/sources_1/bd/petalinux_boot_from_linux/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_400_Linux_sd_boot.srcs/sources_1/bd/petalinux_boot_from_linux/ipshared/2527/hdl" \
"../../../../XC7Z020_400_Linux_sd_boot.srcs/sources_1/bd/petalinux_boot_from_linux/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_400_Linux_sd_boot.srcs/sources_1/bd/petalinux_boot_from_linux/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_400_Linux_sd_boot.srcs/sources_1/bd/petalinux_boot_from_linux/ipshared/2527/hdl" \
"../../../bd/petalinux_boot_from_linux/ip/petalinux_boot_from_linux_processing_system7_0_0/sim/petalinux_boot_from_linux_processing_system7_0_0.v" \
"../../../bd/petalinux_boot_from_linux/hdl/petalinux_boot_from_linux.v" \

vlog -work xil_defaultlib "glbl.v"

