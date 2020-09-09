create or replace function get_details() returns int  as '
declare
cur1 cursor for select *from dept;
cur2 cursor for select *from employee;
r1 dept%rowtype;
r2 employee%rowtype;
count int:=0;
begin
	open cur1;
	loop
	fetch cur1 into r1;
      exit when not found;
	if r1.dloc=''main_building'' then 
	open cur2;
	loop
	fetch cur2 into r2;
	exit when not found;
	if r2.eno=r1.eno then
	raise notice ''% % %'',r2.ename,r2.eaddr,r1.dname;
      count:=count+1;
      end if;
      end loop;
      close cur2;
      end if;
      end loop;
      close cur1;
      return count;
end;'
language 'plpgsql';
