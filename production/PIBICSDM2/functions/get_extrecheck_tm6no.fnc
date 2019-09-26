CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTRECHECK_TM6NO" (tm6no varchar2) return varchar2 is
tmp varchar2(10);
begin
begin
    select upper(replace(tm6no,' ','')) into tmp from dual;
    if length(tmp) > 7 then
        tmp := '';
    end if;
    Exception When Others Then tmp := null ;
end;    
    return tmp;
end;
/
