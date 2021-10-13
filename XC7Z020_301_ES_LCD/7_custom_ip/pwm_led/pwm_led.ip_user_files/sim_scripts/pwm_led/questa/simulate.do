onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pwm_led_opt

do {wave.do}

view wave
view structure
view signals

do {pwm_led.udo}

run -all

quit -force
