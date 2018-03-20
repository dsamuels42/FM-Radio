vsim -gui work.fm_radio_top_tb

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/clock
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/hold_clock
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/reset
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/IQ
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/output_l
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/output_r
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/clock
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/hold_clock
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/reset
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/IQ
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/output_l
add wave -noupdate -group FM_RADIO_TOP -radix hexadecimal /fm_radio_top_tb/output_r
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/clock
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/reset
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/x_in
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/y_out
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/clock
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/reset
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/x_in
add wave -noupdate -group Deemph_Left -radix hexadecimal /fm_radio_top_tb/test_component/deemph_L/y_out
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/clock
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/reset
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/sub
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/A
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/B
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/res
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/clock
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/reset
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/sub
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/A
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/B
add wave -noupdate -group Add -radix hexadecimal /fm_radio_top_tb/test_component/add0/res
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/clock
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/reset
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/x_in
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/y_out
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/clock
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/reset
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/x_in
add wave -noupdate -group Deemph_Right -radix hexadecimal /fm_radio_top_tb/test_component/deemph_R/y_out
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/clock
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/reset
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/start
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/I
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/Q
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/demod_out
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/done
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/state
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/next_state
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/abs_y
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/angle
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/angle_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/x
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/y
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/x_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/y_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/r_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/r
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/dividend
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/dividend_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/quotient
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divisor
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divisor_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/remainder
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divider_start
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divider_start_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divider_done
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/overflow
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_I
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_I_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_Q
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_Q_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/demod_out_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/clock
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/reset
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/start
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/I
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/Q
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/demod_out
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/done
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/state
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/next_state
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/abs_y
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/angle
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/angle_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/x
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/y
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/x_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/y_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/r_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/r
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/dividend
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/dividend_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/quotient
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divisor
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divisor_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/remainder
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divider_start
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divider_start_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/divider_done
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/overflow
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_I
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_I_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_Q
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/prev_Q_c
add wave -noupdate -group Demod -radix hexadecimal /fm_radio_top_tb/test_component/demod0/demod_out_c
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/rd_clk
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/wr_clk
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/reset
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/rd_en
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/wr_en
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/din
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/dout
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/full
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/empty
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/fifo_buf
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/write_addr
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/read_addr
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/write_addr_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/read_addr_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/full_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/empty_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/rd_clk
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/wr_clk
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/reset
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/rd_en
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/wr_en
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/din
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/dout
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/full
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/empty
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/fifo_buf
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/write_addr
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/read_addr
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/write_addr_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/read_addr_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/full_t
add wave -noupdate -group Fifo0 -radix hexadecimal /fm_radio_top_tb/test_component/fifo0/empty_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/rd_clk
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/wr_clk
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/reset
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/rd_en
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/wr_en
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/din
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/dout
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/full
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/empty
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/fifo_buf
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/write_addr
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/read_addr
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/write_addr_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/read_addr_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/full_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/empty_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/rd_clk
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/wr_clk
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/reset
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/rd_en
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/wr_en
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/din
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/dout
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/full
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/empty
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/fifo_buf
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/write_addr
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/read_addr
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/write_addr_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/read_addr_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/full_t
add wave -noupdate -group Fifo1 -radix hexadecimal /fm_radio_top_tb/test_component/fifo1/empty_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/rd_clk
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/wr_clk
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/reset
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/rd_en
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/wr_en
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/din
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/dout
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/full
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/empty
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/fifo_buf
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/write_addr
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/read_addr
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/write_addr_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/read_addr_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/full_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/empty_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/rd_clk
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/wr_clk
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/reset
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/rd_en
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/wr_en
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/din
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/dout
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/full
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/empty
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/fifo_buf
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/write_addr
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/read_addr
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/write_addr_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/read_addr_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/full_t
add wave -noupdate -group Fifo2 -radix hexadecimal /fm_radio_top_tb/test_component/fifo2/empty_t
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/clock
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/reset
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/x_real
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/x_imag
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/y_real
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/y_imag
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/intermed_real
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/intermed_imag
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/clock
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/reset
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/x_real
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/x_imag
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/y_real
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/y_imag
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/intermed_real
add wave -noupdate -group Filter_Complex -radix hexadecimal /fm_radio_top_tb/test_component/fir_complex0/intermed_imag
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/clock
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/reset
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/x
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/y
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/valid
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/intermed
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/valid_count
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/clock
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/reset
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/x
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/y
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/valid
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/intermed
add wave -noupdate -group Filter-L0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L0/valid_count
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/clock
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/reset
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/x
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/y
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/valid
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/intermed
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/valid_count
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/clock
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/reset
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/x
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/y
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/valid
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/intermed
add wave -noupdate -group Filter-L1 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L1/valid_count
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/clock
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/reset
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/x
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/y
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/valid
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/intermed
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/valid_count
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/clock
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/reset
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/x
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/y
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/valid
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/intermed
add wave -noupdate -group Filter-L2 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L2/valid_count
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/clock
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/reset
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/x
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/y
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/valid
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/intermed
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/valid_count
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/clock
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/reset
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/x
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/y
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/valid
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/intermed
add wave -noupdate -group Filter-L3 -radix hexadecimal /fm_radio_top_tb/test_component/fir_L3/valid_count
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/clock
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/reset
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/x
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/y
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/valid
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/intermed
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/valid_count
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/clock
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/reset
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/x
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/y
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/valid
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/intermed
add wave -noupdate -group Filter-R0 -radix hexadecimal /fm_radio_top_tb/test_component/fir_R0/valid_count
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/clock
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/reset
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/A
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/res
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/clock
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/reset
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/A
add wave -noupdate -group Gain-Left -radix hexadecimal /fm_radio_top_tb/test_component/gainL/res
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/clock
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/reset
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/A
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/res
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/clock
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/reset
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/A
add wave -noupdate -group {Gain Right} -radix hexadecimal /fm_radio_top_tb/test_component/gainR/res
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/clock
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/reset
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/A
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/B
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/res
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/clock
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/reset
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/A
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/B
add wave -noupdate -group Mult-L0 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L0/res
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/clock
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/reset
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/A
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/B
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/res
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/clock
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/reset
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/A
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/B
add wave -noupdate -group Mult_L1 -radix hexadecimal /fm_radio_top_tb/test_component/mult_L1/res
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/clock
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/reset
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/IQ
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/I
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/Q
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/clock
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/reset
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/IQ
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/I
add wave -noupdate -group {READ IQ} -radix hexadecimal /fm_radio_top_tb/test_component/read_iq0/Q
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/clock
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/reset
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/sub
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/A
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/B
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/res
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/clock
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/reset
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/sub
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/A
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/B
add wave -noupdate -group Sub -radix hexadecimal /fm_radio_top_tb/test_component/sub0/res
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {770998 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 400
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
WaveRestoreZoom {529088 ps} {1077417 ps}

run -all
