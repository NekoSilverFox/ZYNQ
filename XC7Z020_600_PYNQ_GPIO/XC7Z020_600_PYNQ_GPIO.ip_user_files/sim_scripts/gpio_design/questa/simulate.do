onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib gpio_design_opt

do {wave.do}

view wave
view structure
view signals

do {gpio_design.udo}

run -all

quit -force
