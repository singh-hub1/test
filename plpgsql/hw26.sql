create or replace function perfect(n int) returns varchar(90) as'
declare
nm varchar(90);
tot int:=0;
x int:=n;
begin
for i in 1..n/2
loop
if  mod(n,i) = 0  then
tot:=tot+i;
end if;
end loop;
if(tot=x) then 
 nm=''number is perfect'';
else
nm= ''number is not perfect number'';
end if;
return nm;
end;'
language 'plpgsql';


