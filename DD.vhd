library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DD is
	PORT(	D_IN: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			DD_OUT: OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
end DD;

architecture Behavioral of DD is

	COMPONENT DD_SUM is
		PORT(	D_IN	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				D_OUT	: OUT STD_lOGIC_VECTOR(3 DOWNTO 0)
		);
	end COMPONENT;
	
	SIGNAL U0_OUT, U1_OUT, U2_OUT, U3_OUT, U4_OUT, U5_OUT, U6_OUT: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL DD_IN_0, DD_IN_1, DD_IN_2, DD_IN_3, DD_IN_4, DD_IN_5, DD_IN_6: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	SIGNAL NIBBLE_2, NIBBLE_1, NIBBLE_0: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

begin

	DD_IN_0 <= '0' & D_IN(7 DOWNTO 5);
	DD_IN_1 <= U0_OUT(2 DOWNTO 0) & D_IN(4);
	DD_IN_2 <= U1_OUT(2 DOWNTO 0) & D_IN(3);
	DD_IN_3 <= U2_OUT(2 DOWNTO 0) & D_IN(2);
	DD_IN_4 <= U3_OUT(2 DOWNTO 0) & D_IN(1);
	DD_IN_5 <= '0' & U0_OUT(3) & U1_OUT(3) & U2_OUT(3);
	DD_IN_6 <= U5_OUT(2 DOWNTO 0) & U3_OUT(3);

	U0: DD_SUM PORT MAP(
		D_IN => DD_IN_0,
		D_OUT => U0_OUT
	);

	U1: DD_SUM PORT MAP(
		D_IN => DD_IN_1,
		D_OUT => U1_OUT
	);
	
	U2: DD_SUM PORT MAP(
		D_IN => DD_IN_2,
		D_OUT => U2_OUT
	);
	
	U3: DD_SUM PORT MAP(
		D_IN => DD_IN_3,
		D_OUT => U3_OUT
	);
	
	U4: DD_SUM PORT MAP(
		D_IN => DD_IN_4,
		D_OUT => U4_OUT
	);
	
	U5: DD_SUM PORT MAP(
		D_IN => DD_IN_5,
		D_OUT => U5_OUT
	);
	
	U6: DD_SUM PORT MAP(
		D_IN => DD_IN_6,
		D_OUT => U6_OUT
	);
	
	NIBBLE_2 <= "00" & U5_OUT(3) & U6_OUT(3);
	NIBBLE_1 <= U6_OUT(2 DOWNTO 0) & U4_OUT(3);
	NIBBLE_0 <= U4_OUT(2 DOWNTO 0) & D_IN(0);
	
	DD_OUT <= NIBBLE_2 & NIBBLE_1 & NIBBLE_0;
	
end Behavioral;

