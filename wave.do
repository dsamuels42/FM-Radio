onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /demod_tb/test_component/clock
add wave -noupdate /demod_tb/test_component/reset
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_out
add wave -noupdate /demod_tb/test_component/done
add wave -noupdate /demod_tb/test_component/abs_y
add wave -noupdate -radix hexadecimal /demod_tb/test_component/angle
add wave -noupdate -radix hexadecimal /demod_tb/test_component/x
add wave -noupdate -radix hexadecimal /demod_tb/test_component/y
add wave -noupdate -radix hexadecimal /demod_tb/test_component/x_c
add wave -noupdate -radix hexadecimal /demod_tb/test_component/y_c
add wave -noupdate -radix hexadecimal /demod_tb/test_component/dividend
add wave -noupdate -radix hexadecimal /demod_tb/test_component/dividend_c
add wave -noupdate -radix hexadecimal /demod_tb/test_component/quotient
add wave -noupdate -radix hexadecimal /demod_tb/test_component/divisor
add wave -noupdate -radix hexadecimal /demod_tb/test_component/divisor_c
add wave -noupdate -radix hexadecimal /demod_tb/test_component/remainder
add wave -noupdate /demod_tb/test_component/divider_start
add wave -noupdate /demod_tb/test_component/divider_done
add wave -noupdate /demod_tb/test_component/overflow
add wave -noupdate /demod_tb/test_component/start
add wave -noupdate -radix hexadecimal /demod_tb/test_component/I
add wave -noupdate -radix hexadecimal /demod_tb/test_component/Q
add wave -noupdate /demod_tb/test_component/state
add wave -noupdate /demod_tb/test_component/next_state
add wave -noupdate -radix hexadecimal /demod_tb/test_component/prev_I
add wave -noupdate -radix hexadecimal /demod_tb/test_component/prev_I_c
add wave -noupdate -radix hexadecimal /demod_tb/test_component/prev_Q
add wave -noupdate -radix hexadecimal /demod_tb/test_component/prev_Q_c
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/r_t
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/i_t
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/i_t1
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/r_t1
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/angle_t1
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/r
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/angle_t
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/q1
add wave -noupdate -radix hexadecimal /demod_tb/test_component/demod_process/q3
add wave -noupdate /demod_tb/test_component/divider_0/clock
add wave -noupdate /demod_tb/test_component/divider_0/start
add wave -noupdate /demod_tb/test_component/divider_0/dividend
add wave -noupdate /demod_tb/test_component/divider_0/divisor
add wave -noupdate /demod_tb/test_component/divider_0/quotient
add wave -noupdate /demod_tb/test_component/divider_0/remainder
add wave -noupdate /demod_tb/test_component/divider_0/overflow
add wave -noupdate /demod_tb/test_component/divider_0/done
add wave -noupdate -radix hexadecimal /demod_tb/test_component/divider_0/pre_shifted_a
add wave -noupdate -radix hexadecimal /demod_tb/test_component/divider_0/shifted_a
add wave -noupdate -radix hexadecimal /demod_tb/test_component/divider_0/shifted_a_final
add wave -noupdate /demod_tb/test_component/divider_0/dividend_msb
add wave -noupdate /demod_tb/test_component/divider_0/i_help
add wave -noupdate /demod_tb/test_component/divider_0/temp_quotient_bit
add wave -noupdate /demod_tb/test_component/clock
add wave -noupdate /demod_tb/test_component/reset
add wave -noupdate /demod_tb/test_component/start
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {22823 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {406877 ps}
