library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo is
port (
		din : in std_logic_vector(9 downto 0);
		rst, rd_en, wr_en : in std_logic;
		clk : in std_logic;
		empty, full : out std_logic;
		dout : out std_logic_vector(9 downto 0));
end entity fifo;

architecture behavioral of fifo is

begin

process(clk)
type std_vector_array is array (255 downto 0) of std_logic_vector(9 downto 0);
variable fifo_array : std_vector_array;

variable array_index : INTEGER := 0;
variable full_var : std_logic := '0';
variable empty_var : std_logic := '1';
variable output : std_logic_vector(9 downto 0);
begin
	if rising_edge(Clk) then
		if rst = '1' then
			for i in 255 downto 0 loop
				fifo_array(i) := "XXXXXXXXXX";
			end loop;
			empty_var := '1';
			full_var := '0';
			output := "XXXXXXXXXX";
			array_index := 0;
		else
			if rd_en = '1' and array_index > 0 then 
				output := fifo_array(array_index);
				fifo_array(array_index) := "XXXXXXXXXX";
				array_index := array_index - 1;
			end if;
			if wr_en = '1' and array_index < 256 then
				fifo_array(array_index) := din;
				array_index := array_index + 1;
			end if;
			if array_index >= 256 then
				full_var := '1';
			else 
				full_var := '0';
			end if;
			if array_index <= 0 then
				empty_var := '1';
			else 
				empty_var := '0';
			end if;
		end if;
		dout <= output;
		full <= full_var;
		empty <= empty_var;
	end if;
end process;
end behavioral;