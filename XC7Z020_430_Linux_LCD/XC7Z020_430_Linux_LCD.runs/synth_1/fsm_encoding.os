
 add_fsm_encoding \
       {mmcme2_drp.current_state} \
       { }  \
       {{0001 0000} {0010 0001} {0011 0010} {0100 0011} {0101 0100} {0110 0101} {0111 0110} {1000 0111} {1001 1000} }

 add_fsm_encoding \
       {axi_dynclk.clk_state} \
       { }  \
       {{000 00001} {001 00010} {010 00100} {011 01000} {100 10000} }

 add_fsm_encoding \
       {axi_datamover_pcc.sig_pcc_sm_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} {111 111} }

 add_fsm_encoding \
       {axi_vdma_v6_2_9_axis_dwidth_converter_v1_0_axisc_upsizer.state} \
       { }  \
       {{000 00010} {001 00001} {010 00100} {011 01000} {101 10000} }

 add_fsm_encoding \
       {axi_vdma_sm.dmacntrl_cs} \
       { }  \
       {{000 000} {001 001} {010 010} {011 101} {100 011} {101 100} }

 add_fsm_encoding \
       {v_axi4s_vid_out_v4_0_4_sync.state} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0100} {0100 0101} {0101 0110} {0110 0111} {0111 0011} {1000 1000} {1001 1001} {1010 1010} {1011 1011} {1100 1100} }
