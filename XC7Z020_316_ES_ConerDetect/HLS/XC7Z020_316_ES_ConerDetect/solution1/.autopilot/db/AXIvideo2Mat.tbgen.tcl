set moduleName AXIvideo2Mat
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {AXIvideo2Mat}
set C_modelType { void 0 }
set C_modelArgList {
	{ AXI_video_strm_V_data_V int 24 regular {axi_s 0 volatile  { inStream Data } }  }
	{ AXI_video_strm_V_keep_V int 3 regular {axi_s 0 volatile  { inStream Keep } }  }
	{ AXI_video_strm_V_strb_V int 3 regular {axi_s 0 volatile  { inStream Strb } }  }
	{ AXI_video_strm_V_user_V int 1 regular {axi_s 0 volatile  { inStream User } }  }
	{ AXI_video_strm_V_last_V int 1 regular {axi_s 0 volatile  { inStream Last } }  }
	{ AXI_video_strm_V_id_V int 1 regular {axi_s 0 volatile  { inStream ID } }  }
	{ AXI_video_strm_V_dest_V int 1 regular {axi_s 0 volatile  { inStream Dest } }  }
	{ img_data_stream_0_V int 8 regular {fifo 1 volatile }  }
	{ img_data_stream_1_V int 8 regular {fifo 1 volatile }  }
	{ img_data_stream_2_V int 8 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "AXI_video_strm_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "AXI_video_strm_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "AXI_video_strm_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "AXI_video_strm_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "AXI_video_strm_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "AXI_video_strm_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "AXI_video_strm_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img_data_stream_0_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "img_data_stream_1_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "img_data_stream_2_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ inStream_TDATA sc_in sc_lv 24 signal 0 } 
	{ inStream_TVALID sc_in sc_logic 1 invld 6 } 
	{ inStream_TREADY sc_out sc_logic 1 inacc 6 } 
	{ inStream_TKEEP sc_in sc_lv 3 signal 1 } 
	{ inStream_TSTRB sc_in sc_lv 3 signal 2 } 
	{ inStream_TUSER sc_in sc_lv 1 signal 3 } 
	{ inStream_TLAST sc_in sc_lv 1 signal 4 } 
	{ inStream_TID sc_in sc_lv 1 signal 5 } 
	{ inStream_TDEST sc_in sc_lv 1 signal 6 } 
	{ img_data_stream_0_V_din sc_out sc_lv 8 signal 7 } 
	{ img_data_stream_0_V_full_n sc_in sc_logic 1 signal 7 } 
	{ img_data_stream_0_V_write sc_out sc_logic 1 signal 7 } 
	{ img_data_stream_1_V_din sc_out sc_lv 8 signal 8 } 
	{ img_data_stream_1_V_full_n sc_in sc_logic 1 signal 8 } 
	{ img_data_stream_1_V_write sc_out sc_logic 1 signal 8 } 
	{ img_data_stream_2_V_din sc_out sc_lv 8 signal 9 } 
	{ img_data_stream_2_V_full_n sc_in sc_logic 1 signal 9 } 
	{ img_data_stream_2_V_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "inStream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "AXI_video_strm_V_data_V", "role": "default" }} , 
 	{ "name": "inStream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "AXI_video_strm_V_dest_V", "role": "default" }} , 
 	{ "name": "inStream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "AXI_video_strm_V_dest_V", "role": "default" }} , 
 	{ "name": "inStream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_video_strm_V_keep_V", "role": "default" }} , 
 	{ "name": "inStream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "AXI_video_strm_V_strb_V", "role": "default" }} , 
 	{ "name": "inStream_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_video_strm_V_user_V", "role": "default" }} , 
 	{ "name": "inStream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_video_strm_V_last_V", "role": "default" }} , 
 	{ "name": "inStream_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_video_strm_V_id_V", "role": "default" }} , 
 	{ "name": "inStream_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "AXI_video_strm_V_dest_V", "role": "default" }} , 
 	{ "name": "img_data_stream_0_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_data_stream_0_V", "role": "din" }} , 
 	{ "name": "img_data_stream_0_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_0_V", "role": "full_n" }} , 
 	{ "name": "img_data_stream_0_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_0_V", "role": "write" }} , 
 	{ "name": "img_data_stream_1_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_data_stream_1_V", "role": "din" }} , 
 	{ "name": "img_data_stream_1_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_1_V", "role": "full_n" }} , 
 	{ "name": "img_data_stream_1_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_1_V", "role": "write" }} , 
 	{ "name": "img_data_stream_2_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_data_stream_2_V", "role": "din" }} , 
 	{ "name": "img_data_stream_2_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_2_V", "role": "full_n" }} , 
 	{ "name": "img_data_stream_2_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_2_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "AXIvideo2Mat",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "790275", "EstimateLatencyMax" : "790275",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "AXI_video_strm_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "inStream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "AXI_video_strm_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "AXI_video_strm_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "AXI_video_strm_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "AXI_video_strm_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "AXI_video_strm_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "AXI_video_strm_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "img_data_stream_0_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "img_data_stream_0_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "img_data_stream_1_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "img_data_stream_1_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "img_data_stream_2_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "img_data_stream_2_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	AXIvideo2Mat {
		AXI_video_strm_V_data_V {Type I LastRead 6 FirstWrite -1}
		AXI_video_strm_V_keep_V {Type I LastRead 6 FirstWrite -1}
		AXI_video_strm_V_strb_V {Type I LastRead 6 FirstWrite -1}
		AXI_video_strm_V_user_V {Type I LastRead 6 FirstWrite -1}
		AXI_video_strm_V_last_V {Type I LastRead 6 FirstWrite -1}
		AXI_video_strm_V_id_V {Type I LastRead 6 FirstWrite -1}
		AXI_video_strm_V_dest_V {Type I LastRead 6 FirstWrite -1}
		img_data_stream_0_V {Type O LastRead -1 FirstWrite 5}
		img_data_stream_1_V {Type O LastRead -1 FirstWrite 5}
		img_data_stream_2_V {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "790275", "Max" : "790275"}
	, {"Name" : "Interval", "Min" : "790275", "Max" : "790275"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	AXI_video_strm_V_data_V { axis {  { inStream_TDATA in_data 0 24 } } }
	AXI_video_strm_V_keep_V { axis {  { inStream_TKEEP in_data 0 3 } } }
	AXI_video_strm_V_strb_V { axis {  { inStream_TSTRB in_data 0 3 } } }
	AXI_video_strm_V_user_V { axis {  { inStream_TUSER in_data 0 1 } } }
	AXI_video_strm_V_last_V { axis {  { inStream_TLAST in_data 0 1 } } }
	AXI_video_strm_V_id_V { axis {  { inStream_TID in_data 0 1 } } }
	AXI_video_strm_V_dest_V { axis {  { inStream_TVALID in_vld 0 1 }  { inStream_TREADY in_acc 1 1 }  { inStream_TDEST in_data 0 1 } } }
	img_data_stream_0_V { ap_fifo {  { img_data_stream_0_V_din fifo_data 1 8 }  { img_data_stream_0_V_full_n fifo_status 0 1 }  { img_data_stream_0_V_write fifo_update 1 1 } } }
	img_data_stream_1_V { ap_fifo {  { img_data_stream_1_V_din fifo_data 1 8 }  { img_data_stream_1_V_full_n fifo_status 0 1 }  { img_data_stream_1_V_write fifo_update 1 1 } } }
	img_data_stream_2_V { ap_fifo {  { img_data_stream_2_V_din fifo_data 1 8 }  { img_data_stream_2_V_full_n fifo_status 0 1 }  { img_data_stream_2_V_write fifo_update 1 1 } } }
}
