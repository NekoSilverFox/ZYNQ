onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -pli "G:/Xilinx/Vivado/2016.3/lib/win64.o/libxil_vsim.dll" -L processing_system7_bfm_v2_0_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.petalinux_boot_from_linux xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {petalinux_boot_from_linux.udo}

run -all

quit -force
