#include "FAST_t_opr.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

void FAST_t_opr::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_fsm_state1;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_done_reg = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, ap_continue.read())) {
            ap_done_reg = ap_const_logic_0;
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                    esl_seteq<1,1,1>(ap_const_lv1_1, exitcond3_fu_1315_p2.read()))) {
            ap_done_reg = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter0 = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
             esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && 
             esl_seteq<1,1,1>(ap_const_lv1_1, exitcond4_fu_1367_p2.read()))) {
            ap_enable_reg_pp0_iter0 = ap_const_logic_0;
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                    esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_1315_p2.read()))) {
            ap_enable_reg_pp0_iter0 = ap_const_logic_1;
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter1 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter1 = ap_enable_reg_pp0_iter0.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter2 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            if (esl_seteq<1,1,1>(ap_const_logic_1, ap_condition_pp0_exit_iter1_state4.read())) {
                ap_enable_reg_pp0_iter2 = ap_enable_reg_pp0_iter0.read();
            } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
                ap_enable_reg_pp0_iter2 = ap_enable_reg_pp0_iter1.read();
            }
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter3 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter3 = ap_enable_reg_pp0_iter2.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter4 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter4 = ap_enable_reg_pp0_iter3.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter5 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter5 = ap_enable_reg_pp0_iter4.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter6 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter6 = ap_enable_reg_pp0_iter5.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter7 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter7 = ap_enable_reg_pp0_iter6.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter8 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter8 = ap_enable_reg_pp0_iter7.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_enable_reg_pp0_iter9 = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0)) {
            ap_enable_reg_pp0_iter9 = ap_enable_reg_pp0_iter8.read();
        } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                    esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_1315_p2.read()))) {
            ap_enable_reg_pp0_iter9 = ap_const_logic_0;
        }
    }
    if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
          esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_fu_1367_p2.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, tmp_8_fu_1420_p2.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
          esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_fu_1367_p2.read()) && 
          esl_seteq<1,1,1>(ap_const_lv1_0, or_cond1_reg_4510.read())))) {
        ap_phi_reg_pp0_iter1_core_1_reg_564 = ap_const_lv16_0;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
                esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && 
                esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()))) {
        ap_phi_reg_pp0_iter1_core_1_reg_564 = ap_phi_reg_pp0_iter0_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter3.read()))) {
        if (esl_seteq<1,1,1>(ap_condition_2362.read(), ap_const_boolean_1)) {
            ap_phi_reg_pp0_iter4_core_1_reg_564 = ap_const_lv16_0;
        } else if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
            ap_phi_reg_pp0_iter4_core_1_reg_564 = ap_phi_reg_pp0_iter3_core_1_reg_564.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        start_once_reg = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(ap_const_logic_1, real_start.read()) && 
             esl_seteq<1,1,1>(ap_const_logic_0, internal_ap_ready.read()))) {
            start_once_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(ap_const_logic_1, internal_ap_ready.read())) {
            start_once_reg = ap_const_logic_0;
        }
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
         esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter0.read()) && 
         esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_fu_1367_p2.read()))) {
        t_V_3_reg_553 = j_V_fu_1373_p2.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_1315_p2.read()))) {
        t_V_3_reg_553 = ap_const_lv11_0;
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state13.read())) {
        t_V_reg_542 = i_V_reg_4500.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && 
                !(esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
        t_V_reg_542 = ap_const_lv10_0;
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter7_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter7_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, iscorner_2_i_s_reg_4916_pp0_iter7_reg.read()))) {
        a0_1_7_reg_5064 = a0_1_7_max_int_s_fu_1273_ap_return.read();
        b0_1_7_reg_5069 = b0_1_7_min_int_s_fu_924_ap_return.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter5_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter5_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, iscorner_2_i_s_reg_4916_pp0_iter5_reg.read()))) {
        a0_2_reg_5024 = a0_2_max_int_s_fu_1107_ap_return.read();
        b0_2_reg_5034 = b0_2_min_int_s_fu_789_ap_return.read();
        tmp_101_2_reg_5029 = tmp_101_2_min_int_s_fu_755_ap_return.read();
        tmp_109_2_reg_5039 = tmp_109_2_max_int_s_fu_1150_ap_return.read();
        tmp_90_2_reg_5004 = tmp_90_2_min_int_s_fu_713_ap_return.read();
        tmp_90_4_reg_5014 = tmp_90_4_min_int_s_fu_719_ap_return.read();
        tmp_92_2_reg_5009 = tmp_92_2_max_int_s_fu_1063_ap_return.read();
        tmp_92_4_reg_5019 = tmp_92_4_max_int_s_fu_1069_ap_return.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter6_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter6_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, iscorner_2_i_s_reg_4916_pp0_iter6_reg.read()))) {
        a0_5_reg_5044 = a0_5_max_int_s_fu_1194_ap_return.read();
        b0_5_reg_5054 = b0_5_min_int_s_fu_866_ap_return.read();
        tmp_101_5_reg_5049 = tmp_101_5_min_int_s_fu_826_ap_return.read();
        tmp_109_5_reg_5059 = tmp_109_5_max_int_s_fu_1237_ap_return.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        ap_phi_reg_pp0_iter2_core_1_reg_564 = ap_phi_reg_pp0_iter1_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter2.read()))) {
        ap_phi_reg_pp0_iter3_core_1_reg_564 = ap_phi_reg_pp0_iter2_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter4.read()))) {
        ap_phi_reg_pp0_iter5_core_1_reg_564 = ap_phi_reg_pp0_iter4_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter5.read()))) {
        ap_phi_reg_pp0_iter6_core_1_reg_564 = ap_phi_reg_pp0_iter5_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter6.read()))) {
        ap_phi_reg_pp0_iter7_core_1_reg_564 = ap_phi_reg_pp0_iter6_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter7.read()))) {
        ap_phi_reg_pp0_iter8_core_1_reg_564 = ap_phi_reg_pp0_iter7_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter8.read()))) {
        ap_phi_reg_pp0_iter9_core_1_reg_564 = ap_phi_reg_pp0_iter8_core_1_reg_564.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_fu_1367_p2.read()))) {
        core_buf_val_0_V_ad_reg_4574 =  (sc_lv<11>) (tmp_6_fu_1408_p1.read());
        core_buf_val_1_V_ad_reg_4580 =  (sc_lv<11>) (tmp_6_fu_1408_p1.read());
        or_cond4_reg_4595 = or_cond4_fu_1448_p2.read();
        or_cond_reg_4533 = or_cond_fu_1393_p2.read();
        tmp_12_reg_4590 = tmp_12_fu_1426_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        core_buf_val_1_V_ad_reg_4580_pp0_iter1_reg = core_buf_val_1_V_ad_reg_4580.read();
        exitcond4_reg_4524 = exitcond4_fu_1367_p2.read();
        exitcond4_reg_4524_pp0_iter1_reg = exitcond4_reg_4524.read();
        or_cond4_reg_4595_pp0_iter1_reg = or_cond4_reg_4595.read();
        or_cond_reg_4533_pp0_iter1_reg = or_cond_reg_4533.read();
        tmp_8_reg_4586_pp0_iter1_reg = tmp_8_reg_4586.read();
    }
    if (esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0)) {
        core_buf_val_1_V_ad_reg_4580_pp0_iter2_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter1_reg.read();
        core_buf_val_1_V_ad_reg_4580_pp0_iter3_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter2_reg.read();
        core_buf_val_1_V_ad_reg_4580_pp0_iter4_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter3_reg.read();
        core_buf_val_1_V_ad_reg_4580_pp0_iter5_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter4_reg.read();
        core_buf_val_1_V_ad_reg_4580_pp0_iter6_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter5_reg.read();
        core_buf_val_1_V_ad_reg_4580_pp0_iter7_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter6_reg.read();
        core_buf_val_1_V_ad_reg_4580_pp0_iter8_reg = core_buf_val_1_V_ad_reg_4580_pp0_iter7_reg.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter2_reg = core_win_val_1_V_1_1_reg_4599.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter3_reg = core_win_val_1_V_1_1_reg_4599_pp0_iter2_reg.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter4_reg = core_win_val_1_V_1_1_reg_4599_pp0_iter3_reg.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter5_reg = core_win_val_1_V_1_1_reg_4599_pp0_iter4_reg.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter6_reg = core_win_val_1_V_1_1_reg_4599_pp0_iter5_reg.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter7_reg = core_win_val_1_V_1_1_reg_4599_pp0_iter6_reg.read();
        core_win_val_1_V_1_1_reg_4599_pp0_iter8_reg = core_win_val_1_V_1_1_reg_4599_pp0_iter7_reg.read();
        exitcond4_reg_4524_pp0_iter2_reg = exitcond4_reg_4524_pp0_iter1_reg.read();
        exitcond4_reg_4524_pp0_iter3_reg = exitcond4_reg_4524_pp0_iter2_reg.read();
        exitcond4_reg_4524_pp0_iter4_reg = exitcond4_reg_4524_pp0_iter3_reg.read();
        exitcond4_reg_4524_pp0_iter5_reg = exitcond4_reg_4524_pp0_iter4_reg.read();
        exitcond4_reg_4524_pp0_iter6_reg = exitcond4_reg_4524_pp0_iter5_reg.read();
        exitcond4_reg_4524_pp0_iter7_reg = exitcond4_reg_4524_pp0_iter6_reg.read();
        exitcond4_reg_4524_pp0_iter8_reg = exitcond4_reg_4524_pp0_iter7_reg.read();
        flag_d_assign_10_reg_4868_pp0_iter4_reg = flag_d_assign_10_reg_4868.read();
        flag_d_assign_10_reg_4868_pp0_iter5_reg = flag_d_assign_10_reg_4868_pp0_iter4_reg.read();
        flag_d_assign_10_reg_4868_pp0_iter6_reg = flag_d_assign_10_reg_4868_pp0_iter5_reg.read();
        flag_d_assign_11_reg_4880_pp0_iter4_reg = flag_d_assign_11_reg_4880.read();
        flag_d_assign_11_reg_4880_pp0_iter5_reg = flag_d_assign_11_reg_4880_pp0_iter4_reg.read();
        flag_d_assign_12_reg_4892_pp0_iter4_reg = flag_d_assign_12_reg_4892.read();
        flag_d_assign_12_reg_4892_pp0_iter5_reg = flag_d_assign_12_reg_4892_pp0_iter4_reg.read();
        flag_d_assign_12_reg_4892_pp0_iter6_reg = flag_d_assign_12_reg_4892_pp0_iter5_reg.read();
        flag_d_assign_12_reg_4892_pp0_iter7_reg = flag_d_assign_12_reg_4892_pp0_iter6_reg.read();
        flag_d_assign_13_reg_4926_pp0_iter5_reg = flag_d_assign_13_reg_4926.read();
        flag_d_assign_14_reg_4932_pp0_iter5_reg = flag_d_assign_14_reg_4932.read();
        flag_d_assign_14_reg_4932_pp0_iter6_reg = flag_d_assign_14_reg_4932_pp0_iter5_reg.read();
        flag_d_assign_14_reg_4932_pp0_iter7_reg = flag_d_assign_14_reg_4932_pp0_iter6_reg.read();
        flag_d_assign_15_reg_4938_pp0_iter5_reg = flag_d_assign_15_reg_4938.read();
        flag_d_assign_15_reg_4938_pp0_iter6_reg = flag_d_assign_15_reg_4938_pp0_iter5_reg.read();
        flag_d_assign_1_reg_4850_pp0_iter4_reg = flag_d_assign_1_reg_4850.read();
        flag_d_assign_1_reg_4850_pp0_iter5_reg = flag_d_assign_1_reg_4850_pp0_iter4_reg.read();
        flag_d_assign_1_reg_4850_pp0_iter6_reg = flag_d_assign_1_reg_4850_pp0_iter5_reg.read();
        flag_d_assign_2_reg_4862_pp0_iter4_reg = flag_d_assign_2_reg_4862.read();
        flag_d_assign_2_reg_4862_pp0_iter5_reg = flag_d_assign_2_reg_4862_pp0_iter4_reg.read();
        flag_d_assign_3_reg_4874_pp0_iter4_reg = flag_d_assign_3_reg_4874.read();
        flag_d_assign_3_reg_4874_pp0_iter5_reg = flag_d_assign_3_reg_4874_pp0_iter4_reg.read();
        flag_d_assign_3_reg_4874_pp0_iter6_reg = flag_d_assign_3_reg_4874_pp0_iter5_reg.read();
        flag_d_assign_4_reg_4886_pp0_iter4_reg = flag_d_assign_4_reg_4886.read();
        flag_d_assign_4_reg_4886_pp0_iter5_reg = flag_d_assign_4_reg_4886_pp0_iter4_reg.read();
        flag_d_assign_5_reg_4898_pp0_iter4_reg = flag_d_assign_5_reg_4898.read();
        flag_d_assign_5_reg_4898_pp0_iter5_reg = flag_d_assign_5_reg_4898_pp0_iter4_reg.read();
        flag_d_assign_5_reg_4898_pp0_iter6_reg = flag_d_assign_5_reg_4898_pp0_iter5_reg.read();
        flag_d_assign_5_reg_4898_pp0_iter7_reg = flag_d_assign_5_reg_4898_pp0_iter6_reg.read();
        flag_d_assign_6_reg_4904_pp0_iter4_reg = flag_d_assign_6_reg_4904.read();
        flag_d_assign_6_reg_4904_pp0_iter5_reg = flag_d_assign_6_reg_4904_pp0_iter4_reg.read();
        flag_d_assign_6_reg_4904_pp0_iter6_reg = flag_d_assign_6_reg_4904_pp0_iter5_reg.read();
        flag_d_assign_7_reg_4910_pp0_iter4_reg = flag_d_assign_7_reg_4910.read();
        flag_d_assign_7_reg_4910_pp0_iter5_reg = flag_d_assign_7_reg_4910_pp0_iter4_reg.read();
        flag_d_assign_7_reg_4910_pp0_iter6_reg = flag_d_assign_7_reg_4910_pp0_iter5_reg.read();
        flag_d_assign_7_reg_4910_pp0_iter7_reg = flag_d_assign_7_reg_4910_pp0_iter6_reg.read();
        flag_d_assign_8_reg_4844_pp0_iter4_reg = flag_d_assign_8_reg_4844.read();
        flag_d_assign_8_reg_4844_pp0_iter5_reg = flag_d_assign_8_reg_4844_pp0_iter4_reg.read();
        flag_d_assign_8_reg_4844_pp0_iter6_reg = flag_d_assign_8_reg_4844_pp0_iter5_reg.read();
        flag_d_assign_9_reg_4856_pp0_iter4_reg = flag_d_assign_9_reg_4856.read();
        flag_d_assign_9_reg_4856_pp0_iter5_reg = flag_d_assign_9_reg_4856_pp0_iter4_reg.read();
        flag_d_assign_s_reg_4920_pp0_iter5_reg = flag_d_assign_s_reg_4920.read();
        iscorner_2_i_s_reg_4916_pp0_iter4_reg = iscorner_2_i_s_reg_4916.read();
        iscorner_2_i_s_reg_4916_pp0_iter5_reg = iscorner_2_i_s_reg_4916_pp0_iter4_reg.read();
        iscorner_2_i_s_reg_4916_pp0_iter6_reg = iscorner_2_i_s_reg_4916_pp0_iter5_reg.read();
        iscorner_2_i_s_reg_4916_pp0_iter7_reg = iscorner_2_i_s_reg_4916_pp0_iter6_reg.read();
        iscorner_2_i_s_reg_4916_pp0_iter8_reg = iscorner_2_i_s_reg_4916_pp0_iter7_reg.read();
        or_cond4_reg_4595_pp0_iter2_reg = or_cond4_reg_4595_pp0_iter1_reg.read();
        or_cond4_reg_4595_pp0_iter3_reg = or_cond4_reg_4595_pp0_iter2_reg.read();
        or_cond4_reg_4595_pp0_iter4_reg = or_cond4_reg_4595_pp0_iter3_reg.read();
        or_cond4_reg_4595_pp0_iter5_reg = or_cond4_reg_4595_pp0_iter4_reg.read();
        or_cond4_reg_4595_pp0_iter6_reg = or_cond4_reg_4595_pp0_iter5_reg.read();
        or_cond4_reg_4595_pp0_iter7_reg = or_cond4_reg_4595_pp0_iter6_reg.read();
        or_cond4_reg_4595_pp0_iter8_reg = or_cond4_reg_4595_pp0_iter7_reg.read();
        or_cond_reg_4533_pp0_iter2_reg = or_cond_reg_4533_pp0_iter1_reg.read();
        or_cond_reg_4533_pp0_iter3_reg = or_cond_reg_4533_pp0_iter2_reg.read();
        or_cond_reg_4533_pp0_iter4_reg = or_cond_reg_4533_pp0_iter3_reg.read();
        or_cond_reg_4533_pp0_iter5_reg = or_cond_reg_4533_pp0_iter4_reg.read();
        or_cond_reg_4533_pp0_iter6_reg = or_cond_reg_4533_pp0_iter5_reg.read();
        or_cond_reg_4533_pp0_iter7_reg = or_cond_reg_4533_pp0_iter6_reg.read();
        or_cond_reg_4533_pp0_iter8_reg = or_cond_reg_4533_pp0_iter7_reg.read();
        ret_V_1_5_reg_4681_pp0_iter3_reg = ret_V_1_5_reg_4681.read();
        ret_V_1_6_reg_4691_pp0_iter3_reg = ret_V_1_6_reg_4691.read();
        ret_V_1_7_reg_4701_pp0_iter3_reg = ret_V_1_7_reg_4701.read();
        ret_V_reg_4626_pp0_iter3_reg = ret_V_reg_4626.read();
        tmp20_reg_4621_pp0_iter2_reg = tmp20_reg_4621.read();
        tmp20_reg_4621_pp0_iter3_reg = tmp20_reg_4621_pp0_iter2_reg.read();
        tmp20_reg_4621_pp0_iter4_reg = tmp20_reg_4621_pp0_iter3_reg.read();
        tmp20_reg_4621_pp0_iter5_reg = tmp20_reg_4621_pp0_iter4_reg.read();
        tmp20_reg_4621_pp0_iter6_reg = tmp20_reg_4621_pp0_iter5_reg.read();
        tmp20_reg_4621_pp0_iter7_reg = tmp20_reg_4621_pp0_iter6_reg.read();
        tmp20_reg_4621_pp0_iter8_reg = tmp20_reg_4621_pp0_iter7_reg.read();
        tmp_115_2_reg_4606_pp0_iter2_reg = tmp_115_2_reg_4606.read();
        tmp_115_2_reg_4606_pp0_iter3_reg = tmp_115_2_reg_4606_pp0_iter2_reg.read();
        tmp_115_2_reg_4606_pp0_iter4_reg = tmp_115_2_reg_4606_pp0_iter3_reg.read();
        tmp_115_2_reg_4606_pp0_iter5_reg = tmp_115_2_reg_4606_pp0_iter4_reg.read();
        tmp_115_2_reg_4606_pp0_iter6_reg = tmp_115_2_reg_4606_pp0_iter5_reg.read();
        tmp_115_2_reg_4606_pp0_iter7_reg = tmp_115_2_reg_4606_pp0_iter6_reg.read();
        tmp_115_2_reg_4606_pp0_iter8_reg = tmp_115_2_reg_4606_pp0_iter7_reg.read();
        tmp_13_reg_4611_pp0_iter2_reg = tmp_13_reg_4611.read();
        tmp_13_reg_4611_pp0_iter3_reg = tmp_13_reg_4611_pp0_iter2_reg.read();
        tmp_13_reg_4611_pp0_iter4_reg = tmp_13_reg_4611_pp0_iter3_reg.read();
        tmp_13_reg_4611_pp0_iter5_reg = tmp_13_reg_4611_pp0_iter4_reg.read();
        tmp_13_reg_4611_pp0_iter6_reg = tmp_13_reg_4611_pp0_iter5_reg.read();
        tmp_13_reg_4611_pp0_iter7_reg = tmp_13_reg_4611_pp0_iter6_reg.read();
        tmp_13_reg_4611_pp0_iter8_reg = tmp_13_reg_4611_pp0_iter7_reg.read();
        tmp_14_reg_4616_pp0_iter2_reg = tmp_14_reg_4616.read();
        tmp_14_reg_4616_pp0_iter3_reg = tmp_14_reg_4616_pp0_iter2_reg.read();
        tmp_14_reg_4616_pp0_iter4_reg = tmp_14_reg_4616_pp0_iter3_reg.read();
        tmp_14_reg_4616_pp0_iter5_reg = tmp_14_reg_4616_pp0_iter4_reg.read();
        tmp_14_reg_4616_pp0_iter6_reg = tmp_14_reg_4616_pp0_iter5_reg.read();
        tmp_14_reg_4616_pp0_iter7_reg = tmp_14_reg_4616_pp0_iter6_reg.read();
        tmp_14_reg_4616_pp0_iter8_reg = tmp_14_reg_4616_pp0_iter7_reg.read();
        tmp_8_reg_4586_pp0_iter2_reg = tmp_8_reg_4586_pp0_iter1_reg.read();
        tmp_8_reg_4586_pp0_iter3_reg = tmp_8_reg_4586_pp0_iter2_reg.read();
        tmp_8_reg_4586_pp0_iter4_reg = tmp_8_reg_4586_pp0_iter3_reg.read();
        tmp_8_reg_4586_pp0_iter5_reg = tmp_8_reg_4586_pp0_iter4_reg.read();
        tmp_8_reg_4586_pp0_iter6_reg = tmp_8_reg_4586_pp0_iter5_reg.read();
        tmp_8_reg_4586_pp0_iter7_reg = tmp_8_reg_4586_pp0_iter6_reg.read();
        tmp_8_reg_4586_pp0_iter8_reg = tmp_8_reg_4586_pp0_iter7_reg.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && esl_seteq<1,1,1>(exitcond4_reg_4524.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        core_win_val_0_V_0_fu_186 = core_win_val_0_V_1_fu_182.read();
        core_win_val_0_V_1_fu_182 = core_buf_val_0_V_q0.read();
        core_win_val_1_V_0_fu_178 = core_win_val_1_V_1_fu_174.read();
        core_win_val_1_V_1_fu_174 = core_buf_val_1_V_q0.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(exitcond4_reg_4524.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        core_win_val_1_V_1_1_reg_4599 = core_win_val_1_V_1_fu_174.read();
        tmp20_reg_4621 = tmp20_fu_1840_p2.read();
        tmp_115_2_reg_4606 = tmp_115_2_fu_1806_p2.read();
        tmp_13_reg_4611 = tmp_13_fu_1812_p2.read();
        tmp_14_reg_4616 = tmp_14_fu_1818_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter9.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter8_reg.read()))) {
        core_win_val_2_V_0_fu_170 = core_win_val_2_V_1_fu_166.read();
        core_win_val_2_V_1_fu_166 = core_win_val_2_V_2_fu_4112_p3.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter1_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter1_reg.read()))) {
        count_1_i_2_reg_4792 = count_1_i_2_fu_3141_p3.read();
        not_or_cond11_reg_4828 = not_or_cond11_fu_3191_p2.read();
        not_or_cond_reg_4787 = not_or_cond_fu_2855_p2.read();
        or_cond18_reg_4822 = or_cond18_fu_3179_p2.read();
        or_cond2_reg_4782 = or_cond2_fu_2733_p2.read();
        or_cond5_reg_4706 = or_cond5_fu_2643_p2.read();
        or_cond6_reg_4722 = or_cond6_fu_2661_p2.read();
        or_cond7_reg_4737 = or_cond7_fu_2679_p2.read();
        or_cond8_reg_4752 = or_cond8_fu_2697_p2.read();
        or_cond9_reg_4767 = or_cond9_fu_2715_p2.read();
        ret_V_1_1_reg_4641 = ret_V_1_1_fu_2029_p2.read();
        ret_V_1_2_reg_4651 = ret_V_1_2_fu_2117_p2.read();
        ret_V_1_3_reg_4661 = ret_V_1_3_fu_2205_p2.read();
        ret_V_1_4_reg_4671 = ret_V_1_4_fu_2293_p2.read();
        ret_V_1_5_reg_4681 = ret_V_1_5_fu_2381_p2.read();
        ret_V_1_6_reg_4691 = ret_V_1_6_fu_2469_p2.read();
        ret_V_1_7_reg_4701 = ret_V_1_7_fu_2557_p2.read();
        ret_V_1_reg_4631 = ret_V_1_fu_1941_p2.read();
        ret_V_2_reg_4646 = ret_V_2_fu_2107_p2.read();
        ret_V_3_reg_4656 = ret_V_3_fu_2195_p2.read();
        ret_V_4_reg_4666 = ret_V_4_fu_2283_p2.read();
        ret_V_5_reg_4676 = ret_V_5_fu_2371_p2.read();
        ret_V_6_reg_4686 = ret_V_6_fu_2459_p2.read();
        ret_V_7_reg_4696 = ret_V_7_fu_2547_p2.read();
        ret_V_reg_4626 = ret_V_fu_1931_p2.read();
        ret_V_s_reg_4636 = ret_V_s_fu_2019_p2.read();
        tmp10_reg_4839 = tmp10_fu_3215_p2.read();
        tmp6_reg_4834 = tmp6_fu_3209_p2.read();
        tmp_69_1_not_reg_4712 = tmp_69_1_not_fu_2649_p2.read();
        tmp_69_2_not_reg_4727 = tmp_69_2_not_fu_2667_p2.read();
        tmp_69_3_not_reg_4742 = tmp_69_3_not_fu_2685_p2.read();
        tmp_69_3_reg_4798 = tmp_69_3_fu_3149_p2.read();
        tmp_69_4_not_reg_4757 = tmp_69_4_not_fu_2703_p2.read();
        tmp_69_4_reg_4810 = tmp_69_4_fu_3161_p2.read();
        tmp_69_5_not_reg_4772 = tmp_69_5_not_fu_2721_p2.read();
        tmp_71_11_reg_4804 = tmp_71_11_fu_3155_p2.read();
        tmp_71_12_reg_4816 = tmp_71_12_fu_3167_p2.read();
        tmp_71_1_reg_4717 = tmp_71_1_fu_2655_p2.read();
        tmp_71_2_reg_4732 = tmp_71_2_fu_2673_p2.read();
        tmp_71_3_reg_4747 = tmp_71_3_fu_2691_p2.read();
        tmp_71_4_reg_4762 = tmp_71_4_fu_2709_p2.read();
        tmp_71_5_reg_4777 = tmp_71_5_fu_2727_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter2_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter2_reg.read()))) {
        flag_d_assign_10_reg_4868 = flag_d_assign_10_fu_3241_p1.read();
        flag_d_assign_11_reg_4880 = flag_d_assign_11_fu_3251_p1.read();
        flag_d_assign_12_reg_4892 = flag_d_assign_12_fu_3261_p1.read();
        flag_d_assign_1_reg_4850 = flag_d_assign_1_fu_3226_p1.read();
        flag_d_assign_2_reg_4862 = flag_d_assign_2_fu_3236_p1.read();
        flag_d_assign_3_reg_4874 = flag_d_assign_3_fu_3246_p1.read();
        flag_d_assign_4_reg_4886 = flag_d_assign_4_fu_3256_p1.read();
        flag_d_assign_5_reg_4898 = flag_d_assign_5_fu_3266_p1.read();
        flag_d_assign_6_reg_4904 = flag_d_assign_6_fu_3271_p1.read();
        flag_d_assign_7_reg_4910 = flag_d_assign_7_fu_3276_p1.read();
        flag_d_assign_8_reg_4844 = flag_d_assign_8_fu_3221_p1.read();
        flag_d_assign_9_reg_4856 = flag_d_assign_9_fu_3231_p1.read();
        iscorner_2_i_s_reg_4916 = iscorner_2_i_s_fu_3695_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter3_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter3_reg.read()))) {
        flag_d_assign_13_reg_4926 = flag_d_assign_13_fu_3798_p1.read();
        flag_d_assign_14_reg_4932 = flag_d_assign_14_fu_3803_p1.read();
        flag_d_assign_15_reg_4938 = flag_d_assign_15_fu_3808_p1.read();
        flag_d_assign_s_reg_4920 = flag_d_assign_s_fu_3793_p1.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter3_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter3_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, iscorner_2_i_s_reg_4916.read()))) {
        flag_d_max2_11_reg_4959 = grp_reg_int_s_fu_3786_ap_return.read();
        flag_d_max2_1_reg_4949 = grp_reg_int_s_fu_3708_ap_return.read();
        flag_d_min2_11_reg_4954 = grp_reg_int_s_fu_3779_ap_return.read();
        flag_d_min2_1_reg_4944 = grp_reg_int_s_fu_3701_ap_return.read();
    }
    if ((esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_reg_4524_pp0_iter4_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, tmp_8_reg_4586_pp0_iter4_reg.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, iscorner_2_i_s_reg_4916_pp0_iter4_reg.read()))) {
        flag_d_max4_1_reg_4969 = grp_reg_int_s_fu_3852_ap_return.read();
        flag_d_max4_3_reg_4979 = grp_reg_int_s_fu_3866_ap_return.read();
        flag_d_max4_7_reg_4989 = grp_reg_int_s_fu_3896_ap_return.read();
        flag_d_max4_9_reg_4999 = grp_reg_int_s_fu_3910_ap_return.read();
        flag_d_min4_1_reg_4964 = grp_reg_int_s_fu_3845_ap_return.read();
        flag_d_min4_3_reg_4974 = grp_reg_int_s_fu_3859_ap_return.read();
        flag_d_min4_7_reg_4984 = grp_reg_int_s_fu_3889_ap_return.read();
        flag_d_min4_9_reg_4994 = grp_reg_int_s_fu_3903_ap_return.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read())) {
        i_V_reg_4500 = i_V_fu_1321_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_1315_p2.read()))) {
        icmp_reg_4519 = icmp_fu_1361_p2.read();
        or_cond1_reg_4510 = or_cond1_fu_1339_p2.read();
        tmp_2_reg_4514 = tmp_2_fu_1345_p2.read();
        tmp_s_reg_4505 = tmp_s_fu_1327_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_fu_1367_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond_fu_1393_p2.read()))) {
        k_buf_val_0_V_addr_reg_4538 =  (sc_lv<10>) (tmp_5_fu_1398_p1.read());
        k_buf_val_1_V_addr_reg_4544 =  (sc_lv<10>) (tmp_5_fu_1398_p1.read());
        k_buf_val_2_V_addr_reg_4550 =  (sc_lv<10>) (tmp_5_fu_1398_p1.read());
        k_buf_val_3_V_addr_reg_4556 =  (sc_lv<10>) (tmp_5_fu_1398_p1.read());
        k_buf_val_4_V_addr_reg_4562 =  (sc_lv<10>) (tmp_5_fu_1398_p1.read());
        k_buf_val_5_V_addr_reg_4568 =  (sc_lv<10>) (tmp_5_fu_1398_p1.read());
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond4_fu_1367_p2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, or_cond1_reg_4510.read()))) {
        tmp_8_reg_4586 = tmp_8_fu_1420_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && esl_seteq<1,1,1>(exitcond4_reg_4524.read(), ap_const_lv1_0) && esl_seteq<1,1,1>(or_cond_reg_4533.read(), ap_const_lv1_1) && esl_seteq<1,1,1>(ap_block_pp0_stage0_11001.read(), ap_const_boolean_0))) {
        win_val_0_V_2_1_fu_194 = win_val_0_V_3_fu_198.read();
        win_val_0_V_2_fu_190 = win_val_0_V_2_1_fu_194.read();
        win_val_0_V_3_fu_198 = win_val_0_V_4_fu_202.read();
        win_val_0_V_4_fu_202 = win_val_0_V_5_fu_206.read();
        win_val_0_V_5_fu_206 = k_buf_val_0_V_q0.read();
        win_val_1_V_1_1_fu_214 = win_val_1_V_2_fu_218.read();
        win_val_1_V_1_fu_210 = win_val_1_V_1_1_fu_214.read();
        win_val_1_V_2_fu_218 = win_val_1_V_3_fu_222.read();
        win_val_1_V_3_fu_222 = win_val_1_V_4_fu_226.read();
        win_val_1_V_4_fu_226 = win_val_1_V_5_fu_230.read();
        win_val_1_V_5_fu_230 = k_buf_val_1_V_q0.read();
        win_val_2_V_0_1_fu_238 = win_val_2_V_1_fu_242.read();
        win_val_2_V_0_fu_234 = win_val_2_V_0_1_fu_238.read();
        win_val_2_V_1_fu_242 = win_val_2_V_2_fu_246.read();
        win_val_2_V_2_fu_246 = win_val_2_V_3_fu_250.read();
        win_val_2_V_3_fu_250 = win_val_2_V_4_fu_254.read();
        win_val_2_V_4_fu_254 = win_val_2_V_5_fu_258.read();
        win_val_2_V_5_fu_258 = k_buf_val_2_V_q0.read();
        win_val_3_V_0_1_fu_266 = win_val_3_V_1_fu_270.read();
        win_val_3_V_0_fu_262 = win_val_3_V_0_1_fu_266.read();
        win_val_3_V_1_fu_270 = win_val_3_V_2_fu_274.read();
        win_val_3_V_2_fu_274 = win_val_3_V_3_fu_278.read();
        win_val_3_V_3_fu_278 = win_val_3_V_4_fu_282.read();
        win_val_3_V_4_fu_282 = win_val_3_V_5_fu_286.read();
        win_val_3_V_5_fu_286 = k_buf_val_3_V_q0.read();
        win_val_4_V_0_1_fu_294 = win_val_4_V_1_fu_298.read();
        win_val_4_V_0_fu_290 = win_val_4_V_0_1_fu_294.read();
        win_val_4_V_1_fu_298 = win_val_4_V_2_fu_302.read();
        win_val_4_V_2_fu_302 = win_val_4_V_3_fu_306.read();
        win_val_4_V_3_fu_306 = win_val_4_V_4_fu_310.read();
        win_val_4_V_4_fu_310 = win_val_4_V_5_fu_314.read();
        win_val_4_V_5_fu_314 = k_buf_val_4_V_q0.read();
        win_val_5_V_1_1_fu_322 = win_val_5_V_2_fu_326.read();
        win_val_5_V_1_fu_318 = win_val_5_V_1_1_fu_322.read();
        win_val_5_V_2_fu_326 = win_val_5_V_3_fu_330.read();
        win_val_5_V_3_fu_330 = win_val_5_V_4_fu_334.read();
        win_val_5_V_4_fu_334 = win_val_5_V_5_fu_338.read();
        win_val_5_V_5_fu_338 = k_buf_val_5_V_q0.read();
        win_val_6_V_2_1_fu_346 = win_val_6_V_3_fu_350.read();
        win_val_6_V_2_fu_342 = win_val_6_V_2_1_fu_346.read();
        win_val_6_V_3_fu_350 = win_val_6_V_4_fu_354.read();
        win_val_6_V_4_fu_354 = win_val_6_V_5_fu_358.read();
        win_val_6_V_5_fu_358 = p_src_data_stream_V_dout.read();
    }
}

void FAST_t_opr::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state1.read()) && !(esl_seteq<1,1,1>(ap_const_logic_0, real_start.read()) || esl_seteq<1,1,1>(ap_done_reg.read(), ap_const_logic_1)))) {
                ap_NS_fsm = ap_ST_fsm_state2;
            } else {
                ap_NS_fsm = ap_ST_fsm_state1;
            }
            break;
        case 2 : 
            if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_state2.read()) && esl_seteq<1,1,1>(ap_const_lv1_1, exitcond3_fu_1315_p2.read()))) {
                ap_NS_fsm = ap_ST_fsm_state1;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            }
            break;
        case 4 : 
            if ((!(esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter9.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_enable_reg_pp0_iter8.read(), ap_const_logic_0)) && !(esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && esl_seteq<1,1,1>(ap_enable_reg_pp0_iter0.read(), ap_const_logic_0) && esl_seteq<1,1,1>(ap_enable_reg_pp0_iter2.read(), ap_const_logic_0)))) {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            } else if (((esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter9.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && 
  esl_seteq<1,1,1>(ap_enable_reg_pp0_iter8.read(), ap_const_logic_0)) || (esl_seteq<1,1,1>(ap_const_logic_1, ap_CS_fsm_pp0_stage0.read()) && 
  esl_seteq<1,1,1>(ap_const_logic_1, ap_enable_reg_pp0_iter1.read()) && 
  esl_seteq<1,1,1>(ap_block_pp0_stage0_subdone.read(), ap_const_boolean_0) && 
  esl_seteq<1,1,1>(ap_enable_reg_pp0_iter0.read(), ap_const_logic_0) && 
  esl_seteq<1,1,1>(ap_enable_reg_pp0_iter2.read(), ap_const_logic_0)))) {
                ap_NS_fsm = ap_ST_fsm_state13;
            } else {
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            }
            break;
        case 8 : 
            ap_NS_fsm = ap_ST_fsm_state2;
            break;
        default : 
            ap_NS_fsm = "XXXX";
            break;
    }
}

}

