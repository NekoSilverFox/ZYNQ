vlib work
vlib activehdl

vlib activehdl/processing_system7_bfm_v2_0_5
vlib activehdl/xil_defaultlib

vmap processing_system7_bfm_v2_0_5 activehdl/processing_system7_bfm_v2_0_5
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" \
"../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" \
"../../../bd/flash_boot_design/ip/flash_boot_design_processing_system7_0_0/sim/flash_boot_design_processing_system7_0_0.v" \
"../../../bd/flash_boot_design/hdl/flash_boot_design.v" \

vlog -work xil_defaultlib "glbl.v"

