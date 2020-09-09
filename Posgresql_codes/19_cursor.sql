CREATE OR REPLACE FUNCTION get_film_titles()
   RETURNS VArchar(22) AS $$
DECLARE 
    titles VArchar(22) :='';
    rec   RECORD;
    curs CURSOR(p_year INTEGER) 
       FOR SELECT *
       FROM bus;
BEGIN
   -- Open the cursor
   OPEN curs(p_year);
   
   LOOP
    -- fetch row into the film
      FETCH curs INTO rec;
    -- exit when no more row to fetch
      EXIT WHEN NOT FOUND;
   CLOSE curs;
   RETURN titles;
END; $$
 
LANGUAGE plpgsql;
