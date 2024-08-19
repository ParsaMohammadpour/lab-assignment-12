library ieee;
use ieee.std_logic_1164.all;
library ieee;
use IEEE.numeric_std.all;

entity fifo_tb is end entity;

architecture behavior of fifo_tb is
COMPONENT fifo
port (
		din : in std_logic_vector(9 downto 0);
		rst, rd_en, wr_en : in std_logic;
		clk : in std_logic;
		empty, full : out std_logic;
		dout : out std_logic_vector(9 downto 0));
 END COMPONENT;
	
	signal rst, rd_en, wr_en : std_logic := '1';
	signal clk : std_logic := '1';
	signal empty, full : std_logic;
	signal din : std_logic_vector(9 downto 0) := "0000000000";
	signal dout : std_logic_vector(9 downto 0) := "0000000000";
	
begin
uut: fifo
        port map (
		din => din,
		rst => rst,
		rd_en => rd_en, 
		wr_en => wr_en,
		clk => clk,
		empty => empty,
		full => full,
		dout => dout);

-- Process for generating the clock
    clk <= not clk after 5 ns;

    stim_proc: process
    begin
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(65, din'length));
		rst <= '0';
		rd_en <= '1';
		wr_en <= '0';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(65, din'length));
		rst <= '0';
		rd_en <= '0';
		wr_en <= '1';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(100, din'length));
		rst <= '0';
		rd_en <= '0';
		wr_en <= '1';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(200, din'length));
		rst <= '0';
		rd_en <= '0';
		wr_en <= '1';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(200, din'length));
		rst <= '0';
		rd_en <= '1';
		wr_en <= '0';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(100, din'length));
		rst <= '0';
		rd_en <= '1';
		wr_en <= '0';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(65, din'length));
		rst <= '0';
		rd_en <= '1';
		wr_en <= '0';
		wait for 20 ns;
		din <= std_logic_vector(to_unsigned(65, din'length));
		rst <= '0';
		rd_en <= '0';
		wr_en <= '1';
		wait for 20 ns;
		rst <= '1';
		rd_en <= '0';
		wr_en <= '0';
        wait;
    end process;
end architecture;