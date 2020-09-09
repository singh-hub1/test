CREATE OR REPLACE PROCEDURE transfer(INT, INT, DEC)
LANGUAGE plpgsql    
AS $$
BEGIN
    -- subtracting the amount from the sender's account 
    UPDATE accounts 
    SET balance = balance - $3
    WHERE id = $1;
 
    -- adding the amount to the receiver's account
    UPDATE accounts 
    SET balance = balance + $3
    WHERE id = $2;
 
    COMMIT;
END;
$$;

-- call transfer(INT, INT, DEC)
