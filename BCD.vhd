library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD is
	PORT(	DATA: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			SEG: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end BCD;

architecture Behavioral of BCD is

begin

	WITH DATA SELECT SEG <=
		"00000011" WHEN "0000",
		"10011111" WHEN "0001",
		"00100101" WHEN "0010",
		"00001101" WHEN "0011",
		"10011001" WHEN "0100",
		"01001001" WHEN "0101",
		"01000001" WHEN "0110",
		"00011111" WHEN "0111",
		"00000001" WHEN "1000",
		"00001001" WHEN "1001",
		"00000011" WHEN "1010",
--		"11000001" WHEN "1011",
--		"01100011" WHEN "1100",
--		"10000101" WHEN "1101",
--		"01100001" WHEN "1110",
--		"01110001" WHEN "1111",
		"11111111" WHEN OTHERS;

end Behavioral;

