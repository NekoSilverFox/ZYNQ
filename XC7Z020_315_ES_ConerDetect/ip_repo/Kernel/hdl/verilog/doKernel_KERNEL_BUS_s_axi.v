// ==============================================================
// File generated on Thu Mar 12 10:39:21 +0800 2020
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2018.3 (64-bit)
// SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
// IP Build 2404404 on Fri Dec  7 01:43:56 MST 2018
// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module doKernel_KERNEL_BUS_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 5,
    C_S_AXI_DATA_WIDTH = 32
)(
    // axi4 lite slave signals
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    // user signals
    input  wire [3:0]                    kernel_address0,
    input  wire                          kernel_ce0,
    output wire [7:0]                    kernel_q0
);
//------------------------Address Info-------------------
// 0x10 ~
// 0x1f : Memory 'kernel' (9 * 8b)
//        Word n : bit [ 7: 0] - kernel[4n]
//                 bit [15: 8] - kernel[4n+1]
//                 bit [23:16] - kernel[4n+2]
//                 bit [31:24] - kernel[4n+3]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_KERNEL_BASE = 5'h10,
    ADDR_KERNEL_HIGH = 5'h1f,
    WRIDLE           = 2'd0,
    WRDATA           = 2'd1,
    WRRESP           = 2'd2,
    WRRESET          = 2'd3,
    RDIDLE           = 2'd0,
    RDDATA           = 2'd1,
    RDRESET          = 2'd2,
    ADDR_BITS         = 5;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // memory signals
    wire [1:0]                    int_kernel_address0;
    wire                          int_kernel_ce0;
    wire                          int_kernel_we0;
    wire [3:0]                    int_kernel_be0;
    wire [31:0]                   int_kernel_d0;
    wire [31:0]                   int_kernel_q0;
    wire [1:0]                    int_kernel_address1;
    wire                          int_kernel_ce1;
    wire                          int_kernel_we1;
    wire [3:0]                    int_kernel_be1;
    wire [31:0]                   int_kernel_d1;
    wire [31:0]                   int_kernel_q1;
    reg                           int_kernel_read;
    reg                           int_kernel_write;
    reg  [1:0]                    int_kernel_shift;

//------------------------Instantiation------------------
// int_kernel
doKernel_KERNEL_BUS_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 3 )
) int_kernel (
    .clk0     ( ACLK ),
    .address0 ( int_kernel_address0 ),
    .ce0      ( int_kernel_ce0 ),
    .we0      ( int_kernel_we0 ),
    .be0      ( int_kernel_be0 ),
    .d0       ( int_kernel_d0 ),
    .q0       ( int_kernel_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_kernel_address1 ),
    .ce1      ( int_kernel_ce1 ),
    .we1      ( int_kernel_we1 ),
    .be1      ( int_kernel_be1 ),
    .d1       ( int_kernel_d1 ),
    .q1       ( int_kernel_q1 )
);

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_kernel_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
        end
        else if (int_kernel_read) begin
            rdata <= int_kernel_q1;
        end
    end
end


//------------------------Register logic-----------------

//------------------------Memory logic-------------------
// kernel
assign int_kernel_address0 = kernel_address0 >> 2;
assign int_kernel_ce0      = kernel_ce0;
assign int_kernel_we0      = 1'b0;
assign int_kernel_be0      = 1'b0;
assign int_kernel_d0       = 1'b0;
assign kernel_q0           = int_kernel_q0 >> (int_kernel_shift * 8);
assign int_kernel_address1 = ar_hs? raddr[3:2] : waddr[3:2];
assign int_kernel_ce1      = ar_hs | (int_kernel_write & WVALID);
assign int_kernel_we1      = int_kernel_write & WVALID;
assign int_kernel_be1      = WSTRB;
assign int_kernel_d1       = WDATA;
// int_kernel_read
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_KERNEL_BASE && raddr <= ADDR_KERNEL_HIGH)
            int_kernel_read <= 1'b1;
        else
            int_kernel_read <= 1'b0;
    end
end

// int_kernel_write
always @(posedge ACLK) begin
    if (ARESET)
        int_kernel_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_KERNEL_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_KERNEL_HIGH)
            int_kernel_write <= 1'b1;
        else if (WVALID)
            int_kernel_write <= 1'b0;
    end
end

// int_kernel_shift
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (kernel_ce0)
            int_kernel_shift <= kernel_address0[1:0];
    end
end


endmodule


`timescale 1ns/1ps

module doKernel_KERNEL_BUS_s_axi_ram
#(parameter
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire               we0,
    input  wire [BYTES-1:0]   be0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire               we1,
    input  wire [BYTES-1:0]   be1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------Local signal-------------------
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
// read port 0
always @(posedge clk0) begin
    if (ce0) q0 <= mem[address0];
end

// read port 1
always @(posedge clk1) begin
    if (ce1) q1 <= mem[address1];
end

genvar i;
generate
    for (i = 0; i < BYTES; i = i + 1) begin : gen_write
        // write port 0
        always @(posedge clk0) begin
            if (ce0 & we0 & be0[i]) begin
                mem[address0][8*i+7:8*i] <= d0[8*i+7:8*i];
            end
        end
        // write port 1
        always @(posedge clk1) begin
            if (ce1 & we1 & be1[i]) begin
                mem[address1][8*i+7:8*i] <= d1[8*i+7:8*i];
            end
        end
    end
endgenerate

endmodule

