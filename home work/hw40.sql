--write a function which accept project name and print the names of all employees working on that project along with the duration--

query:

create or replace function get_info(text) returns int as '
declare 
e record;
begin
for e in select ename,pname,duration from employee,project,e_p where employee.eno=e_p.eno and project.pno=e_p.pno and pname=$1
loop
raise notice ''name=%,project=% and duration=%'',e.ename,e.pname,e.duration;
end loop;
return 1;
end;'
language 'plpgsql';
