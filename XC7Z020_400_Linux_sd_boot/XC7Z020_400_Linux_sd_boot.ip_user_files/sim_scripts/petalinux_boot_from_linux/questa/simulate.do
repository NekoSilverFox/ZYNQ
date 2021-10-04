onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -lib xil_defaultlib petalinux_boot_from_linux_opt

do {wave.do}

view wave
view structure
view signals

do {petalinux_boot_from_linux.udo}

run -all

quit -force
