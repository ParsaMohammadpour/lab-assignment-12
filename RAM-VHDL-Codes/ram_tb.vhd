library ieee;
use ieee.std_logic_1164.all;
library ieee;
use IEEE.numeric_std.all;

entity ram_tb is end entity;

architecture behavior of ram_tb is
COMPONENT ram
port (
		din : in std_logic_vector(9 downto 0);
		addr : in std_logic_vector(7 downto 0);
		rst, en, we : in std_logic;
		clk : in std_logic;
		dout : out std_logic_vector(9 downto 0));
 END COMPONENT;
	
	signal we, rst, en, clk    : std_logic := '1';
	signal din : std_logic_vector(9 downto 0) := "0000000000";
	signal dout : std_logic_vector(9 downto 0) := "0000000000";
	signal addr : std_logic_vector(7 downto 0) := "00000000";
	
begin
uut: ram
        port map (
		din => din,
		addr => addr,
		rst => rst, 
		en => en,
		we => we,
		clk => clk,
		dout => dout);

-- Process for generating the clock
    clk <= not clk after 5 ns;

    stim_proc: process
    begin
		wait for 20 ns;
		rst <= '0';
		en <= '0';
		we <= '0';
		addr <= std_logic_vector(to_unsigned(65, addr'length));
		din <= std_logic_vector(to_unsigned(255, din'length));
		wait for 20 ns;
        rst <= '0';
		en <= '0';
		we <= '1';
		addr <= std_logic_vector(to_unsigned(65, addr'length));
		din <= std_logic_vector(to_unsigned(255, din'length));
		wait for 20 ns;
        rst <= '0';
		en <= '1';
		we <= '1';
		addr <= std_logic_vector(to_unsigned(65, addr'length));
		din <= std_logic_vector(to_unsigned(255, din'length));
		wait for 20 ns;
		rst <= '0';
		en <= '1';
		we <= '0';
		addr <= std_logic_vector(to_unsigned(65, addr'length));
		wait for 20 ns;
		rst <= '0';
		en <= '1';
		we <= '1';
		addr <= std_logic_vector(to_unsigned(20, addr'length));
		din <= std_logic_vector(to_unsigned(128, din'length));
		wait for 20 ns;
		rst <= '0';
		en <= '1';
		we <= '1';
		addr <= std_logic_vector(to_unsigned(20, addr'length));
		din <= std_logic_vector(to_unsigned(100, din'length));
		wait for 20 ns;
		rst <= '0';
		en <= '1';
		we <= '0';
		addr <= std_logic_vector(to_unsigned(20, addr'length));
		wait for 20 ns;
		rst <= '1';
		en <= '1';
		we <= '0';
		addr <= std_logic_vector(to_unsigned(20, addr'length));
		wait for 20 ns;
		rst <= '0';
		en <= '1';
		we <= '0';
		addr <= std_logic_vector(to_unsigned(20, addr'length));
		wait for 20 ns;
        wait;
    end process;
end architecture;