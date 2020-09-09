CREATE OR REPLACE FUNCTION get_driver_details(b_n1 bus.b_n%type,d_o_d_a1 bus_driver.d_o_d_a%type) 
RETURNS VARCHAR (25) 
AS $$ 
DECLARE
	c integer:=0;
	rec record;
	d_name varchar(22);
	result varchar(22);
BEGIN
	SELECT d_nm INTO d_name
	FROM bus,driver,bus_driver    
	WHERE bus.b_n=bus_driver.b_n 
	and driver.d_n=bus_driver.d_n 
	and bus_driver.b_n=b_n1
	and bus_driver.d_o_d_a=d_o_d_a1 group by d_nm;
	RETURN d_name;
END ; $$ 
LANGUAGE plpgsql;
