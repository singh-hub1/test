create or replace function prime(n int) returns varchar(70) as'
declare 
sum int:=0;
nm varchar(90);
i int:=1;
begin
for i in 2..n
loop
if mod(n,i) =0 then 
  sum:=sum+i;
end if;
end loop;
if sum=n then 
nm=''number is perfect number'';
else
nm:=''number is not perfect number'';
end if;
return nm;
end;'
language 'plpgsql';

