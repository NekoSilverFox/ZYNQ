vlib work
vlib msim

vlib msim/processing_system7_bfm_v2_0_5
vlib msim/xil_defaultlib

vmap processing_system7_bfm_v2_0_5 msim/processing_system7_bfm_v2_0_5
vmap xil_defaultlib msim/xil_defaultlib

vlog -work processing_system7_bfm_v2_0_5 -64 -incr "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" \
"../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_405_Linux_flash_boot.srcs/sources_1/bd/flash_boot_design/ipshared/2527/hdl" \
"../../../bd/flash_boot_design/ip/flash_boot_design_processing_system7_0_0/sim/flash_boot_design_processing_system7_0_0.v" \
"../../../bd/flash_boot_design/hdl/flash_boot_design.v" \

vlog -work xil_defaultlib "glbl.v"

