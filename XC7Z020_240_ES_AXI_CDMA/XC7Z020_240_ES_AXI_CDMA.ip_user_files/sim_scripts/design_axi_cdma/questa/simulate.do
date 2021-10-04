onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -lib xil_defaultlib design_axi_cdma_opt

do {wave.do}

view wave
view structure
view signals

do {design_axi_cdma.udo}

run -all

quit -force
