onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+PS_design -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -L xil_defaultlib -L xpm -L processing_system7_bfm_v2_0_5 -L axi_lite_ipif_v3_0_4 -L lib_cdc_v1_0_2 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_12 -L proc_sys_reset_v5_0_10 -L generic_baseblocks_v2_1_0 -L fifo_generator_v13_1_2 -L axi_data_fifo_v2_1_9 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_10 -L axi_protocol_converter_v2_1_10 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.PS_design xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {PS_design.udo}

run -all

endsim

quit -force
