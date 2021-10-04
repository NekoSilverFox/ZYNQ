onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+design_axi_cdma -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -L xil_defaultlib -L xpm -L processing_system7_bfm_v2_0_5 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L fifo_generator_v13_1_2 -L lib_fifo_v1_0_6 -L lib_cdc_v1_0_2 -L axi_datamover_v5_1_12 -L axi_sg_v4_1_4 -L axi_cdma_v4_1_10 -L axi_lite_ipif_v3_0_4 -L axi_timer_v2_0_12 -L proc_sys_reset_v5_0_10 -L generic_baseblocks_v2_1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_10 -L axi_data_fifo_v2_1_9 -L axi_crossbar_v2_1_11 -L axi_protocol_converter_v2_1_10 -L axi_clock_converter_v2_1_9 -L blk_mem_gen_v8_3_4 -L axi_dwidth_converter_v2_1_10 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_axi_cdma xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {design_axi_cdma.udo}

run -all

endsim

quit -force
