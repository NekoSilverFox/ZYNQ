vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/processing_system7_bfm_v2_0_5
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/interrupt_control_v3_1_4
vlib activehdl/axi_gpio_v2_0_12
vlib activehdl/proc_sys_reset_v5_0_10
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_1_2
vlib activehdl/axi_data_fifo_v2_1_9
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_10
vlib activehdl/axi_protocol_converter_v2_1_10

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap processing_system7_bfm_v2_0_5 activehdl/processing_system7_bfm_v2_0_5
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 activehdl/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_12 activehdl/axi_gpio_v2_0_12
vmap proc_sys_reset_v5_0_10 activehdl/proc_sys_reset_v5_0_10
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_1_2 activehdl/fifo_generator_v13_1_2
vmap axi_data_fifo_v2_1_9 activehdl/axi_data_fifo_v2_1_9
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_10 activehdl/axi_register_slice_v2_1_10
vmap axi_protocol_converter_v2_1_10 activehdl/axi_protocol_converter_v2_1_10

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"G:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"G:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../bd/PS_design/ip/PS_design_processing_system7_0_0/sim/PS_design_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/e956/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_12 -93 \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/475c/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/PS_design/ip/PS_design_axi_gpio_0_0/sim/PS_design_axi_gpio_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_10 -93 \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/PS_design/ip/PS_design_rst_ps7_0_50M_0/sim/PS_design_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7ee0/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_1_2  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/a807/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_2 -93 \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/a807/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_2  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/a807/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_data_fifo_v2_1_9  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/10b8/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_10  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7efe/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_10  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/4a8b/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_210_ES_AXI_GPIO.srcs/sources_1/bd/PS_design/ipshared/7e3a/hdl" \
"../../../bd/PS_design/ip/PS_design_auto_pc_0/sim/PS_design_auto_pc_0.v" \
"../../../bd/PS_design/hdl/PS_design.v" \

vlog -work xil_defaultlib "glbl.v"

