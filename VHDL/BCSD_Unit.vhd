library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCSD_Unit is
	Port(
		A_0		: in  STD_LOGIC;
		A_1		: in  STD_LOGIC;
		S_1		: in  STD_LOGIC;
		C_in	: in  STD_LOGIC;
		A_sum	: out STD_LOGIC;
		C_out	: out STD_LOGIC
	);
end BCSD_Unit;

architecture Behavioral of BCSD_Unit is

begin

	C_out <= A_0 and (A_1 or S_1);
	A_sum <= A_0 xor C_in;

end Behavioral;
