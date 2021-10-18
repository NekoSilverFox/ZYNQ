vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_4
vlib questa_lib/msim/processing_system7_vip_v1_0_6
vlib questa_lib/msim/v_vid_in_axi4s_v4_0_9
vlib questa_lib/msim/util_vector_logic_v2_0_1
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_3
vlib questa_lib/msim/lib_fifo_v1_0_12
vlib questa_lib/msim/blk_mem_gen_v8_4_2
vlib questa_lib/msim/lib_bmg_v1_0_11
vlib questa_lib/msim/lib_srl_fifo_v1_0_2
vlib questa_lib/msim/axi_datamover_v5_1_20
vlib questa_lib/msim/axi_vdma_v6_3_6
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/v_tc_v6_1_13
vlib questa_lib/msim/v_axi4s_vid_out_v4_0_10
vlib questa_lib/msim/xlconstant_v1_1_5
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/smartconnect_v1_0
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_data_fifo_v2_1_17
vlib questa_lib/msim/axi_register_slice_v2_1_18
vlib questa_lib/msim/axi_protocol_converter_v2_1_18

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 questa_lib/msim/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 questa_lib/msim/processing_system7_vip_v1_0_6
vmap v_vid_in_axi4s_v4_0_9 questa_lib/msim/v_vid_in_axi4s_v4_0_9
vmap util_vector_logic_v2_0_1 questa_lib/msim/util_vector_logic_v2_0_1
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 questa_lib/msim/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 questa_lib/msim/lib_fifo_v1_0_12
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2
vmap lib_bmg_v1_0_11 questa_lib/msim/lib_bmg_v1_0_11
vmap lib_srl_fifo_v1_0_2 questa_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_20 questa_lib/msim/axi_datamover_v5_1_20
vmap axi_vdma_v6_3_6 questa_lib/msim/axi_vdma_v6_3_6
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap v_tc_v6_1_13 questa_lib/msim/v_tc_v6_1_13
vmap v_axi4s_vid_out_v4_0_10 questa_lib/msim/v_axi4s_vid_out_v4_0_10
vmap xlconstant_v1_1_5 questa_lib/msim/xlconstant_v1_1_5
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap smartconnect_v1_0 questa_lib/msim/smartconnect_v1_0
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_17 questa_lib/msim/axi_data_fifo_v2_1_17
vmap axi_register_slice_v2_1_18 questa_lib/msim/axi_register_slice_v2_1_18
vmap axi_protocol_converter_v2_1_18 questa_lib/msim/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0/sim/ov5640_hdmi_design_processing_system7_0_0.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/cmos_cfg.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/cmos_data_capture.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/cmos_wr_driver.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/coms_capture.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0/sim/ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0.v" \

vlog -work v_vid_in_axi4s_v4_0_9 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_v_vid_in_axi4s_0_0/sim/ov5640_hdmi_design_v_vid_in_axi4s_0_0.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_clk_wiz_0_0/ov5640_hdmi_design_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_clk_wiz_0_0/ov5640_hdmi_design_clk_wiz_0_0.v" \

vlog -work util_vector_logic_v2_0_1 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_util_vector_logic_0_0/sim/ov5640_hdmi_design_util_vector_logic_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_2 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_11 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/556c/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_6 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_6 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_vdma_0_0/sim/ov5640_hdmi_design_axi_vdma_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_1_13 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/a92c/hdl/v_tc_v6_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_v_tc_0_0/sim/ov5640_hdmi_design_v_tc_0_0.vhd" \

vlog -work v_axi4s_vid_out_v4_0_10 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/a87e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_v_axi4s_vid_out_0_0/sim/ov5640_hdmi_design_v_axi4s_vid_out_0_0.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_util_vector_logic_1_0/sim/ov5640_hdmi_design_util_vector_logic_1_0.v" \
"../../../bd/ov5640_hdmi_design/ipshared/2679/encode.v" \
"../../../bd/ov5640_hdmi_design/ipshared/2679/parallel_to_serial.v" \
"../../../bd/ov5640_hdmi_design/ipshared/2679/hdmi_trans.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_hdmi_trans_0_0/sim/ov5640_hdmi_design_hdmi_trans_0_0.v" \

vlog -work xlconstant_v1_1_5 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_xlconstant_0_0/sim/ov5640_hdmi_design_xlconstant_0_0.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_0/sim/bd_c6bb_one_0.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_1/sim/bd_c6bb_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_2/sim/bd_c6bb_arsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_3/sim/bd_c6bb_rsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_4/sim/bd_c6bb_awsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_5/sim/bd_c6bb_wsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_6/sim/bd_c6bb_bsw_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_7/sim/bd_c6bb_s00mmu_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_8/sim/bd_c6bb_s00tr_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_9/sim/bd_c6bb_s00sic_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_10/sim/bd_c6bb_s00a2s_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_11/sim/bd_c6bb_sarn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_12/sim/bd_c6bb_srn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_13/sim/bd_c6bb_s01mmu_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_14/sim/bd_c6bb_s01tr_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_15/sim/bd_c6bb_s01sic_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_16/sim/bd_c6bb_s01a2s_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_17/sim/bd_c6bb_sawn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_18/sim/bd_c6bb_swn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_19/sim/bd_c6bb_sbn_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_20/sim/bd_c6bb_m00s2a_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_21/sim/bd_c6bb_m00arn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_22/sim/bd_c6bb_m00rn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_23/sim/bd_c6bb_m00awn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_24/sim/bd_c6bb_m00wn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_25/sim/bd_c6bb_m00bn_0.sv" \

vlog -work smartconnect_v1_0 -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -sv -L axi_vip_v1_1_4 -L processing_system7_vip_v1_0_6 -L smartconnect_v1_0 -L xilinx_vip "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_26/sim/bd_c6bb_m00e_0.sv" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/sim/bd_c6bb.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/sim/ov5640_hdmi_design_axi_smc_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_rst_ps7_0_50M_0/sim/ov5640_hdmi_design_rst_ps7_0_50M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_18 -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_305_ES_OV5640_HDMI.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_auto_pc_0/sim/ov5640_hdmi_design_auto_pc_0.v" \
"../../../bd/ov5640_hdmi_design/sim/ov5640_hdmi_design.v" \

vlog -work xil_defaultlib \
"glbl.v"

