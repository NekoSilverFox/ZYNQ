-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rgb2gray is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    imgIn_data_stream_0_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    imgIn_data_stream_0_V_empty_n : IN STD_LOGIC;
    imgIn_data_stream_0_V_read : OUT STD_LOGIC;
    imgIn_data_stream_1_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    imgIn_data_stream_1_V_empty_n : IN STD_LOGIC;
    imgIn_data_stream_1_V_read : OUT STD_LOGIC;
    imgIn_data_stream_2_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    imgIn_data_stream_2_V_empty_n : IN STD_LOGIC;
    imgIn_data_stream_2_V_read : OUT STD_LOGIC;
    imgOut_3C_data_stream_0_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    imgOut_3C_data_stream_0_V_full_n : IN STD_LOGIC;
    imgOut_3C_data_stream_0_V_write : OUT STD_LOGIC;
    imgOut_3C_data_stream_1_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    imgOut_3C_data_stream_1_V_full_n : IN STD_LOGIC;
    imgOut_3C_data_stream_1_V_write : OUT STD_LOGIC;
    imgOut_3C_data_stream_2_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    imgOut_3C_data_stream_2_V_full_n : IN STD_LOGIC;
    imgOut_3C_data_stream_2_V_write : OUT STD_LOGIC;
    imgOut_1C_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    imgOut_1C_data_stream_V_full_n : IN STD_LOGIC;
    imgOut_1C_data_stream_V_write : OUT STD_LOGIC );
end;


architecture behav of rgb2gray is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv11_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
    constant ap_const_lv10_300 : STD_LOGIC_VECTOR (9 downto 0) := "1100000000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv11_400 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv11_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv16_4C : STD_LOGIC_VECTOR (15 downto 0) := "0000000001001100";
    constant ap_const_lv16_96 : STD_LOGIC_VECTOR (15 downto 0) := "0000000010010110";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal imgIn_data_stream_0_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal exitcond_fu_242_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal imgIn_data_stream_1_V_blk_n : STD_LOGIC;
    signal imgIn_data_stream_2_V_blk_n : STD_LOGIC;
    signal imgOut_3C_data_stream_0_V_blk_n : STD_LOGIC;
    signal imgOut_3C_data_stream_1_V_blk_n : STD_LOGIC;
    signal imgOut_3C_data_stream_2_V_blk_n : STD_LOGIC;
    signal imgOut_1C_data_stream_V_blk_n : STD_LOGIC;
    signal idxRow_1_fu_236_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal idxRow_1_reg_329 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal idxCol_1_fu_248_p2 : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_block_state3 : BOOLEAN;
    signal idxRow_reg_208 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal idxCol_reg_219 : STD_LOGIC_VECTOR (10 downto 0);
    signal exitcond1_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_shl_fu_262_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal p_shl1_fu_274_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal p_shl_cast_fu_270_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal p_shl1_cast_fu_282_p1 : STD_LOGIC_VECTOR (13 downto 0);
    signal tmp_6_fu_286_p2 : STD_LOGIC_VECTOR (13 downto 0);
    signal grp_fu_309_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_309_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_309_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_317_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_317_p0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_fu_317_p1 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_fu_309_p00 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_317_p00 : STD_LOGIC_VECTOR (15 downto 0);

    component doCorner_mac_mulabkb IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (7 downto 0);
        din2 : IN STD_LOGIC_VECTOR (15 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component doCorner_mac_mulacud IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (7 downto 0);
        din1 : IN STD_LOGIC_VECTOR (8 downto 0);
        din2 : IN STD_LOGIC_VECTOR (13 downto 0);
        dout : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;



begin
    doCorner_mac_mulabkb_U11 : component doCorner_mac_mulabkb
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 8,
        din2_WIDTH => 16,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_309_p0,
        din1 => grp_fu_309_p1,
        din2 => grp_fu_317_p3,
        dout => grp_fu_309_p3);

    doCorner_mac_mulacud_U12 : component doCorner_mac_mulacud
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 8,
        din1_WIDTH => 9,
        din2_WIDTH => 14,
        dout_WIDTH => 16)
    port map (
        din0 => grp_fu_317_p0,
        din1 => grp_fu_317_p1,
        din2 => tmp_6_fu_286_p2,
        dout => grp_fu_317_p3);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond1_fu_230_p2 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    idxCol_reg_219_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((exitcond1_fu_230_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                idxCol_reg_219 <= ap_const_lv11_0;
            elsif ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                idxCol_reg_219 <= idxCol_1_fu_248_p2;
            end if; 
        end if;
    end process;

    idxRow_reg_208_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                idxRow_reg_208 <= idxRow_1_reg_329;
            elsif ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                idxRow_reg_208 <= ap_const_lv10_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                idxRow_1_reg_329 <= idxRow_1_fu_236_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2, ap_CS_fsm_state2, exitcond1_fu_230_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond1_fu_230_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                elsif ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state3_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, exitcond_fu_242_p2)
    begin
                ap_block_state3 <= (((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, exitcond1_fu_230_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond1_fu_230_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;
    exitcond1_fu_230_p2 <= "1" when (idxRow_reg_208 = ap_const_lv10_300) else "0";
    exitcond_fu_242_p2 <= "1" when (idxCol_reg_219 = ap_const_lv11_400) else "0";
    grp_fu_309_p0 <= grp_fu_309_p00(8 - 1 downto 0);
    grp_fu_309_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(imgIn_data_stream_0_V_dout),16));
    grp_fu_309_p1 <= ap_const_lv16_4C(8 - 1 downto 0);
    grp_fu_317_p0 <= grp_fu_317_p00(8 - 1 downto 0);
    grp_fu_317_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(imgIn_data_stream_1_V_dout),16));
    grp_fu_317_p1 <= ap_const_lv16_96(9 - 1 downto 0);
    idxCol_1_fu_248_p2 <= std_logic_vector(unsigned(idxCol_reg_219) + unsigned(ap_const_lv11_1));
    idxRow_1_fu_236_p2 <= std_logic_vector(unsigned(idxRow_reg_208) + unsigned(ap_const_lv10_1));

    imgIn_data_stream_0_V_blk_n_assign_proc : process(imgIn_data_stream_0_V_empty_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgIn_data_stream_0_V_blk_n <= imgIn_data_stream_0_V_empty_n;
        else 
            imgIn_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgIn_data_stream_0_V_read_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgIn_data_stream_0_V_read <= ap_const_logic_1;
        else 
            imgIn_data_stream_0_V_read <= ap_const_logic_0;
        end if; 
    end process;


    imgIn_data_stream_1_V_blk_n_assign_proc : process(imgIn_data_stream_1_V_empty_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgIn_data_stream_1_V_blk_n <= imgIn_data_stream_1_V_empty_n;
        else 
            imgIn_data_stream_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgIn_data_stream_1_V_read_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgIn_data_stream_1_V_read <= ap_const_logic_1;
        else 
            imgIn_data_stream_1_V_read <= ap_const_logic_0;
        end if; 
    end process;


    imgIn_data_stream_2_V_blk_n_assign_proc : process(imgIn_data_stream_2_V_empty_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgIn_data_stream_2_V_blk_n <= imgIn_data_stream_2_V_empty_n;
        else 
            imgIn_data_stream_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    imgIn_data_stream_2_V_read_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgIn_data_stream_2_V_read <= ap_const_logic_1;
        else 
            imgIn_data_stream_2_V_read <= ap_const_logic_0;
        end if; 
    end process;


    imgOut_1C_data_stream_V_blk_n_assign_proc : process(imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_1C_data_stream_V_blk_n <= imgOut_1C_data_stream_V_full_n;
        else 
            imgOut_1C_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgOut_1C_data_stream_V_din <= grp_fu_309_p3(15 downto 8);

    imgOut_1C_data_stream_V_write_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_1C_data_stream_V_write <= ap_const_logic_1;
        else 
            imgOut_1C_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;


    imgOut_3C_data_stream_0_V_blk_n_assign_proc : process(imgOut_3C_data_stream_0_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_3C_data_stream_0_V_blk_n <= imgOut_3C_data_stream_0_V_full_n;
        else 
            imgOut_3C_data_stream_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgOut_3C_data_stream_0_V_din <= grp_fu_309_p3(15 downto 8);

    imgOut_3C_data_stream_0_V_write_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_3C_data_stream_0_V_write <= ap_const_logic_1;
        else 
            imgOut_3C_data_stream_0_V_write <= ap_const_logic_0;
        end if; 
    end process;


    imgOut_3C_data_stream_1_V_blk_n_assign_proc : process(imgOut_3C_data_stream_1_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_3C_data_stream_1_V_blk_n <= imgOut_3C_data_stream_1_V_full_n;
        else 
            imgOut_3C_data_stream_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgOut_3C_data_stream_1_V_din <= grp_fu_309_p3(15 downto 8);

    imgOut_3C_data_stream_1_V_write_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_3C_data_stream_1_V_write <= ap_const_logic_1;
        else 
            imgOut_3C_data_stream_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    imgOut_3C_data_stream_2_V_blk_n_assign_proc : process(imgOut_3C_data_stream_2_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if (((exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_3C_data_stream_2_V_blk_n <= imgOut_3C_data_stream_2_V_full_n;
        else 
            imgOut_3C_data_stream_2_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    imgOut_3C_data_stream_2_V_din <= grp_fu_309_p3(15 downto 8);

    imgOut_3C_data_stream_2_V_write_assign_proc : process(imgIn_data_stream_0_V_empty_n, imgIn_data_stream_1_V_empty_n, imgIn_data_stream_2_V_empty_n, imgOut_3C_data_stream_0_V_full_n, imgOut_3C_data_stream_1_V_full_n, imgOut_3C_data_stream_2_V_full_n, imgOut_1C_data_stream_V_full_n, ap_CS_fsm_state3, exitcond_fu_242_p2)
    begin
        if ((not((((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_2_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_1_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgIn_data_stream_0_V_empty_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_1C_data_stream_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_2_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_1_V_full_n = ap_const_logic_0)) or ((exitcond_fu_242_p2 = ap_const_lv1_0) and (imgOut_3C_data_stream_0_V_full_n = ap_const_logic_0)))) and (exitcond_fu_242_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            imgOut_3C_data_stream_2_V_write <= ap_const_logic_1;
        else 
            imgOut_3C_data_stream_2_V_write <= ap_const_logic_0;
        end if; 
    end process;


    internal_ap_ready_assign_proc : process(ap_CS_fsm_state2, exitcond1_fu_230_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (exitcond1_fu_230_p2 = ap_const_lv1_1))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    p_shl1_cast_fu_282_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl1_fu_274_p3),14));
    p_shl1_fu_274_p3 <= (imgIn_data_stream_2_V_dout & ap_const_lv1_0);
    p_shl_cast_fu_270_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_shl_fu_262_p3),14));
    p_shl_fu_262_p3 <= (imgIn_data_stream_2_V_dout & ap_const_lv5_0);

    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_6_fu_286_p2 <= std_logic_vector(unsigned(p_shl_cast_fu_270_p1) - unsigned(p_shl1_cast_fu_282_p1));
end behav;