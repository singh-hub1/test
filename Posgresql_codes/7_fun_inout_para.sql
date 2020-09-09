CREATE OR REPLACE FUNCTION square(
   INOUT a NUMERIC)
AS $$
BEGIN
   a := a * a;
END; $$
LANGUAGE plpgsql;
