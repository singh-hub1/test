CREATE OR REPLACE function get_emp() RETURNS INT AS'
DECLARE
	scur CURSOR(subjectname,price) FOR SELECT * 
                           FROM book
                           WHERE subjectname=$1 and price<$2;
	srec book%ROWTYPE;
BEGIN
	OPEN scur;
		LOOP
 			FETCH scur into srec ;
 			EXIT WHEN NOT FOUND;
 			RAISE NOTICE '' book names=%,author names='',srec.bookname,srec.authorname;
		END LOOP;
	 CLOSE scur;
       RETURN 1;
END;'
LANGUAGE 'plpgsql';
