-- Design: Digital Systems (212/218/408/418)
-- Name: Hridweek Karki 
--	
-- Date: 04/01/2022
--
-- Description: Entity File Collection LC-3
-- For HW #6
-- Digital Design Lab/Lecture
--------------------------------------------------------------
--MAR
--RAM
--MDR
--Tristate Buffer
--PC
--1bit Register
--NZP
--16bit Register
--2to1 MUX
--3to1 MUX
--4to1 MUX
--8to16 ZEXT
--5to16 SEXT
--6to16 SEXT
--9to16 SEXT
--11to16 SEXT
--Comibnational Adder
--ALU
--Register Array
--FSM
--------------------------------------------------------------
--MAR
--------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Karki_MAR is
generic( P: integer:= 16;
	 MW: integer:=9);
port(   Clk: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
	BUS_IN: in std_logic_vector(P-1 downto 0);
	MAR_OUT: out std_logic_vector(MW-1 downto 0)
);
end Karki_MAR;

architecture Karki_MAR_arch of Karki_MAR is
signal MAR_DATA_OUT: std_logic_vector(MW-1 downto 0);

begin

MAR_REG: Process(Clk)
begin
	if (Clk = '1' AND Clk'EVENT) then
		if (RST = '1') then
			MAR_DATA_OUT <= (others=>'Z');
		elsif (EN = '1') then
			MAR_DATA_OUT <= BUS_IN(MW-1 downto 0);
		else
			MAR_DATA_OUT <= MAR_DATA_OUT;
		end if;
	else
		MAR_DATA_OUT <= MAR_DATA_OUT;
	end if;
end process;
MAR_OUT<=MAR_DATA_OUT;
end Karki_MAR_arch;

----------------------------------------------------------------------------
--RAM
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Karki_RAM is
generic(P: integer:=16;
	MW: integer:=9);
port(   CLK: in std_logic;
	mem_wr_rd_add: in std_logic_vector(MW-1 downto 0);
	Data_In: in std_logic_vector(P-1 downto 0);
	read_write_en: in std_logic;
	Data_Out: out std_logic_vector(P-1 downto 0);
	mem_en: in std_logic);
end Karki_RAM;

architecture Karki_RAM_arch of Karki_RAM is

type data_array is array (integer range<>) of std_logic_vector(P-1 downto 0);
signal data:data_array(0 to (2**MW-1)):= ("0010001000001001", "0001010001100101", "0001011001000010", "0101100011101001","1001101100111111", "1010110000000100", "0011011000001000", "1011010000000111", "0000000000000000", "0000000000000000", "0000000000001010", others => "XXXXXXXXXXXXXXXX");
signal SData_Out: std_logic_vector(P-1 downto 0);

begin
Memory: Process(Clk,read_write_en)
begin
	if (Clk'EVENT AND Clk = '1') then
		if (mem_en = '0') then
			SData_Out <= (Others=>'Z');
		elsif (read_write_en = '1') then
			data(conv_integer(mem_wr_rd_add))<= Data_In;
			SData_Out <= (Others=>'Z');
		elsif (read_write_en = '0') then
			SData_Out <= data(conv_integer(mem_wr_rd_add));
		end if;
	else
		SData_Out <= SData_Out;
		data <= data;
	end if;
Data_Out <=SData_Out;
end process Memory;
end Karki_RAM_arch;

--------------------------------------------------------------------------------------
--MDR
--------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_MDR is
generic(P: integer:= 16);
port(   Clk: in std_logic;
	EN: in std_logic;
	RST: in std_logic;
	BUS_IN: in std_logic_vector(P-1 downto 0);
	MEM_IN: in std_logic_vector(P-1 downto 0);
	MDR_OUT: out std_logic_vector(P-1 downto 0)
);
end Karki_MDR;

architecture Karki_MDR_arch of Karki_MDR is
signal MDR_DATA: std_logic_vector(P-1 downto 0);

begin

MDR_REG: Process(Clk)
begin
	if (Clk = '1' AND Clk'EVENT) then
		if (RST = '1') then
			MDR_DATA <= (others=>'Z');
		elsif (EN = '1') then
			MDR_DATA <= BUS_IN;
		elsif (EN = '0') then
			MDR_DATA <= MEM_IN;
		else
			MDR_DATA<=MDR_DATA;
		end if;
	else
		MDR_DATA <= MDR_DATA;
	end if;
end process;
MDR_OUT <= MDR_DATA;
END Karki_MDR_arch;

-------------------------------------------------------------------
--Tristate Buffer
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_Tristate_Buffer is
generic(P: integer:= 16);
port(OP_A: in std_logic_vector(P-1 downto 0);	
     Enable: in std_logic;
     OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_Tristate_Buffer;

architecture Karki_Tristate_arch of Karki_Tristate_Buffer is

SIGNAL sOP_A: std_logic_vector(P-1 downto 0);
SIGNAL sEnable: std_logic;
SIGNAL sOP_Q: std_logic_vector(P-1 downto 0);

begin
sOP_A <= OP_A;
sEnable <= Enable;
sOP_Q <= OP_A when (sEnable = '1') else
	 "ZZZZZZZZZZZZZZZZ";
OP_Q <=  sOP_Q;
end Karki_Tristate_arch;

-----------------------------------------------------------------------------------
--PC
-----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Karki_PC is
	generic(P: integer:=16);
	port(Clk: in std_logic;
	     EN: in std_logic;
	     RST: in std_logic;
	     OP_A: in std_logic_vector(P-1 downto 0);
	     OP_Q1: out std_logic_vector(P-1 downto 0);
	     OP_Q2: out std_logic_vector(P-1 downto 0)
);
end Karki_PC;

architecture Karki_PC_arch of Karki_PC is 

Signal PC_Data: std_logic_vector(P-1 downto 0);
Signal PC_Data_Plus: std_logic_vector(P-1 downto 0);

begin
Karki_PC_Process:Process(Clk)
begin
	if (Clk = '1' AND Clk'EVENT) then
		if (RST = '1') then
			PC_Data <= "0000000000000000";
			PC_Data_Plus <= "0000000000000001";
		elsif (EN = '1') then
			PC_Data <= OP_A;
			PC_Data_Plus <= OP_A + '1';	
		else
			PC_Data <= PC_Data;
			PC_Data_Plus <= PC_Data_Plus;
		end if;
	else
		PC_Data <= PC_Data;
			PC_Data_Plus <= PC_Data_Plus;
	end if;
end process;

OP_Q1 <= PC_Data;
OP_Q2 <= PC_Data_Plus;

end Karki_PC_arch;

---------------------------------------------------------------------------------
-- 1bit Register
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_Register_1 is
	port(Clk: in std_logic;
	     EN: in std_logic;
	     RST: in std_logic;
	     OP_A: in std_logic;
	     OP_Q: out std_logic
	);
end Karki_Register_1;

architecture Karki_Reg1_arch of Karki_Register_1 is
Signal S_D: std_logic;
begin
Karki_Reg:Process(Clk)
	begin
		if (Clk = '1' AND Clk'EVENT) then
			if (RST='1') then
				S_D <= '0';
			elsif (EN = '1') then
				S_D <= OP_A;
			else
				S_D <= S_D;
			end if;
		else
			S_D <= S_D;

		end if;
	end process Karki_Reg;
OP_Q <= S_D;

end Karki_Reg1_arch;

-----------------------------------------------------------------
--NZP Register---------------------------------------------------
-----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_NZP is
generic (P: integer:= 16;
	 N: integer:= 3);
port(Clk: in std_logic;
     EN: in std_logic;
     RST: in std_logic;
     OP_A: in std_logic_vector(P-1 downto 0);
     OP_Q: out std_logic_vector(N-1 downto 0)
);
end Karki_NZP;

architecture Karki_NZP_arch of Karki_NZP is
Signal S_D: std_logic_vector(2 downto 0);
begin
Karki_NZP_Process:Process(Clk)
	begin
		if (Clk = '1' AND Clk'EVENT) then
			if (RST='1') then
				S_D <= "000";
			elsif (EN = '1') then
				if (OP_A(15) = '1') then
					S_D <= "100";
				elsif (OP_A(14 downto 0)="000000000000000") then
					S_D <= "010";
				else
					S_D <= "001";	
				end if;	
			else
				S_D <= S_D;
			end if;
		else
			S_D <= S_D;

		end if;
	end process Karki_NZP_Process;
OP_Q <= S_D;

end Karki_NZP_arch;

--------------------------------------------------------------------------------
--16 bit Register---------------------------------------------------------------
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_Register_16 is
	generic(P: integer:=16);
	port(Clk: in std_logic;
	     EN: in std_logic;
	     RST: in std_logic;
	     OP_A: in std_logic_vector(P-1 downto 0);
	     OP_Q: out std_logic_vector(P-1 downto 0)
	);
end Karki_Register_16;

architecture Karki_Reg16_arch of Karki_Register_16 is
Signal S_D: std_logic_vector(P-1 downto 0);
begin
Karki_Reg16:Process(Clk)
	begin
		if (Clk = '1' AND Clk'EVENT) then
			if (RST='1') then
				S_D <= (OTHERS => '0');
			elsif (EN = '1') then
				S_D <= OP_A;
			else
				S_D <= S_D;
			end if;
		else
			S_D <= S_D;

		end if;
	end process Karki_Reg16;
OP_Q <= S_D;

end Karki_Reg16_arch;

-----------------------------------------------------------------------
--2to1 MUX-------------------------------------------------------------
-----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Karki_2to1_MUX is
generic(P: integer:= 16);
port( 
OP_A: in std_logic_vector(P-1 downto 0);
OP_B: in std_logic_vector(P-1 downto 0);
Sel: in std_logic;
OP_Q: out std_logic_vector(P-1 downto 0)
);

end Karki_2to1_MUX;

architecture Karki_cond_2to1_MUX of Karki_2to1_MUX is
begin
OP_Q <= OP_A when (Sel='0') else
	OP_B;
end Karki_cond_2to1_MUX;

------------------------------------------------------------------
--3to1 MUX--------------------------------------------------------
------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_3to1_MUX is
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector (P-1 downto 0);
	OP_B: in std_logic_vector (P-1 downto 0);
	OP_C: in std_logic_vector (P-1 downto 0);
	Sel : in std_logic_vector (1 downto 0);
	OP_Q: out std_logic_vector (P-1 downto 0)
);

end Karki_3to1_MUX;


architecture Karki_cond_3to1_MUX of Karki_3to1_MUX is
begin
OP_Q <= OP_A when (Sel="00") else
	OP_B when (Sel="01") else
	OP_C;
end Karki_cond_3to1_MUX;

----------------------------------------------------------------
--4to1 MUX------------------------------------------------------
----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_4to1_MUX is
	generic(P: integer:= 16);
	port(
	OP_A: in std_logic_vector (P-1 downto 0);
	OP_B: in std_logic_vector (P-1 downto 0);
	OP_C: in std_logic_vector (P-1 downto 0);
	OP_D: in std_logic_vector (P-1 downto 0);
	Sel : in std_logic_vector (1 downto 0);
	OP_Q: out std_logic_vector (P-1 downto 0)
);

end Karki_4to1_MUX;


architecture Karki_cond_4to1_MUX of Karki_4to1_MUX is
begin
OP_Q <= OP_A when (Sel="00") else
	OP_B when (Sel="01") else
	OP_C when (Sel="10") else
	OP_D;
end Karki_cond_4to1_MUX;

-----------------------------------------------------------------------
--8to16 ZEXT-----------------------------------------------------------
-----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_8to16_ZEXT is
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(7 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_8to16_ZEXT;

architecture Karki_8to16_arch of Karki_8to16_ZEXT is

SIGNAL sZEROS: std_logic_vector(7 downto 0):= (OTHERS => '0');
SIGNAL sQ: std_logic_vector(P-1 downto 0);

begin
	sQ <= sZEROS(7 downto 0) & OP_A(7 downto 0);

	OP_Q <= sQ;

end Karki_8to16_arch;

--5to16 SEXT------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_5to16_SEXT is
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(4 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_5to16_SEXT;

architecture Karki_5to16_arch of Karki_5to16_SEXT is

SIGNAL sONES: std_logic_vector(10 downto 0):= (OTHERS => '1');
SIGNAL sZEROS: std_logic_vector(10 downto 0):= (OTHERS => '0');
SIGNAL sQ: std_logic_vector(P-1 downto 0);

begin
	sQ <= sONES(10 downto 0) & OP_A(4 downto 0) when OP_A(4)='1' else
	      sZEROS(10 downto 0) & OP_A(4 downto 0);

	OP_Q <= sQ;

end Karki_5to16_arch;

--6to16 SEXT------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Karki_6to16_SEXT is
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(5 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_6to16_SEXT;

architecture Karki_6to16_arch of Karki_6to16_SEXT is

SIGNAL sONES: std_logic_vector(9 downto 0):= (OTHERS => '1');
SIGNAL sZEROS: std_logic_vector(9 downto 0):= (OTHERS => '0');
SIGNAL sQ: std_logic_vector(P-1 downto 0);

begin
	sQ <= sONES(9 downto 0) & OP_A(5 downto 0) when OP_A(5)='1' else
	      sZEROS(9 downto 0) & OP_A(5 downto 0);

	OP_Q <= sQ;

end Karki_6to16_arch;

--9to16 SEXT------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity Karki_9to16_SEXT is
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(8 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_9to16_SEXT;

architecture Karki_9to16_arch of Karki_9to16_SEXT is

SIGNAL sONES: std_logic_vector(6 downto 0):= (OTHERS => '1');
SIGNAL sZEROS: std_logic_vector(6 downto 0):= (OTHERS => '0');
SIGNAL sQ: std_logic_vector(P-1 downto 0);

begin
	sQ <= sONES(6 downto 0) & OP_A(8 downto 0) when OP_A(8)='1' else
	      sZEROS(6 downto 0) & OP_A(8 downto 0);

	OP_Q <= sQ;

end Karki_9to16_arch;

--11to16 SEXT-----------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Karki_11to16_SEXT is
	generic(P: integer:=16);
	port(
	OP_A: in std_logic_vector(10 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_11to16_SEXT;

architecture Karki_11to16_arch of Karki_11to16_SEXT is

SIGNAL sONES: std_logic_vector(4 downto 0):= (OTHERS => '1');
SIGNAL sZEROS: std_logic_vector(4 downto 0):= (OTHERS => '0');
SIGNAL sQ: std_logic_vector(P-1 downto 0);

begin
	sQ <= sONES(4 downto 0) & OP_A(10 downto 0) when OP_A(10)='1' else
	      sZEROS(4 downto 0) & OP_A(10 downto 0);

	OP_Q <= sQ;

end Karki_11to16_arch;

--Combinational Adder--------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Karki_Combinational_Adder is
generic(P: INTEGER:= 16);
port(OP_A: in std_logic_vector(P-1 downto 0);
     OP_B: in std_logic_vector(P-1 downto 0);
     OP_Q: out std_logic_vector(P-1 downto 0)
);
end Karki_Combinational_Adder;

architecture Karki_Combinational_Adder_arch of Karki_Combinational_Adder is

SIGNAL sOP_A: std_logic_vector(P-1 downto 0);
SIGNAL sOP_B: std_logic_vector(P-1 downto 0);
SIGNAL sOP_Q: std_logic_vector(P-1 downto 0);

begin

sOP_A <= OP_A;
sOP_B <= OP_B;

sOP_Q <= sOP_A + sOP_B;
OP_Q <= sOP_Q;

end Karki_Combinational_Adder_arch;

--ALU---------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Karki_ALU is
	generic(P: integer:= 16);
	port(OP_A: in std_logic_vector(P-1 downto 0);
	     OP_B: in std_logic_vector(P-1 downto 0);
	     Sel: in std_logic_vector(1 downto 0);
	     OP_Q: out std_logic_vector(P-1 downto 0)
	);
end Karki_ALU;

architecture Karki_ALU_arch of Karki_ALU is

SIGNAL sOP_A: std_logic_vector(P-1 downto 0);
SIGNAL sOP_B: std_logic_vector(P-1 downto 0);
SIGNAL sSel: std_logic_vector(1 downto 0);
SIGNAL sOP_Q: std_logic_vector(P-1 downto 0);

begin

sOP_A <= OP_A;
sOP_B <= OP_B;
sSel <= Sel;

WITH sSel SELECT
sOP_Q <= sOP_A + sOP_B when "00",
	 sOP_A - sOP_B when "01",
	 sOP_A AND sOP_B when "10",
	 NOT(sOP_A) when others;

OP_Q <= sOP_Q;

end Karki_ALU_arch;

--Register Array-------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Karki_Regs is
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
end Karki_Regs;

architecture Karki_Reg_Array of Karki_Regs is

type reg_array is array(7 downto 0) of std_logic_vector(15 downto 0);
signal sEN: std_logic_vector(7 downto 0);

signal sFF:reg_array;

component Karki_Register_16
port(   Clk: in std_logic;
	RST: in std_logic;
	EN: in std_logic;
	OP_A: in std_logic_vector(P-1 downto 0);
	OP_Q: out std_logic_vector(P-1 downto 0)
);
end component;

begin
p1:Process(DR,LD_Reg)
begin
	sEN <=(sEN'range=>'0');
	sEN(to_integer(unsigned(DR))) <= LD_Reg;
end process;

g0:for j in 0 to 7 generate
	reg:Karki_Register_16
	port map(Clk,RST,sEN(j),OP_A,sFF(j));
end generate;

OP_Q1<=sFF(to_integer(unsigned(SR1)));
OP_Q2<=sFF(to_integer(unsigned(SR2)));

end Karki_Reg_Array;

----------------------------------------------------------------------------------------------
--FSM
----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Karki_FSM is
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
end Karki_FSM;

architecture Karki_FSM_arch of Karki_FSM is

type LC3_STATE_TYPE is (S0,F0,F1,F2,F3,F4,F5,D1,OP1,LD1,LD2,LD3,LD4,LDI1,LDI2,LDI3,ST1,ST2,ST3,ST4,STI1,STI2,STI3);
signal cpu_state: LC3_STATE_TYPE;
signal next_state: LC3_STATE_TYPE;

constant ADD: std_logic_vector(3 downto 0):= "0001";
constant ANDL: std_logic_vector(3 downto 0):= "0101";
constant BR: std_logic_vector(3 downto 0):= "0000";
constant JMP: std_logic_vector(3 downto 0):= "1100";
constant JSR: std_logic_vector(3 downto 0):= "0100";
constant LD: std_logic_vector(3 downto 0):= "0010";
constant LDI: std_logic_vector(3 downto 0):= "1010";
constant LDR: std_logic_vector(3 downto 0):= "0110";
constant LEA: std_logic_vector(3 downto 0):= "1110";
constant NOTL: std_logic_vector(3 downto 0):= "1001";
constant RTI: std_logic_vector(3 downto 0):= "1000";
constant ST: std_logic_vector(3 downto 0):= "0011";
constant STI: std_logic_vector(3 downto 0):="1011";
constant STR: std_logic_vector(3 downto 0):= "0111";
constant TRAP: std_logic_vector(3 downto 0):= "1111";

begin

nextstatelogic: process(Clk)
begin
	if (Clk'event and Clk='1') then
		if (RESET = '1') then
			cpu_state <= S0;
		else
			cpu_state <= next_state;
		end if;
	end if;
end process;

FSM: process(IR_OUT, NZP_OUT, cpu_state, next_state)

variable OPCODE: std_logic_vector(3 downto 0);
variable PC_OFFSET: std_logic_vector(10 downto 0);
variable SR1_IN: std_logic_vector(2 downto 0);
variable SR2_IN: std_logic_vector(2 downto 0);
variable DR_IN: std_logic_vector(2 downto 0);
variable IR_5: std_logic;
variable Imm5: std_logic_vector(4 downto 0);
variable BaseReg: std_logic_vector(2 downto 0);

begin
case cpu_state is
	when S0=>
		MAR_EN <= '0';
		MEM_EN <= '0';
		MDR_EN <= '0';
		LD_PC <= '0';
		LD_PCMUX <= (OTHERS => '0');
		READ_WRITE_EN <= '0';
		GATE_PC <= '0';
		GATE_MDR <= '0';
		GATE_MARMUX <= '0';
		GATE_ALU <= '0';
		LD_IR <= '0';
		LD_NZP <= '0';
		LD_MM <= '0';
		LD_REG <= '0';
		LD_ADDR1MUX <= '0';
		LD_ADDR2MUX <= (OTHERS => '0');
		LD_DR <= (OTHERS => '0');
		LD_SR2MUX <= '0';
		LD_ALU <= (OTHERS => '0');
		SR1<= (OTHERS => '0');
		SR2<= (OTHERS => '0');
	
		next_state <= F1;

--Fetch
	when F0 =>
		LD_PCMUX <= "10";
		LD_PC <= '1';
		
		next_state <= F1;

	when F1 =>
		LD_PC <= '0';
		GATE_PC <= '1';
		MAR_EN <= '1';

		GATE_MDR <= '0';
		GATE_ALU <= '0';
		GATE_MARMUX <= '0';

		LD_PCMUX <= "10";
		MEM_EN <= '0';
		MDR_EN <= '0';

		next_state <= F2;

	when F2 =>
		LD_PC <= '0';
		GATE_PC <= '0';
		MAR_EN <= '0';

		MEM_EN <= '1';
		READ_WRITE_EN <= '0';
		
		next_state <= F3;

	when F3 =>
		MEM_EN <= '0';
		MDR_EN <= '0';
		GATE_MDR <= '0';

		next_state <= F4;

	when F4 =>
		GATE_MDR <= '1';
		LD_IR <= '1';
		LD_NZP <= '1';

		next_state <= F5;

	when F5 =>
		GATE_MDR <= '0';
		LD_IR <= '0';
		LD_NZP <= '0';

		next_state <= D1;

--Decode

	when D1 =>
		OPCODE:= IR_OUT(15 downto 12);
		IR_5:= IR_OUT(5);
		DR_IN:= IR_OUT(11 downto 9);
		SR1_IN:= IR_OUT(8 downto 6);
		SR2_IN:= IR_OUT(2 downto 0);
		PC_OFFSET:= IR_OUT(10 downto 0);
		Imm5:= IR_OUT(4 downto 0);
		BaseReg:= IR_OUT(8 downto 6);

		case OPCODE is  --nested case
			when ADD =>
				if(IR_5<='0') then
					LD_IR <= '0';
					LD_NZP <= '1';
					LD_REG <= '1';
					GATE_MDR <= '0';
					
					LD_DR <= DR_IN;
					SR1 <= SR1_IN;
					SR2 <= SR2_IN;
					LD_ALU <= "00";
					LD_SR2MUX <= '0';
					GATE_ALU <= '1';
					LD_REG <= '1';

					next_state <= OP1;
				else
					LD_IR <= '0';
					LD_NZP <= '1';
					LD_REG <= '1';
					GATE_MDR <= '0';
					
					LD_DR <= DR_IN;
					SR1 <= SR1_IN;
					LD_ALU <= "00";
					LD_SR2MUX <= '1';
					GATE_ALU <= '1';
					LD_REG <= '1';

					next_state <= OP1;
				end if;


			when ANDL =>
				if(IR_5<='0') then
					LD_IR <= '0';
					LD_NZP <= '1';
					LD_REG <= '1';
					GATE_MDR <= '0';
					
					LD_DR <= DR_IN;
					SR1 <= SR1_IN;
					SR2 <= SR2_IN;
					LD_ALU <= "10";
					LD_SR2MUX <= '0';
					GATE_ALU <= '1';
					LD_REG <= '1';

					next_state <= OP1;
				else
					LD_IR <= '0';
					LD_NZP <= '1';
					LD_REG <= '1';
					GATE_MDR <= '0';
					
					LD_DR <= DR_IN;
					SR1 <= SR1_IN;
					LD_ALU <= "10";
					LD_SR2MUX <= '1';
					GATE_ALU <= '1';
					LD_REG <= '1';

					next_state <= OP1;
				end if;

			when NOTL =>
				LD_IR <= '0';
				LD_NZP <= '1';
				LD_REG <=  '1';
				GATE_MDR <= '0';

				LD_DR <= DR_IN;
				SR1 <= SR1_IN;
				LD_ALU <= "11";
				GATE_ALU <= '1';
				LD_REG <= '1';
			
				next_state <= OP1;
					

			when LD =>
				LD_IR <= '0';
				LD_NZP <= '0';
				LD_PC <= '0';
				GATE_MDR <= '0';
				GATE_ALU <= '0';
				GATE_PC <= '0';

				LD_ADDR1MUX <= '0';
				LD_ADDR2MUX <= "10";
				LD_MM <= '0';
				GATE_MARMUX <= '1';

				MAR_EN <= '1';
				MEM_EN <= '0';
				MDR_EN <= '0';
	
				next_state <= LD1;

			when LDI =>
				LD_IR <= '0';
				LD_NZP <= '0';
				LD_PC <= '0';
				GATE_MDR <= '0';
				GATE_ALU <= '0';
				GATE_PC <= '0';

				LD_ADDR1MUX <= '0';
				LD_ADDR2MUX <= "10";
				LD_MM <= '0';
				GATE_MARMUX <= '1';

				MAR_EN <= '1';
				MEM_EN <= '0';
				MDR_EN <= '0';
	
				next_state <= LDI1;
				
			when ST =>
				LD_IR <= '0';
				LD_NZP <= '1';
				LD_PC <= '0';
				GATE_MDR <= '0';
				GATE_PC <= '0';
				GATE_ALU <= '0';

				SR1 <= DR_IN;
				LD_SR2MUX <= '0';
				LD_ALU <= "00";
				GATE_ALU <= '0';
				LD_ADDR1MUX <= '0';
				LD_ADDR2MUX <= "10";
				LD_MM <= '0';
				GATE_MARMUX <= '1';

				MAR_EN <= '1';
				MEM_EN <= '0';
				MDR_EN <= '0';
	
				next_state <= ST1;

			when STI =>
				LD_IR <= '0';
				LD_NZP <= '1';
				LD_PC <= '0';
				GATE_MDR <= '0';
				GATE_PC <= '0';
				GATE_ALU <= '0';

				SR1 <= DR_IN;
				LD_SR2MUX <= '0';
				LD_ALU <= "00";
				GATE_ALU <= '0';
				LD_ADDR1MUX <= '0';
				LD_ADDR2MUX <= "10";
				LD_MM <= '0';
				GATE_MARMUX <= '1';

				MAR_EN <= '1';
				MEM_EN <= '0';
				MDR_EN <= '0';
	
				next_state <= STI1;		

			when others =>
				next_state <= S0;

		end case;
				

	when OP1 =>
		LD_REG <= '0';
		LD_NZP <= '0';
		GATE_ALU <= '0';
		
		next_state <= F0;

	when LD1 =>
		GATE_MARMUX <= '0';
		MAR_EN <= '0';

		MEM_EN <= '1';
		READ_WRITE_EN <= '0';
		MDR_EN <= '0';

		next_state <= LD2;

	when LD2 =>
		MEM_EN <= '0';
		MDR_EN <= '0';
		GATE_MDR <= '0';

		next_state <= LD3;

	when LD3 =>
		GATE_MDR <= '1';
		LD_NZP <= '1';
		LD_REG <= '1';
		LD_DR <= DR_IN;

		next_state <= LD4;

	when LD4 =>
		GATE_MDR <= '0';
		LD_NZP <= '1';
		LD_REG <= '0';

		next_state <= F0;

	when LDI1 =>
		GATE_MARMUX <= '0';
		MAR_EN <= '0';

		MEM_EN <= '1';
		READ_WRITE_EN <= '0';
		MDR_EN <= '0';

		next_state <= LDI2;

	when LDI2 =>
		MEM_EN <= '0';
		MDR_EN <= '0';
		GATE_MDR <= '0';

		next_state <= LDI3;

	when LDI3 =>
		GATE_MDR <= '1';
		LD_REG <= '0';
		MAR_EN <= '1';

		next_state <= LD1;

	when ST1 =>
		GATE_MARMUX <= '0';
		GATE_MDR <= '0';
		LD_NZP <= '0';
		MAR_EN <= '0';

		MEM_EN <= '0';
		READ_WRITE_EN <= '1';
		MDR_EN <= '0';

		SR1 <= DR_IN;
		LD_SR2MUX <= '0';
		LD_ADDR1MUX <= '1';
		LD_ADDR2MUX <= "00";
		LD_MM <= '0';
		
		next_state <= ST2;

	when ST2 =>
		GATE_MARMUX <= '1';
		MAR_EN <= '0';
		LD_NZP <= '1';
		GATE_ALU <= '0';
		MEM_EN <= '0';
		MDR_EN <= '1';

		next_state <= ST3;

	when ST3 =>
		MEM_EN <= '1';
		READ_WRITE_EN <= '1';
		MDR_EN <= '0';

		next_state <= ST4;

	when ST4 =>
		MEM_EN <= '0';
		READ_WRITE_EN <= '0';
		
		next_state <= F0;
	when STI1 =>
		GATE_MARMUX <= '0';
		LD_NZP <= '0';
		MAR_EN <= '0';
		GATE_ALU <= '0';

		MEM_EN <= '1';
		READ_WRITE_EN <= '0';
		MDR_EN <= '0';

		next_state <= STI2;

	when STI2 =>
		MEM_EN <= '0';
		MDR_EN <= '0';
		GATE_MDR <= '0';
		
		next_state <= STI3;

	when STI3 =>
		GATE_MDR <= '1';
		MAR_EN <= '1';
		LD_NZP <= '0';

		next_state <= ST1;
end case;
end process;
end Karki_FSM_arch;
