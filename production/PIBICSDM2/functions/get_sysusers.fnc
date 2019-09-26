CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SYSUSERS" (userid_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
    select FIRSTNM||' '||FAMILYNM into tmp from Sysuser where userid=trim(userid_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
