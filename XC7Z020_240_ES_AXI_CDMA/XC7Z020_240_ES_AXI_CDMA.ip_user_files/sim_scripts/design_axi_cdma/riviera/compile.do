vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/processing_system7_bfm_v2_0_5
vlib riviera/lib_pkg_v1_0_2
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/fifo_generator_v13_1_2
vlib riviera/lib_fifo_v1_0_6
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_12
vlib riviera/axi_sg_v4_1_4
vlib riviera/axi_cdma_v4_1_10
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/axi_timer_v2_0_12
vlib riviera/proc_sys_reset_v5_0_10
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_10
vlib riviera/axi_data_fifo_v2_1_9
vlib riviera/axi_crossbar_v2_1_11
vlib riviera/axi_protocol_converter_v2_1_10
vlib riviera/axi_clock_converter_v2_1_9
vlib riviera/blk_mem_gen_v8_3_4
vlib riviera/axi_dwidth_converter_v2_1_10

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap processing_system7_bfm_v2_0_5 riviera/processing_system7_bfm_v2_0_5
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap fifo_generator_v13_1_2 riviera/fifo_generator_v13_1_2
vmap lib_fifo_v1_0_6 riviera/lib_fifo_v1_0_6
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_12 riviera/axi_datamover_v5_1_12
vmap axi_sg_v4_1_4 riviera/axi_sg_v4_1_4
vmap axi_cdma_v4_1_10 riviera/axi_cdma_v4_1_10
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap axi_timer_v2_0_12 riviera/axi_timer_v2_0_12
vmap proc_sys_reset_v5_0_10 riviera/proc_sys_reset_v5_0_10
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_10 riviera/axi_register_slice_v2_1_10
vmap axi_data_fifo_v2_1_9 riviera/axi_data_fifo_v2_1_9
vmap axi_crossbar_v2_1_11 riviera/axi_crossbar_v2_1_11
vmap axi_protocol_converter_v2_1_10 riviera/axi_protocol_converter_v2_1_10
vmap axi_clock_converter_v2_1_9 riviera/axi_clock_converter_v2_1_9
vmap blk_mem_gen_v8_3_4 riviera/blk_mem_gen_v8_3_4
vmap axi_dwidth_converter_v2_1_10 riviera/axi_dwidth_converter_v2_1_10

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"G:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"G:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"G:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work processing_system7_bfm_v2_0_5  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl/processing_system7_bfm_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_processing_system7_0_0/sim/design_axi_cdma_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/832a/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/6039/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_1_2  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/a807/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_2 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/a807/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_2  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/a807/hdl/fifo_generator_v13_1_rfs.v" \

vcom -work lib_fifo_v1_0_6 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/61a7/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_12 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/1cd0/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_4 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/57b4/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_cdma_v4_1_10 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/b9ad/hdl/axi_cdma_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_axi_cdma_0_0/sim/design_axi_cdma_axi_cdma_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../bd/design_axi_cdma/ipshared/2e37/xlconcat.v" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_xlconcat_0_0/sim/design_axi_cdma_xlconcat_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/0ba0/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_timer_v2_0_12 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/eace/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_axi_timer_0_0/sim/design_axi_cdma_axi_timer_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_10 -93 \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_rst_ps7_0_50M_0/sim/design_axi_cdma_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7ee0/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_10  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7efe/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_9  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/10b8/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_11  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/d552/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_xbar_0/sim/design_axi_cdma_xbar_0.v" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_xbar_1/sim/design_axi_cdma_xbar_1.v" \

vlog -work axi_protocol_converter_v2_1_10  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/4a8b/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_9  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/cf3b/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_3_4  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/59b0/simulation/blk_mem_gen_v8_3.v" \

vlog -work axi_dwidth_converter_v2_1_10  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/4a86/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/2527/hdl" "+incdir+../../../../XC7Z020_240_ES_AXI_CDMA.srcs/sources_1/bd/design_axi_cdma/ipshared/7e3a/hdl" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_auto_ds_0/sim/design_axi_cdma_auto_ds_0.v" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_auto_pc_0/sim/design_axi_cdma_auto_pc_0.v" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_auto_ds_1/sim/design_axi_cdma_auto_ds_1.v" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_auto_pc_1/sim/design_axi_cdma_auto_pc_1.v" \
"../../../bd/design_axi_cdma/ip/design_axi_cdma_auto_pc_2/sim/design_axi_cdma_auto_pc_2.v" \
"../../../bd/design_axi_cdma/hdl/design_axi_cdma.v" \

vlog -work xil_defaultlib "glbl.v"

