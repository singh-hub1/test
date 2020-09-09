CREATE OR REPLACE FUNCTION for_loop_through_query(
   n INTEGER DEFAULT 10
) 
RETURNS VOID AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT title 
          FROM film 
          ORDER BY title
          LIMIT n 
    LOOP 
   RAISE NOTICE '%', rec.title;
    END LOOP;
END;
$$ LANGUAGE plpgsql;
