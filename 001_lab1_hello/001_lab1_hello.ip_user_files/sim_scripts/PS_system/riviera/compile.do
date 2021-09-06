vlib work
vlib riviera

vlib riviera/processing_system7_bfm_v2_0_5
vlib riviera/xil_defaultlib

vmap processing_system7_bfm_v2_0_5 riviera/processing_system7_bfm_v2_0_5
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../001_lab1_hello.srcs/sources_1/bd/PS_system/ipshared/2527/hdl" "+incdir+../../../../001_lab1_hello.srcs/sources_1/bd/PS_system/ipshared/2527/hdl" \
"../../../../001_lab1_hello.srcs/sources_1/bd/PS_system/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../001_lab1_hello.srcs/sources_1/bd/PS_system/ipshared/2527/hdl" "+incdir+../../../../001_lab1_hello.srcs/sources_1/bd/PS_system/ipshared/2527/hdl" \
"../../../bd/PS_system/ip/PS_system_processing_system7_0_0/sim/PS_system_processing_system7_0_0.v" \
"../../../bd/PS_system/hdl/PS_system.v" \

vlog -work xil_defaultlib "glbl.v"

