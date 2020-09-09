CREATE OR REPLACE FUNCTION get_customer_service (p_customer_id INTEGER) 
   RETURNS VARCHAR (25) AS $$ 
DECLARE
    total_payment NUMERIC ; 
    service_level VARCHAR (25) ;
BEGIN
   -- get the rate based on film_id
     SELECT INTO total_payment SUM (amount)
     FROM payment
     WHERE customer_id = p_customer_id ; 
  
   CASE
      WHEN total_payment > 200 THEN
         service_level = 'Platinum' ;
      WHEN total_payment > 100 THEN
    service_level = 'Gold' ;
      ELSE
         service_level = 'Silver' ;
   END CASE ;
 
   RETURN service_level ;
END ; $$ 
LANGUAGE plpgsql;


