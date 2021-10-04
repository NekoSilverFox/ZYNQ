onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -lib xil_defaultlib lab3_ps_pl_opt

do {wave.do}

view wave
view structure
view signals

do {lab3_ps_pl.udo}

run -all

quit -force
