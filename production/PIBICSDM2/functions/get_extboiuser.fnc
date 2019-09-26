CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTBOIUSER" (code_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select name into tmp from EXTBOIUSER  where id = trim(code_tmp) and rownum = 1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
