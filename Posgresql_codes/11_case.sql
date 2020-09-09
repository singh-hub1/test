CREATE OR REPLACE FUNCTION get_price_segment(p_film_id integer)
   RETURNS VARCHAR(50) AS $$
DECLARE 
   rate   NUMERIC;
   price_segment VARCHAR(50);
BEGIN
     -- get the rate based on film_id
    SELECT INTO rate rental_rate 
    FROM film 
    WHERE film_id = p_film_id;
      
     CASE rate
   WHEN 0.99 THEN
            price_segment = 'Mass';
   WHEN 2.99 THEN
            price_segment = 'Mainstream';
   WHEN 4.99 THEN
            price_segment = 'High End';
   ELSE
       price_segment = 'Unspecified';
   END CASE;
   
   RETURN price_segment;
END; $$
LANGUAGE plpgsql;
