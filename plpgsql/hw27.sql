create or replace function pallindrome(n int ) returns varchar(90) as'
declare
nm varchar(90);
temp int:=0;
rem int;
m int:=n;
begin

while  n<>0 
loop
rem:= mod(n,10);
temp:=(temp*10)+rem;
n:=trunc(n/10);
end loop;
if m=temp then 
 nm=''pallindrome number'';
else
nm=''not pallindrome number'';
end if;
return nm;
end;'
language 'plpgsql';


