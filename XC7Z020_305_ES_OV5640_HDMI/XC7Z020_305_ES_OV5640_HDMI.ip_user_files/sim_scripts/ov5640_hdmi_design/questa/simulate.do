onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ov5640_hdmi_design_opt

do {wave.do}

view wave
view structure
view signals

do {ov5640_hdmi_design.udo}

run -all

quit -force
