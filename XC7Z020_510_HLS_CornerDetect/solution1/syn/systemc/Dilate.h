// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.3
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _Dilate_HH_
#define _Dilate_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "doCorner_mux_32_8ocq.h"
#include "FAST_t_opr_k_buf_dEe.h"

namespace ap_rtl {

struct Dilate : public sc_module {
    // Port declarations 13
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<8> > p_src_data_stream_V_dout;
    sc_in< sc_logic > p_src_data_stream_V_empty_n;
    sc_out< sc_logic > p_src_data_stream_V_read;
    sc_out< sc_lv<8> > p_dst_data_stream_V_din;
    sc_in< sc_logic > p_dst_data_stream_V_full_n;
    sc_out< sc_logic > p_dst_data_stream_V_write;
    sc_signal< sc_lv<8> > ap_var_for_const0;


    // Module declarations
    Dilate(sc_module_name name);
    SC_HAS_PROCESS(Dilate);

    ~Dilate();

    sc_trace_file* mVcdFile;

    FAST_t_opr_k_buf_dEe* k_buf_0_val_3_U;
    FAST_t_opr_k_buf_dEe* k_buf_0_val_4_U;
    FAST_t_opr_k_buf_dEe* k_buf_0_val_5_U;
    doCorner_mux_32_8ocq<1,1,8,8,8,2,8>* doCorner_mux_32_8ocq_U31;
    doCorner_mux_32_8ocq<1,1,8,8,8,2,8>* doCorner_mux_32_8ocq_U32;
    doCorner_mux_32_8ocq<1,1,8,8,8,2,8>* doCorner_mux_32_8ocq_U33;
    doCorner_mux_32_8ocq<1,1,8,8,8,2,8>* doCorner_mux_32_8ocq_U34;
    doCorner_mux_32_8ocq<1,1,8,8,8,2,8>* doCorner_mux_32_8ocq_U35;
    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<4> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > p_src_data_stream_V_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_lv<1> > or_cond_i_i_i_reg_865;
    sc_signal< sc_lv<1> > icmp_reg_827;
    sc_signal< sc_lv<1> > tmp_s_reg_818;
    sc_signal< sc_logic > p_dst_data_stream_V_blk_n;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter2;
    sc_signal< sc_lv<1> > or_cond_i_i_reg_899;
    sc_signal< sc_lv<1> > or_cond_i_i_reg_899_pp0_iter1_reg;
    sc_signal< sc_lv<11> > t_V_4_reg_245;
    sc_signal< sc_lv<1> > exitcond461_i_i_fu_256_p2;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<10> > i_V_fu_262_p2;
    sc_signal< sc_lv<10> > i_V_reg_813;
    sc_signal< sc_lv<1> > tmp_s_fu_268_p2;
    sc_signal< sc_lv<1> > tmp_146_not_fu_274_p2;
    sc_signal< sc_lv<1> > tmp_146_not_reg_822;
    sc_signal< sc_lv<1> > icmp_fu_290_p2;
    sc_signal< sc_lv<1> > tmp_39_fu_296_p2;
    sc_signal< sc_lv<1> > tmp_39_reg_832;
    sc_signal< sc_lv<1> > tmp_176_2_fu_302_p2;
    sc_signal< sc_lv<1> > tmp_176_2_reg_836;
    sc_signal< sc_lv<1> > tmp_40_fu_308_p2;
    sc_signal< sc_lv<1> > tmp_40_reg_840;
    sc_signal< sc_lv<2> > row_assign_7_1_t_fu_318_p2;
    sc_signal< sc_lv<2> > row_assign_7_1_t_reg_846;
    sc_signal< sc_lv<2> > row_assign_7_2_t_fu_324_p2;
    sc_signal< sc_lv<2> > row_assign_7_2_t_reg_851;
    sc_signal< sc_lv<1> > exitcond460_i_i_fu_334_p2;
    sc_signal< sc_lv<1> > exitcond460_i_i_reg_856;
    sc_signal< bool > ap_block_state3_pp0_stage0_iter0;
    sc_signal< bool > ap_predicate_op93_read_state4;
    sc_signal< bool > ap_predicate_op101_read_state4;
    sc_signal< bool > ap_block_state4_pp0_stage0_iter1;
    sc_signal< bool > ap_block_state5_pp0_stage0_iter2;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<1> > exitcond460_i_i_reg_856_pp0_iter1_reg;
    sc_signal< sc_lv<11> > j_V_fu_340_p2;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_lv<1> > or_cond_i_i_i_fu_408_p2;
    sc_signal< sc_lv<2> > tmp_64_fu_444_p1;
    sc_signal< sc_lv<2> > tmp_64_reg_869;
    sc_signal< sc_lv<1> > brmerge_fu_448_p2;
    sc_signal< sc_lv<1> > brmerge_reg_874;
    sc_signal< sc_lv<10> > k_buf_0_val_3_addr_reg_881;
    sc_signal< sc_lv<10> > k_buf_0_val_4_addr_reg_887;
    sc_signal< sc_lv<10> > k_buf_0_val_5_addr_reg_893;
    sc_signal< sc_lv<1> > or_cond_i_i_fu_460_p2;
    sc_signal< sc_lv<8> > col_buf_0_val_0_0_fu_491_p3;
    sc_signal< sc_lv<8> > col_buf_0_val_0_0_reg_903;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_4_fu_661_p3;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_4_reg_910;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_logic > ap_condition_pp0_exit_iter0_state3;
    sc_signal< sc_lv<10> > k_buf_0_val_3_address0;
    sc_signal< sc_logic > k_buf_0_val_3_ce0;
    sc_signal< sc_lv<8> > k_buf_0_val_3_q0;
    sc_signal< sc_lv<10> > k_buf_0_val_3_address1;
    sc_signal< sc_logic > k_buf_0_val_3_ce1;
    sc_signal< sc_logic > k_buf_0_val_3_we1;
    sc_signal< sc_lv<10> > k_buf_0_val_4_address0;
    sc_signal< sc_logic > k_buf_0_val_4_ce0;
    sc_signal< sc_lv<8> > k_buf_0_val_4_q0;
    sc_signal< sc_lv<10> > k_buf_0_val_4_address1;
    sc_signal< sc_logic > k_buf_0_val_4_ce1;
    sc_signal< sc_logic > k_buf_0_val_4_we1;
    sc_signal< sc_lv<8> > k_buf_0_val_4_d1;
    sc_signal< sc_lv<10> > k_buf_0_val_5_address0;
    sc_signal< sc_logic > k_buf_0_val_5_ce0;
    sc_signal< sc_lv<8> > k_buf_0_val_5_q0;
    sc_signal< sc_lv<10> > k_buf_0_val_5_address1;
    sc_signal< sc_logic > k_buf_0_val_5_ce1;
    sc_signal< sc_logic > k_buf_0_val_5_we1;
    sc_signal< sc_lv<8> > k_buf_0_val_5_d1;
    sc_signal< sc_lv<10> > t_V_reg_234;
    sc_signal< bool > ap_block_state1;
    sc_signal< sc_logic > ap_CS_fsm_state6;
    sc_signal< sc_lv<64> > tmp_41_fu_453_p1;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_fu_120;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_1_fu_124;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_2_fu_128;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_8_fu_562_p3;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_3_fu_132;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_4_fu_136;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_9_fu_580_p3;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_5_fu_140;
    sc_signal< sc_lv<8> > src_kernel_win_0_va_6_fu_144;
    sc_signal< sc_lv<8> > right_border_buf_0_s_fu_148;
    sc_signal< sc_lv<8> > col_buf_0_val_2_0_fu_529_p3;
    sc_signal< sc_lv<8> > right_border_buf_0_1_fu_152;
    sc_signal< sc_lv<8> > col_buf_0_val_1_0_fu_510_p3;
    sc_signal< sc_lv<9> > tmp_fu_280_p4;
    sc_signal< sc_lv<2> > tmp_53_fu_314_p1;
    sc_signal< sc_lv<10> > tmp_54_fu_346_p4;
    sc_signal< sc_lv<12> > t_V_4_cast_fu_330_p1;
    sc_signal< sc_lv<10> > tmp_55_fu_362_p1;
    sc_signal< sc_lv<12> > ImagLoc_x_fu_366_p2;
    sc_signal< sc_lv<1> > tmp_56_fu_378_p3;
    sc_signal< sc_lv<2> > tmp_62_fu_392_p4;
    sc_signal< sc_lv<1> > icmp3_fu_402_p2;
    sc_signal< sc_lv<1> > rev_fu_386_p2;
    sc_signal< sc_lv<1> > tmp_63_fu_414_p3;
    sc_signal< sc_lv<1> > not_s_fu_422_p2;
    sc_signal< sc_lv<10> > ImagLoc_x_cast_fu_372_p2;
    sc_signal< sc_lv<10> > p_assign_1_cast_cast_fu_428_p3;
    sc_signal< sc_lv<10> > x_fu_436_p3;
    sc_signal< sc_lv<1> > icmp2_fu_356_p2;
    sc_signal< sc_lv<2> > col_assign_1_t_fu_474_p2;
    sc_signal< sc_lv<8> > tmp_49_fu_479_p5;
    sc_signal< sc_lv<8> > tmp_50_fu_498_p5;
    sc_signal< sc_lv<8> > tmp_51_fu_517_p5;
    sc_signal< sc_lv<8> > tmp_52_fu_551_p5;
    sc_signal< sc_lv<8> > tmp_57_fu_569_p5;
    sc_signal< sc_lv<1> > tmp_222_0_1_fu_599_p2;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_fu_605_p3;
    sc_signal< sc_lv<1> > tmp_222_0_2_fu_613_p2;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_1_fu_619_p3;
    sc_signal< sc_lv<1> > tmp_222_1_fu_627_p2;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_2_fu_633_p3;
    sc_signal< sc_lv<1> > tmp_222_1_1_fu_641_p2;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_3_fu_647_p3;
    sc_signal< sc_lv<1> > tmp_222_1_2_fu_655_p2;
    sc_signal< sc_lv<1> > tmp_222_2_fu_701_p2;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_5_fu_706_p3;
    sc_signal< sc_lv<1> > tmp_222_2_1_fu_713_p2;
    sc_signal< sc_lv<8> > temp_0_i_i_i_0210_i_6_fu_719_p3;
    sc_signal< sc_lv<1> > tmp_222_2_2_fu_727_p2;
    sc_signal< sc_lv<4> > ap_NS_fsm;
    sc_signal< bool > ap_block_pp0;
    sc_signal< bool > ap_enable_operation_67;
    sc_signal< bool > ap_enable_state3_pp0_iter0_stage0;
    sc_signal< bool > ap_enable_operation_83;
    sc_signal< bool > ap_enable_state4_pp0_iter1_stage0;
    sc_signal< bool > ap_predicate_op97_store_state4;
    sc_signal< bool > ap_enable_operation_97;
    sc_signal< bool > ap_predicate_op102_store_state4;
    sc_signal< bool > ap_enable_operation_102;
    sc_signal< bool > ap_enable_operation_69;
    sc_signal< bool > ap_enable_operation_87;
    sc_signal< bool > ap_predicate_op95_store_state4;
    sc_signal< bool > ap_enable_operation_95;
    sc_signal< bool > ap_predicate_op100_store_state4;
    sc_signal< bool > ap_enable_operation_100;
    sc_signal< bool > ap_enable_operation_71;
    sc_signal< bool > ap_enable_operation_90;
    sc_signal< bool > ap_predicate_op94_store_state4;
    sc_signal< bool > ap_enable_operation_94;
    sc_signal< bool > ap_predicate_op99_store_state4;
    sc_signal< bool > ap_enable_operation_99;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< bool > ap_condition_614;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<4> ap_ST_fsm_state1;
    static const sc_lv<4> ap_ST_fsm_state2;
    static const sc_lv<4> ap_ST_fsm_pp0_stage0;
    static const sc_lv<4> ap_ST_fsm_state6;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<32> ap_const_lv32_2;
    static const bool ap_const_boolean_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<10> ap_const_lv10_0;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<11> ap_const_lv11_0;
    static const sc_lv<10> ap_const_lv10_302;
    static const sc_lv<10> ap_const_lv10_1;
    static const sc_lv<10> ap_const_lv10_300;
    static const sc_lv<32> ap_const_lv32_9;
    static const sc_lv<9> ap_const_lv9_0;
    static const sc_lv<2> ap_const_lv2_1;
    static const sc_lv<2> ap_const_lv2_2;
    static const sc_lv<11> ap_const_lv11_402;
    static const sc_lv<11> ap_const_lv11_1;
    static const sc_lv<32> ap_const_lv32_A;
    static const sc_lv<12> ap_const_lv12_FFF;
    static const sc_lv<10> ap_const_lv10_3FF;
    static const sc_lv<32> ap_const_lv32_B;
    static const sc_lv<2> ap_const_lv2_3;
    static const sc_lv<8> ap_const_lv8_0;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_clk_no_reset_();
    void thread_ImagLoc_x_cast_fu_372_p2();
    void thread_ImagLoc_x_fu_366_p2();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state6();
    void thread_ap_block_pp0();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1();
    void thread_ap_block_state3_pp0_stage0_iter0();
    void thread_ap_block_state4_pp0_stage0_iter1();
    void thread_ap_block_state5_pp0_stage0_iter2();
    void thread_ap_condition_614();
    void thread_ap_condition_pp0_exit_iter0_state3();
    void thread_ap_done();
    void thread_ap_enable_operation_100();
    void thread_ap_enable_operation_102();
    void thread_ap_enable_operation_67();
    void thread_ap_enable_operation_69();
    void thread_ap_enable_operation_71();
    void thread_ap_enable_operation_83();
    void thread_ap_enable_operation_87();
    void thread_ap_enable_operation_90();
    void thread_ap_enable_operation_94();
    void thread_ap_enable_operation_95();
    void thread_ap_enable_operation_97();
    void thread_ap_enable_operation_99();
    void thread_ap_enable_pp0();
    void thread_ap_enable_state3_pp0_iter0_stage0();
    void thread_ap_enable_state4_pp0_iter1_stage0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_predicate_op100_store_state4();
    void thread_ap_predicate_op101_read_state4();
    void thread_ap_predicate_op102_store_state4();
    void thread_ap_predicate_op93_read_state4();
    void thread_ap_predicate_op94_store_state4();
    void thread_ap_predicate_op95_store_state4();
    void thread_ap_predicate_op97_store_state4();
    void thread_ap_predicate_op99_store_state4();
    void thread_ap_ready();
    void thread_brmerge_fu_448_p2();
    void thread_col_assign_1_t_fu_474_p2();
    void thread_col_buf_0_val_0_0_fu_491_p3();
    void thread_col_buf_0_val_1_0_fu_510_p3();
    void thread_col_buf_0_val_2_0_fu_529_p3();
    void thread_exitcond460_i_i_fu_334_p2();
    void thread_exitcond461_i_i_fu_256_p2();
    void thread_i_V_fu_262_p2();
    void thread_icmp2_fu_356_p2();
    void thread_icmp3_fu_402_p2();
    void thread_icmp_fu_290_p2();
    void thread_j_V_fu_340_p2();
    void thread_k_buf_0_val_3_address0();
    void thread_k_buf_0_val_3_address1();
    void thread_k_buf_0_val_3_ce0();
    void thread_k_buf_0_val_3_ce1();
    void thread_k_buf_0_val_3_we1();
    void thread_k_buf_0_val_4_address0();
    void thread_k_buf_0_val_4_address1();
    void thread_k_buf_0_val_4_ce0();
    void thread_k_buf_0_val_4_ce1();
    void thread_k_buf_0_val_4_d1();
    void thread_k_buf_0_val_4_we1();
    void thread_k_buf_0_val_5_address0();
    void thread_k_buf_0_val_5_address1();
    void thread_k_buf_0_val_5_ce0();
    void thread_k_buf_0_val_5_ce1();
    void thread_k_buf_0_val_5_d1();
    void thread_k_buf_0_val_5_we1();
    void thread_not_s_fu_422_p2();
    void thread_or_cond_i_i_fu_460_p2();
    void thread_or_cond_i_i_i_fu_408_p2();
    void thread_p_assign_1_cast_cast_fu_428_p3();
    void thread_p_dst_data_stream_V_blk_n();
    void thread_p_dst_data_stream_V_din();
    void thread_p_dst_data_stream_V_write();
    void thread_p_src_data_stream_V_blk_n();
    void thread_p_src_data_stream_V_read();
    void thread_rev_fu_386_p2();
    void thread_row_assign_7_1_t_fu_318_p2();
    void thread_row_assign_7_2_t_fu_324_p2();
    void thread_src_kernel_win_0_va_8_fu_562_p3();
    void thread_src_kernel_win_0_va_9_fu_580_p3();
    void thread_t_V_4_cast_fu_330_p1();
    void thread_temp_0_i_i_i_0210_i_1_fu_619_p3();
    void thread_temp_0_i_i_i_0210_i_2_fu_633_p3();
    void thread_temp_0_i_i_i_0210_i_3_fu_647_p3();
    void thread_temp_0_i_i_i_0210_i_4_fu_661_p3();
    void thread_temp_0_i_i_i_0210_i_5_fu_706_p3();
    void thread_temp_0_i_i_i_0210_i_6_fu_719_p3();
    void thread_temp_0_i_i_i_0210_i_fu_605_p3();
    void thread_tmp_146_not_fu_274_p2();
    void thread_tmp_176_2_fu_302_p2();
    void thread_tmp_222_0_1_fu_599_p2();
    void thread_tmp_222_0_2_fu_613_p2();
    void thread_tmp_222_1_1_fu_641_p2();
    void thread_tmp_222_1_2_fu_655_p2();
    void thread_tmp_222_1_fu_627_p2();
    void thread_tmp_222_2_1_fu_713_p2();
    void thread_tmp_222_2_2_fu_727_p2();
    void thread_tmp_222_2_fu_701_p2();
    void thread_tmp_39_fu_296_p2();
    void thread_tmp_40_fu_308_p2();
    void thread_tmp_41_fu_453_p1();
    void thread_tmp_53_fu_314_p1();
    void thread_tmp_54_fu_346_p4();
    void thread_tmp_55_fu_362_p1();
    void thread_tmp_56_fu_378_p3();
    void thread_tmp_62_fu_392_p4();
    void thread_tmp_63_fu_414_p3();
    void thread_tmp_64_fu_444_p1();
    void thread_tmp_fu_280_p4();
    void thread_tmp_s_fu_268_p2();
    void thread_x_fu_436_p3();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
