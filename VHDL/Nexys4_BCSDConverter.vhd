library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Nexys4_BCSDConverter is
	Port(
		CLK			: in  STD_LOGIC;
		SWITCHES	: in  STD_LOGIC_VECTOR (15 downto 0);
		LEDS		: out STD_LOGIC_VECTOR (15 downto 0)
	);
end Nexys4_BCSDConverter;

architecture Behavioral of Nexys4_BCSDConverter is

	component BCSD_Row is
		Generic(
			n	: INTEGER := 16
		);
		Port(
			D	: in  STD_LOGIC_VECTOR (n-1 downto 0);
			Q	: out STD_LOGIC_VECTOR (n downto 0)
		);
	end component;
	
	signal q_int	:	STD_LOGIC_VECTOR (16 downto 0) := (others => '0');

begin

	uut: BCSD_Row generic map (16) port map (
		D	=> SWITCHES,
		Q	=> q_int
	);
	
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			LEDS <= q_int(15 downto 0);
		end if;
	end process;
	
end Behavioral;
