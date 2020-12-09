library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DD_SUM is
	PORT(	D_IN	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			D_OUT	: OUT STD_lOGIC_VECTOR(3 DOWNTO 0)
	);
end DD_SUM;

architecture Behavioral of DD_SUM is

	SIGNAL A, B, C, D: STD_LOGIC := '0';

begin
	
	A <= D_IN(3);
	B <= D_IN(2);
	C <= D_IN(1);
	D <= D_IN(0);
	
	D_OUT(3) <= A OR (B AND (D OR C));
	D_OUT(2) <= (A AND (D OR C)) OR (B AND (NOT C) AND (NOT D));
--	D_OUT(1) <= (C AND D) OR (A AND B) OR (A AND (NOT B) AND (NOT C) AND NOT D) OR ((NOT A) AND (NOT B) AND C AND (NOT D));
	D_OUT(1) <= (C AND D) OR (A AND B) OR ((NOT B) AND (NOT D) AND (A XOR C));
	D_OUT(0) <= (A AND (NOT D)) OR (B AND C AND (NOT D)) OR ((NOT A) AND (NOT B) AND D);

end Behavioral;

