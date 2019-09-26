CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_MIGRATEDATEEXT" (date_tmp varchar2) return varchar2 is
tmp varchar2(20);
d date;
begin
 begin
    if length(date_tmp) <> 10 or date_tmp is null then
        return null;
    end if;
    
    select to_date(date_tmp, 'yyyy-mm-dd') into d from dual;
    Exception when others then 
        return null; 
 end;
 tmp :=date_tmp;
 return tmp;
end;
/
