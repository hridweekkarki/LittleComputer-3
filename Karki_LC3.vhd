--Design for Advanced Digital Systems
--
--Name: Hridweek Karki
--Date: 02/11/2022
--Homework #6
--Design: Datapath
----------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Karki_Datapath is
generic(P: integer:= 16;
	MW: integer:= 9;
	N: integer:= 3);
port(   Clk: in std_logic;
	RESET: in std_logic);
end Karki_Datapath;

architecture Karki_Datapath_Arch of Karki_Datapath is

------------------
--COMPONENTS
-----------------

component Karki_FSM
generic(P: integer:= 16;
	N: integer:= 3);
port(   Clk: in std_logic;
	RESET: in std_logic;
	IR_OUT: in std_logic_vector(P-1 downto 0);
	NZP_OUT: in std_logic_vector(N-1 downto 0);
	MAR_EN: out std_logic;
	MDR_EN: out std_logic;
	MEM_EN: out std_logic;
	LD_PC: out std_logic;
	LD_PCMUX: out std_logic_vector(1 downto 0);
	READ_WRITE_EN: out std_logic;
	GATE_MDR: out std_logic;
	GATE_PC: out std_logic;
	GATE_MARMUX: out std_logic;
	GATE_ALU: out std_logic;
	LD_IR: out std_logic;
	LD_NZP: out std_logic;
	LD_REG: out std_logic;
	LD_MM: out std_logic;
	LD_ADDR1MUX: out std_logic;
	LD_ADDR2MUX: out std_logic_vector(1 downto 0);
	LD_DR: out std_logic_vector(N-1 downto 0);
	LD_SR2MUX: out std_logic;
	LD_ALU: out std_logic_vector(1 downto 0);
	SR1: out std_logic_vector(N-1 downto 0);
	SR2: out std_logic_vector(N-1 downto 0));
end component;

component Karki_MAR
generic( P: integer:= 16;
	 MW: integer:=9);
port(   Clk: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
	BUS_IN: in std_logic_vector(P-1 downto 0);
	MAR_OUT: out std_logic_vector(MW-1 downto 0)
);
end component;

component Karki_MDR
generic(P: integer:= 16);
port(   Clk: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
	BUS_IN: in std_logic_vector(P-1 downto 0);
	MEM_IN: in std_logic_vector(P-1 downto 0);
	MDR_OUT: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_RAM
generic(P: integer:=16;
	MW: integer:=9);
port(   CLK: in std_logic;
	mem_wr_rd_add: in std_logic_vector(MW-1 downto 0);
	Data_In: in std_logic_vector(P-1 downto 0);
	read_write_en: in std_logic;
	Data_Out: out std_logic_vector(P-1 downto 0);
	mem_en: in std_logic);
end component;

component Karki_Tristate_Buffer
generic(P: integer:= 16);
port(OP_A: in std_logic_vector(P-1 downto 0);	
     Enable: in std_logic;
     OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_PC
generic(P: integer:=16);
	port(Clk: in std_logic;
	     EN: in std_logic;
	     RST: in std_logic;
	     OP_A: in std_logic_vector(P-1 downto 0);
	     OP_Q1: out std_logic_vector(P-1 downto 0);
	     OP_Q2: out std_logic_vector(P-1 downto 0));
end component;

component Karki_2to1_MUX
generic(P: integer:= 16);
port( 
OP_A: in std_logic_vector(P-1 downto 0);
OP_B: in std_logic_vector(P-1 downto 0);
Sel: in std_logic;
OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_3to1_MUX
generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector (P-1 downto 0);
	OP_B: in std_logic_vector (P-1 downto 0);
	OP_C: in std_logic_vector (P-1 downto 0);
	Sel : in std_logic_vector (1 downto 0);
	OP_Q: out std_logic_vector (P-1 downto 0)
);
end component;

component Karki_4to1_MUX
	generic(P: integer:= 16);
	port(
	OP_A: in std_logic_vector (P-1 downto 0);
	OP_B: in std_logic_vector (P-1 downto 0);
	OP_C: in std_logic_vector (P-1 downto 0);
	OP_D: in std_logic_vector (P-1 downto 0);
	Sel : in std_logic_vector (1 downto 0);
	OP_Q: out std_logic_vector (P-1 downto 0)
);
end component;

component Karki_8to16_ZEXT
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(7 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_5to16_SEXT
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(4 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_6to16_SEXT
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(5 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_9to16_SEXT
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(8 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_11to16_SEXT
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(10 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_ALU
	generic(P: integer:= 16);
	port(OP_A: in std_logic_vector(P-1 downto 0);
	     OP_B: in std_logic_vector(P-1 downto 0);
	     Sel: in std_logic_vector(1 downto 0);
	     OP_Q: out std_logic_vector(P-1 downto 0)
	);
end component;

component Karki_Combinational_Adder 
generic(P: INTEGER:= 16);
port(OP_A: in std_logic_vector(P-1 downto 0);
     OP_B: in std_logic_vector(P-1 downto 0);
     OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

component Karki_Register_16
generic(P: integer:=16);
port(   Clk: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
        OP_A: in std_logic_vector(P-1 downto 0);
        OP_Q: out std_logic_vector(P-1 downto 0)
	);
end component;

component Karki_NZP
generic(P: integer:= 16;
	N: integer:= 3);
port(Clk: in std_logic;
     EN: in std_logic;
     RST: in std_logic;
     OP_A: in std_logic_vector(P-1 downto 0);
     OP_Q: out std_logic_vector(N-1 downto 0)
);
end component;

component Karki_Regs
generic (P: integer:= 16;
	 N: integer:= 3); 
port(   Clk: in std_logic;
	RST: in std_logic;
	LD_Reg: in std_logic;
	OP_A: in std_logic_vector(P-1 downto 0);
	DR: in std_logic_vector(N-1 downto 0);
	SR1: in std_logic_vector(N-1 downto 0);
	SR2: in std_logic_vector(N-1 downto 0);
	OP_Q1: out std_logic_vector(P-1 downto 0);
	OP_Q2: out std_logic_vector(P-1 downto 0)
);
end component;

---------
--SIGNALS
---------
SIGNAL MAR_EN: std_logic;
SIGNAL MDR_EN: std_logic;
SIGNAL MEM_EN: std_logic;
SIGNAL LD_PC: std_logic;
SIGNAL LD_PCMUX: std_logic_vector(1 downto 0);
SIGNAL READ_WRITE_EN: std_logic;
SIGNAL GATE_MDR: std_logic;
SIGNAL GATE_PC: std_logic;
SIGNAL GATE_MARMUX: std_logic;
SIGNAL GATE_ALU: std_logic;
SIGNAL LD_IR: std_logic;
SIGNAL LD_NZP: std_logic;
SIGNAL LD_REG: std_logic;
SIGNAL LD_MM: std_logic;
SIGNAL LD_ADDR1MUX:  std_logic;
SIGNAL LD_ADDR2MUX: std_logic_vector(1 downto 0);
SIGNAL LD_DR: std_logic_vector(N-1 downto 0);
SIGNAL LD_SR2MUX: std_logic;
SIGNAL LD_ALU: std_logic_vector(1 downto 0);
SIGNAL SR1: std_logic_vector(N-1 downto 0);
SIGNAL SR2: std_logic_vector(N-1 downto 0);

SIGNAL S_MAR_OUT: std_logic_vector(MW-1 downto 0);
SIGNAL S_MDR_BUS: std_logic_vector(P-1 downto 0);
SIGNAL S_MEM_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_PC_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_PC_PLUS: std_logic_vector(P-1 downto 0);
SIGNAL S_PCMUX_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_BUS: std_logic_vector(P-1 downto 0);
SIGNAL S_C_ADDER_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_IR_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_NZP_OUT: std_logic_vector(N-1 downto 0);
SIGNAL S_SR1_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_SR2_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_8to16_ZEXT: std_logic_vector(P-1 downto 0);
SIGNAL S_5to16_SEXT: std_logic_vector(P-1 downto 0);
SIGNAL S_6to16_SEXT: std_logic_vector(P-1 downto 0);
SIGNAL S_9to16_SEXT: std_logic_vector(P-1 downto 0);
SIGNAL S_11to16_SEXT: std_logic_vector(P-1 downto 0);
SIGNAL S_ADDR1MUX_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_ADDR2MUX_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_SR2MUX_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_MARMUX_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_ALU_OUT: std_logic_vector(P-1 downto 0);
SIGNAL S_ZERO: std_logic_vector(P-1 downto 0):=(OTHERS => '0');

-----------------
--INSTANTIATIONS
-----------------
begin

Inst_FSM: Karki_FSM generic map(P, N) port map(Clk, RESET, S_IR_OUT, S_NZP_OUT, MAR_EN, MDR_EN, MEM_EN, LD_PC, LD_PCMUX, READ_WRITE_EN, GATE_MDR, GATE_PC, GATE_MARMUX, GATE_ALU, LD_IR, LD_NZP, LD_REG, LD_MM, LD_ADDR1MUX, LD_ADDR2MUX, LD_DR, LD_SR2MUX, LD_ALU, SR1, SR2); 
Inst1_MAR: Karki_MAR generic map(P, MW) port map(Clk, MAR_EN, RESET, S_BUS, S_MAR_OUT);
Inst2_RAM: Karki_RAM generic map(P, MW) port map(Clk, S_MAR_OUT, S_MDR_BUS, READ_WRITE_EN, S_MEM_OUT, MEM_EN);
Inst3_MDR: Karki_MDR generic map(P) port map(Clk, MDR_EN, RESET, S_BUS, S_MEM_OUT, S_MDR_BUS);
Inst4_Gate_MDR: Karki_Tristate_Buffer generic map(P) port map(S_MDR_BUS, GATE_MDR, S_BUS);
Inst5_Gate_PC: Karki_Tristate_Buffer generic map(P) port map(S_PC_OUT, GATE_PC, S_BUS);
Inst6_PC: Karki_PC generic map(P) port map(Clk, LD_PC, RESET, S_PCMUX_OUT, S_PC_OUT, S_PC_PLUS);
Inst7_PCMUX: Karki_3to1_MUX generic map(P) port map(S_BUS, S_C_ADDER_OUT, S_PC_PLUS, LD_PCMUX,S_PCMUX_OUT);
Inst8_IR: Karki_Register_16 generic map(P) port map(Clk, LD_IR, RESET, S_BUS, S_IR_OUT);
Inst9_NZP: Karki_NZP generic map(P, N) port map(Clk, LD_NZP, RESET, S_BUS, S_NZP_OUT);
Inst10_Reg_Array: Karki_Regs generic map(P, N) port map(Clk, RESET, LD_REG, S_BUS, LD_DR, SR1, SR2, S_SR1_OUT, S_SR2_OUT);
Inst_SEXT_5to16: Karki_5to16_SEXT generic map(P) port map(S_IR_OUT(4 downto 0), S_5to16_SEXT);
Inst_SEXT_6to16: Karki_6to16_SEXT generic map(P) port map(S_IR_OUT(5 downto 0), S_6to16_SEXT);
Inst_SEXT_9to16: Karki_9to16_SEXT generic map(P) port map(S_IR_OUT(8 downto 0), S_9to16_SEXT);
Inst_SEXT_11to16: Karki_11to16_SEXT generic map(P) port map(S_IR_OUT(10 downto 0), S_11to16_SEXT);
Inst_ZEXT_8to16: Karki_8to16_ZEXT generic map(P) port map(S_IR_OUT(7 downto 0), S_8to16_ZEXT);
Inst_ADDR2MUX: Karki_4to1_MUX generic map(P) port map(S_ZERO, S_6to16_SEXT, S_9to16_SEXT, S_11to16_SEXT, LD_ADDR2MUX, S_ADDR2MUX_OUT);
Inst_ADDR1MUX: Karki_2to1_MUX generic map(P) port map(S_PC_PLUS, S_SR1_OUT, LD_ADDR1MUX, S_ADDR1MUX_OUT);
Inst_SR2MUX: Karki_2to1_MUX generic map(P) port map(S_SR2_OUT, S_5to16_SEXT, LD_SR2MUX, S_SR2MUX_OUT);
Inst_ALU: Karki_ALU generic map(P) port map(S_SR1_OUT, S_SR2MUX_OUT, LD_ALU, S_ALU_OUT); 
Inst_Combinational_Adder: Karki_Combinational_Adder generic map(P) port map(S_ADDR1MUX_OUT, S_ADDR2MUX_OUT, S_C_ADDER_OUT);
Inst_MARMUX: Karki_2to1_MUX generic map(P) port map(S_C_ADDER_OUT, S_8to16_ZEXT, LD_MM, S_MARMUX_OUT);
Inst11_Gate_MARMUX: Karki_Tristate_Buffer generic map(P) port map(S_MARMUX_OUT, GATE_MARMUX, S_BUS);
Inst12_Gate_ALU: Karki_Tristate_Buffer generic map(P) port map(S_ALU_OUT, GATE_ALU, S_BUS);

end Karki_Datapath_Arch;



