--write a function which accept hospital name and print the names and specialization of all doctors visiting that hospital and also their day of visit--
 create or replace function doc(text) returns int as '
declare
d record;
begin
for d in select dname,specialization,dov from hospital,doctor,hos_doc where hospital.hno=hos_doc.hno and doctor.dno=hos_doc.dno and hname=$1

loop
raise notice ''name=% ,specilaization=%,dov=%'',d.dname,d.specialization,d.dov;
end loop;
return 1;
end;'
language 'plpgsql';
