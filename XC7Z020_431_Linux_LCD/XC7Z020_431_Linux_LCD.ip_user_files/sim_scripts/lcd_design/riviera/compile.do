vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_4
vlib riviera/processing_system7_vip_v1_0_6
vlib riviera/lib_cdc_v1_0_2
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_3
vlib riviera/lib_fifo_v1_0_12
vlib riviera/blk_mem_gen_v8_4_2
vlib riviera/lib_bmg_v1_0_11
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_datamover_v5_1_20
vlib riviera/axi_vdma_v6_3_6
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/v_tc_v6_1_13
vlib riviera/v_vid_in_axi4s_v4_0_9
vlib riviera/v_axi4s_vid_out_v4_0_10
vlib riviera/xlconstant_v1_1_5
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/smartconnect_v1_0
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_18
vlib riviera/axi_data_fifo_v2_1_17
vlib riviera/axi_crossbar_v2_1_19
vlib riviera/xlconcat_v2_1_1
vlib riviera/axi_protocol_converter_v2_1_18

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_4 riviera/axi_vip_v1_1_4
vmap processing_system7_vip_v1_0_6 riviera/processing_system7_vip_v1_0_6
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_3 riviera/fifo_generator_v13_2_3
vmap lib_fifo_v1_0_12 riviera/lib_fifo_v1_0_12
vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2
vmap lib_bmg_v1_0_11 riviera/lib_bmg_v1_0_11
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_20 riviera/axi_datamover_v5_1_20
vmap axi_vdma_v6_3_6 riviera/axi_vdma_v6_3_6
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap v_tc_v6_1_13 riviera/v_tc_v6_1_13
vmap v_vid_in_axi4s_v4_0_9 riviera/v_vid_in_axi4s_v4_0_9
vmap v_axi4s_vid_out_v4_0_10 riviera/v_axi4s_vid_out_v4_0_10
vmap xlconstant_v1_1_5 riviera/xlconstant_v1_1_5
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_18 riviera/axi_register_slice_v2_1_18
vmap axi_data_fifo_v2_1_17 riviera/axi_data_fifo_v2_1_17
vmap axi_crossbar_v2_1_19 riviera/axi_crossbar_v2_1_19
vmap xlconcat_v2_1_1 riviera/xlconcat_v2_1_1
vmap axi_protocol_converter_v2_1_18 riviera/axi_protocol_converter_v2_1_18

vlog -work xilinx_vip  -sv2k12 "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/axi_vip_if.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/clk_vip_if.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_4  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/98af/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_6  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_processing_system7_0_0/sim/lcd_design_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/64f4/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_3 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_3  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/64f4/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_12 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/544a/hdl/lib_fifo_v1_0_rfs.vhd" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_11 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/556c/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_20 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/dfb3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vlog -work axi_vdma_v6_3_6  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.v" \

vcom -work axi_vdma_v6_3_6 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl/axi_vdma_v6_3_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/lcd_design/ip/lcd_design_axi_vdma_0_0/sim/lcd_design_axi_vdma_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work v_tc_v6_1_13 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/a92c/hdl/v_tc_v6_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/lcd_design/ip/lcd_design_v_tc_0_0/sim/lcd_design_v_tc_0_0.vhd" \

vlog -work v_vid_in_axi4s_v4_0_9  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \

vlog -work v_axi4s_vid_out_v4_0_10  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/a87e/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_v_axi4s_vid_out_0_0/sim/lcd_design_v_axi4s_vid_out_0_0.v" \
"../../../bd/lcd_design/ipshared/8dc1/src/rgb2lcd.v" \
"../../../bd/lcd_design/ip/lcd_design_rgb2lcd_0_0/sim/lcd_design_rgb2lcd_0_0.v" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ab26/src/mmcme2_drp.v" \

vcom -work xil_defaultlib -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ab26/src/axi_dynclk_S00_AXI.vhd" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ab26/src/axi_dynclk.vhd" \
"../../../bd/lcd_design/ip/lcd_design_axi_dynclk_0_0/sim/lcd_design_axi_dynclk_0_0.vhd" \

vlog -work xlconstant_v1_1_5  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_0/sim/bd_097e_one_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_1/sim/bd_097e_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/f85e/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_2/sim/bd_097e_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ca72/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_3/sim/bd_097e_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/9ade/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_4/sim/bd_097e_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b89e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_5/sim/bd_097e_s00a2s_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_6/sim/bd_097e_sarn_0.sv" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_7/sim/bd_097e_srn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/7005/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_8/sim/bd_097e_m00s2a_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b387/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/ip/ip_9/sim/bd_097e_m00e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/bd_0/sim/bd_097e.v" \
"../../../bd/lcd_design/ip/lcd_design_axi_smc_0/sim/lcd_design_axi_smc_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/lcd_design/ip/lcd_design_rst_ps7_0_100M_2/sim/lcd_design_rst_ps7_0_100M_2.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_18  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/cc23/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_17  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/c4fd/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_19  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/6c9d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_xbar_0/sim/lcd_design_xbar_0.v" \

vlog -work xlconcat_v2_1_1  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_xlconcat_0_0/sim/lcd_design_xlconcat_0_0.v" \

vlog -work axi_protocol_converter_v2_1_18  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/7a04/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/ec67/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/70cf/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/58e2/hdl" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/979d/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ipshared/b2d0/hdl/verilog" "+incdir+../../../../XC7Z020_431_Linux_LCD.srcs/sources_1/bd/lcd_design/ip/lcd_design_processing_system7_0_0" "+incdir+E:/AFOX/AppInstall/Xilinx/Vivado/2018.3/data/xilinx_vip/include" \
"../../../bd/lcd_design/ip/lcd_design_auto_pc_0/sim/lcd_design_auto_pc_0.v" \
"../../../bd/lcd_design/sim/lcd_design.v" \

vlog -work xil_defaultlib \
"glbl.v"

