create or replace function get_stud()returns int as '
declare
scur refcursor ;
srec student %rowtype;
begin
open scur for select *from student;
loop
fetch scur into srec ;
exit when not found;
raise notice ''roll no=%,name=%'',srec.roll,srec.name;
end loop;
close scur;
return 1;
end;'
language 'plpgsql';
