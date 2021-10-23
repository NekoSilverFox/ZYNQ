vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_4
vlib activehdl/processing_system7_vip_v1_0_6
vlib activehdl/v_vid_in_axi4s_v4_0_9
vlib activehdl/util_vector_logic_v2_0_1
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/fifo_generator_v13_2_3
vlib activehdl/lib_fifo_v1_0_12
vlib activehdl/blk_mem_gen_v8_4_2
vlib activehdl/lib_bmg_v1_0_11
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_datamover_v5_1_20
vlib activehdl/axi_vdma_v6_3_6
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/v_tc_v6_1_13
vlib activehdl/v_axi4s_vid_out_v4_0_10
vlib activehdl/xlconstant_v1_1_5
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/smartconnect_v1_0
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_18
vlib activehdl/axi_data_fifo_v2_1_17
vlib activehdl/axi_crossbar_v2_1_19
vlib activehdl/axi_protocol_converter_v2_1_18

vmap xilinx_vip activehdl/xilinx_vip
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 activehdl/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 activehdl/processing_system7_vip_v1_0_6
vmap v_vid_in_axi4s_v4_0_9 activehdl/v_vid_in_axi4s_v4_0_9
vmap util_vector_logic_v2_0_1 activehdl/util_vector_logic_v2_0_1
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 activehdl/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 activehdl/lib_fifo_v1_0_12
vmap blk_mem_gen_v8_4_2 activehdl/blk_mem_gen_v8_4_2
vmap lib_bmg_v1_0_11 activehdl/lib_bmg_v1_0_11
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_20 activehdl/axi_datamover_v5_1_20
vmap axi_vdma_v6_3_6 activehdl/axi_vdma_v6_3_6
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap v_tc_v6_1_13 activehdl/v_tc_v6_1_13
vmap v_axi4s_vid_out_v4_0_10 activehdl/v_axi4s_vid_out_v4_0_10
vmap xlconstant_v1_1_5 activehdl/xlconstant_v1_1_5
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap smartconnect_v1_0 activehdl/smartconnect_v1_0
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_18 activehdl/axi_register_slice_v2_1_18
vmap axi_data_fifo_v2_1_17 activehdl/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 activehdl/axi_crossbar_v2_1_19
vmap axi_protocol_converter_v2_1_18 activehdl/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip  -sv2k12 "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"G:/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"G:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0/sim/ov5640_hdmi_design_processing_system7_0_0.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/cmos_cfg.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/cmos_data_capture.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/cmos_wr_driver.v" \
"../../../bd/ov5640_hdmi_design/ipshared/45ee/coms_capture.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0/sim/ov5640_hdmi_design_ddr3_hdmi_ov5640_0_0.v" \

vlog -work v_vid_in_axi4s_v4_0_9  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_v_vid_in_axi4s_0_0/sim/ov5640_hdmi_design_v_vid_in_axi4s_0_0.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_clk_wiz_0_0/ov5640_hdmi_design_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_clk_wiz_0_0/ov5640_hdmi_design_clk_wiz_0_0.v" \

vlog -work util_vector_logic_v2_0_1  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_util_vector_logic_0_0/sim/ov5640_hdmi_design_util_vector_logic_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_11 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/556c/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_6  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_6 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_vdma_0_0/sim/ov5640_hdmi_design_axi_vdma_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_1_13 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/a92c/hdl/v_tc_v6_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_v_tc_0_0/sim/ov5640_hdmi_design_v_tc_0_0.vhd" \

vlog -work v_axi4s_vid_out_v4_0_10  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/a87e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_v_axi4s_vid_out_0_0/sim/ov5640_hdmi_design_v_axi4s_vid_out_0_0.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_util_vector_logic_1_0/sim/ov5640_hdmi_design_util_vector_logic_1_0.v" \
"../../../bd/ov5640_hdmi_design/ipshared/2679/encode.v" \
"../../../bd/ov5640_hdmi_design/ipshared/2679/parallel_to_serial.v" \
"../../../bd/ov5640_hdmi_design/ipshared/2679/hdmi_trans.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_hdmi_trans_0_0/sim/ov5640_hdmi_design_hdmi_trans_0_0.v" \

vlog -work xlconstant_v1_1_5  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_xlconstant_0_0/sim/ov5640_hdmi_design_xlconstant_0_0.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_0/sim/bd_c6bb_one_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_1/sim/bd_c6bb_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_2/sim/bd_c6bb_arsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_3/sim/bd_c6bb_rsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_4/sim/bd_c6bb_awsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_5/sim/bd_c6bb_wsw_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_6/sim/bd_c6bb_bsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_7/sim/bd_c6bb_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_8/sim/bd_c6bb_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_9/sim/bd_c6bb_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_10/sim/bd_c6bb_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_11/sim/bd_c6bb_sarn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_12/sim/bd_c6bb_srn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_13/sim/bd_c6bb_s01mmu_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_14/sim/bd_c6bb_s01tr_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_15/sim/bd_c6bb_s01sic_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_16/sim/bd_c6bb_s01a2s_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_17/sim/bd_c6bb_sawn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_18/sim/bd_c6bb_swn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_19/sim/bd_c6bb_sbn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_20/sim/bd_c6bb_s02mmu_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_21/sim/bd_c6bb_s02tr_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_22/sim/bd_c6bb_s02sic_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_23/sim/bd_c6bb_s02a2s_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_24/sim/bd_c6bb_sarn_1.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_25/sim/bd_c6bb_srn_1.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_26/sim/bd_c6bb_s03mmu_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_27/sim/bd_c6bb_s03tr_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_28/sim/bd_c6bb_s03sic_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_29/sim/bd_c6bb_s03a2s_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_30/sim/bd_c6bb_sawn_1.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_31/sim/bd_c6bb_swn_1.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_32/sim/bd_c6bb_sbn_1.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_33/sim/bd_c6bb_m00s2a_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_34/sim/bd_c6bb_m00arn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_35/sim/bd_c6bb_m00rn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_36/sim/bd_c6bb_m00awn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_37/sim/bd_c6bb_m00wn_0.sv" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_38/sim/bd_c6bb_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/ip/ip_39/sim/bd_c6bb_m00e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/bd_0/sim/bd_c6bb.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_smc_0/sim/ov5640_hdmi_design_axi_smc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_rst_ps7_0_50M_0/sim/ov5640_hdmi_design_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/sim/ov5640_hdmi_design.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_xbar_0/sim/ov5640_hdmi_design_xbar_0.v" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7eb5/hdl/verilog/image_filter_CTRL_BUS_s_axi.v" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7eb5/hdl/verilog/image_filter_mac_bkb.v" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7eb5/hdl/verilog/image_filter.v" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_image_filter_0_0/sim/ov5640_hdmi_design_image_filter_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_axi_vdma_1_0/sim/ov5640_hdmi_design_axi_vdma_1_0.vhd" \

vlog -work axi_protocol_converter_v2_1_18  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/85a3" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_316_ES_ConerDetect.srcs/sources_1/bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_processing_system7_0_0" "+incdir+G:/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/ov5640_hdmi_design/ip/ov5640_hdmi_design_auto_pc_0/sim/ov5640_hdmi_design_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

