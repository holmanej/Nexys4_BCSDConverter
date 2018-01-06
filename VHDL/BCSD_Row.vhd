library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCSD_Row is
	Generic(
		n	: INTEGER := 8
	);
	Port(
		D	: in  STD_LOGIC_VECTOR (n-1 downto 0);
		Q	: out STD_LOGIC_VECTOR (n downto 0)
	);
end BCSD_Row;

architecture Behavioral of BCSD_Row is

	component BCSD_Unit is
		Port(
			A_0		: in  STD_LOGIC;
			A_1		: in  STD_LOGIC;
			S_1		: in  STD_LOGIC;
			C_in	: in  STD_LOGIC;
			A_sum	: out STD_LOGIC;
			C_out	: out STD_LOGIC
		);
	end component;
	
	signal	c_int	:	STD_LOGIC_VECTOR (n downto 0);
	signal	a_int	:	STD_LOGIC_VECTOR (n downto 0);
	signal	d_int	:	STD_LOGIC_VECTOR (n downto 0);

begin

	d_int <= '0' & D;
	a_int(0) <= D(0);
	c_int(0) <= '0';
	Q <= a_int;

	RowGen: for i in 1 to n generate
		UnitGen: BCSD_Unit port map (
			A_0		=> d_int(i),
			A_1		=> a_int(i-1),
			S_1		=> d_int(i-1),
			C_in	=> c_int(i-1),
			C_out	=> c_int(i),
			A_sum	=> a_int(i)
		);
	end generate;

end Behavioral;
