onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {BUS SIGNAL}
add wave -noupdate -radix decimal /karki_datapath_all_tb/datap/S_BUS
add wave -noupdate -radix binary /karki_datapath_all_tb/datap/S_BUS
add wave -noupdate -divider {DATAPATH INPUTS}
add wave -noupdate /karki_datapath_all_tb/CLKtb
add wave -noupdate /karki_datapath_all_tb/RSTntb
add wave -noupdate /karki_datapath_all_tb/datap/Clk
add wave -noupdate /karki_datapath_all_tb/datap/RESET
add wave -noupdate -divider {DATAPATH TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/MAR_EN
add wave -noupdate /karki_datapath_all_tb/datap/MDR_EN
add wave -noupdate /karki_datapath_all_tb/datap/MEM_EN
add wave -noupdate /karki_datapath_all_tb/datap/LD_PC
add wave -noupdate /karki_datapath_all_tb/datap/LD_PCMUX
add wave -noupdate /karki_datapath_all_tb/datap/READ_WRITE_EN
add wave -noupdate /karki_datapath_all_tb/datap/GATE_MDR
add wave -noupdate /karki_datapath_all_tb/datap/GATE_PC
add wave -noupdate /karki_datapath_all_tb/datap/GATE_MARMUX
add wave -noupdate /karki_datapath_all_tb/datap/GATE_ALU
add wave -noupdate /karki_datapath_all_tb/datap/LD_IR
add wave -noupdate /karki_datapath_all_tb/datap/LD_NZP
add wave -noupdate /karki_datapath_all_tb/datap/LD_REG
add wave -noupdate /karki_datapath_all_tb/datap/LD_MM
add wave -noupdate /karki_datapath_all_tb/datap/LD_ADDR1MUX
add wave -noupdate /karki_datapath_all_tb/datap/LD_ADDR2MUX
add wave -noupdate /karki_datapath_all_tb/datap/LD_DR
add wave -noupdate /karki_datapath_all_tb/datap/LD_SR2MUX
add wave -noupdate /karki_datapath_all_tb/datap/LD_ALU
add wave -noupdate /karki_datapath_all_tb/datap/SR1
add wave -noupdate /karki_datapath_all_tb/datap/SR2
add wave -noupdate /karki_datapath_all_tb/datap/S_MAR_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_MDR_BUS
add wave -noupdate /karki_datapath_all_tb/datap/S_MEM_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_PC_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_PC_PLUS
add wave -noupdate /karki_datapath_all_tb/datap/S_PCMUX_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_BUS
add wave -noupdate /karki_datapath_all_tb/datap/S_C_ADDER_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_IR_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_NZP_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_SR1_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_SR2_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_8to16_ZEXT
add wave -noupdate /karki_datapath_all_tb/datap/S_5to16_SEXT
add wave -noupdate /karki_datapath_all_tb/datap/S_6to16_SEXT
add wave -noupdate /karki_datapath_all_tb/datap/S_9to16_SEXT
add wave -noupdate /karki_datapath_all_tb/datap/S_11to16_SEXT
add wave -noupdate /karki_datapath_all_tb/datap/S_ADDR1MUX_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_ADDR2MUX_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_SR2MUX_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_MARMUX_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_ALU_OUT
add wave -noupdate /karki_datapath_all_tb/datap/S_ZERO
add wave -noupdate -divider -height 20 FSM
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/RESET
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/IR_OUT
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/NZP_OUT
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/MAR_EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/MDR_EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/MEM_EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_PC
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_PCMUX
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/READ_WRITE_EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/GATE_MDR
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/GATE_PC
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/GATE_MARMUX
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/GATE_ALU
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_IR
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_NZP
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_REG
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_MM
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_ADDR1MUX
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_ADDR2MUX
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_DR
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_SR2MUX
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/LD_ALU
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/SR1
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/SR2
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/cpu_state
add wave -noupdate /karki_datapath_all_tb/datap/Inst_FSM/next_state
add wave -noupdate -divider -height 20 {PC MUX}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst7_PCMUX/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst7_PCMUX/OP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst7_PCMUX/OP_C
add wave -noupdate /karki_datapath_all_tb/datap/Inst7_PCMUX/Sel
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst7_PCMUX/OP_Q
add wave -noupdate -divider -height 20 PC
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/OP_Q1
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/OP_Q2
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/PC_Data
add wave -noupdate /karki_datapath_all_tb/datap/Inst6_PC/PC_Data_Plus
add wave -noupdate -divider -height 20 GATE_PC
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst5_Gate_PC/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst5_Gate_PC/Enable
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst5_Gate_PC/sOP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst5_Gate_PC/sEnable
add wave -noupdate /karki_datapath_all_tb/datap/Inst5_Gate_PC/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst5_Gate_PC/sOP_Q
add wave -noupdate -divider -height 20 MAR
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst1_MAR/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst1_MAR/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst1_MAR/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst1_MAR/BUS_IN
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst1_MAR/MAR_OUT
add wave -noupdate /karki_datapath_all_tb/datap/Inst1_MAR/MAR_DATA_OUT
add wave -noupdate -divider -height 20 RAM
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/CLK
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/mem_wr_rd_add
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/Data_In
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/mem_en
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/read_write_en
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/Data_Out
add wave -noupdate /karki_datapath_all_tb/datap/Inst2_RAM/SData_Out
add wave -noupdate -divider -height 20 MDR
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/BUS_IN
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/MEM_IN
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/MDR_OUT
add wave -noupdate /karki_datapath_all_tb/datap/Inst3_MDR/MDR_DATA
add wave -noupdate -divider -height 20 GATE_MDR
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst4_Gate_MDR/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst4_Gate_MDR/Enable
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst4_Gate_MDR/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst4_Gate_MDR/sOP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst4_Gate_MDR/sEnable
add wave -noupdate /karki_datapath_all_tb/datap/Inst4_Gate_MDR/sOP_Q
add wave -noupdate -divider -height 20 IR
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst8_IR/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst8_IR/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst8_IR/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst8_IR/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst8_IR/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst8_IR/S_D
add wave -noupdate -divider -height 20 NZP
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst9_NZP/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst9_NZP/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst9_NZP/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst9_NZP/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst9_NZP/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst9_NZP/S_D
add wave -noupdate -divider -height 20 {Register Array}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/LD_Reg
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/DR
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/SR1
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/SR2
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/OP_Q1
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/OP_Q2
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/sEN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/sFF
add wave -noupdate -divider {g0(0) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(0)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(0)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(0)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(0)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(0)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(0)/reg/S_D
add wave -noupdate -divider {g0(1) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(1)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(1)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(1)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(1)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(1)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(1)/reg/S_D
add wave -noupdate -divider {g0(2) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(2)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(2)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(2)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(2)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(2)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(2)/reg/S_D
add wave -noupdate -divider {g0(3) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(3)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(3)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(3)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(3)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(3)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(3)/reg/S_D
add wave -noupdate -divider {g0(4) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(4)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(4)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(4)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(4)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(4)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(4)/reg/S_D
add wave -noupdate -divider {g0(5) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(5)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(5)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(5)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(5)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(5)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(5)/reg/S_D
add wave -noupdate -divider {g0(6) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(6)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(6)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(6)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(6)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(6)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(6)/reg/S_D
add wave -noupdate -divider {g0(7) Register}
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(7)/reg/Clk
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(7)/reg/EN
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(7)/reg/RST
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(7)/reg/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(7)/reg/OP_Q
add wave -noupdate /karki_datapath_all_tb/datap/Inst10_Reg_Array/g0(7)/reg/S_D
add wave -noupdate -divider -height 20 {SR2 MUX}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SR2MUX/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SR2MUX/OP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SR2MUX/Sel
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SR2MUX/OP_Q
add wave -noupdate -divider -height 20 ALU
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/OP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/Sel
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/OP_Q
add wave -noupdate -divider -height 20 {GATE ALU}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst12_Gate_ALU/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst12_Gate_ALU/Enable
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst12_Gate_ALU/sOP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst12_Gate_ALU/sEnable
add wave -noupdate /karki_datapath_all_tb/datap/Inst12_Gate_ALU/sOP_Q
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst12_Gate_ALU/OP_Q
add wave -noupdate -divider -height 20 {Sign Extender 5to16}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_5to16/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_5to16/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_5to16/sONES
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_5to16/sZEROS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_5to16/sQ
add wave -noupdate -divider -height 20 {Sign Extender 6to16}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_6to16/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_6to16/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_6to16/sONES
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_6to16/sZEROS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_6to16/sQ
add wave -noupdate -divider -height 20 {Sign Extender 9to16}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_9to16/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_9to16/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_9to16/sONES
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_9to16/sZEROS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_9to16/sQ
add wave -noupdate -divider -height 20 {Sign Extender 11to16}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_11to16/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_11to16/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_11to16/sONES
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_11to16/sZEROS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_SEXT_11to16/sQ
add wave -noupdate -divider -height 20 {Zero Extender 8to16}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ZEXT_8to16/OP_A
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ZEXT_8to16/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ZEXT_8to16/sZEROS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ZEXT_8to16/sQ
add wave -noupdate -divider -height 20 {Address1 MUX}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR1MUX/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR1MUX/OP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR1MUX/Sel
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR1MUX/OP_Q
add wave -noupdate -divider -height 20 {Address2 MUX}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR2MUX/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR2MUX/OP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR2MUX/OP_C
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR2MUX/OP_D
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR2MUX/Sel
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ADDR2MUX/OP_Q
add wave -noupdate -divider -height 20 {Combinational Adder}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_Combinational_Adder/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_Combinational_Adder/OP_B
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_Combinational_Adder/OP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_Combinational_Adder/sOP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_Combinational_Adder/sOP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_Combinational_Adder/sOP_Q
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/sOP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/sOP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/sSel
add wave -noupdate /karki_datapath_all_tb/datap/Inst_ALU/sOP_Q
add wave -noupdate -divider -height 20 {MAR MUX}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_MARMUX/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst_MARMUX/OP_B
add wave -noupdate /karki_datapath_all_tb/datap/Inst_MARMUX/Sel
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst_MARMUX/OP_Q
add wave -noupdate -divider -height 20 {GATE MARMUX}
add wave -noupdate -divider INPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst11_Gate_MARMUX/OP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst11_Gate_MARMUX/Enable
add wave -noupdate -divider {TEST SIGNALS}
add wave -noupdate /karki_datapath_all_tb/datap/Inst11_Gate_MARMUX/sOP_A
add wave -noupdate /karki_datapath_all_tb/datap/Inst11_Gate_MARMUX/sEnable
add wave -noupdate /karki_datapath_all_tb/datap/Inst11_Gate_MARMUX/sOP_Q
add wave -noupdate -divider OUTPUTS
add wave -noupdate /karki_datapath_all_tb/datap/Inst11_Gate_MARMUX/OP_Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {42 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 376
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
WaveRestoreZoom {0 ps} {126 ps}
