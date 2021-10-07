onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -lib xil_defaultlib gpio_design_opt

do {wave.do}

view wave
view structure
view signals

do {gpio_design.udo}

run -all

quit -force
