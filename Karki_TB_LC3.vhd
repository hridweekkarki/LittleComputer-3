------------------------------------------------------------
--File Name:		LC3_Data_Path_ALL_tb_Karki.vhd
--VHDL Source File:	A very simple test bench
--Comments: 		Behavioral testbench description
--Advanced Digital Design
--Spring 2022
-----------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity KARKI_DATAPATH_ALL_TB is
end KARKI_DATAPATH_ALL_TB;


architecture TB1 of KARKI_DATAPATH_ALL_TB is

component Karki_Datapath is
port (
	CLK: in std_logic;  
	RESET: in std_logic
     );
end component Karki_Datapath;

signal	CLKtb		: std_logic; 				
signal	RSTntb	: std_logic;				

begin

CLK_GEN: process 
begin 
while now <= 300 ns loop 
CLKtb <='0'; wait for 5 ps; CLKtb <='1'; wait for 5 ps; 
end loop; 
wait; 
end process; 

Reset: process
begin
RSTntb  <='1','0' after 10 ps;
wait;
end process;


--------------------------------------do not change-----------------------------------------------
datap: Karki_Datapath port map ( CLK=>CLKtb, RESET=>RSTntb);

end TB1;
--------------------------------------change the names to match your TB/Component-----
configuration CFG_KARKI_DATAPATH_ALL_TB of KARKI_DATAPATH_ALL_TB is
	for TB1
	end for;
end CFG_KARKI_DATAPATH_ALL_TB;
