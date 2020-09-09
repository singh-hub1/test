CREATE OR REPLACE FUNCTION get_film_titles()
RETURNS VArchar(22) 
AS $$
DECLARE 
    titles VArchar(22) :='';
    rec   RECORD;
    curs CURSOR FOR SELECT * FROM bus;
BEGIN
   OPEN curs;
   for rec in curs LOOP
      raise notice '% % %',rec.b_n,rec.cap,rec.depo;
   END LOOP;
   CLOSE curs;
   RETURN titles;
END; $$
LANGUAGE plpgsql;
