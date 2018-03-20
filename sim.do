setenv LMC_TIMEUNIT -9
vlib ./work
vcom -work work "*.vhd"

vsim +notimingchecks -L work work.fm_radio_top_tb -wlf fm_sim.wlf
add wave -noupdate -group fm_radio_top_tb
add wave -noupdate -group fm_radio_top_tb -radix hexadecimal /fm_radio_top_tb/*

run -all

