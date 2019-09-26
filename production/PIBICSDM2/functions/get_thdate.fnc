CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_THDATE" return varchar2 is
tmp varchar2(200);
begin
    begin
    select to_char(sysdate,'DD/MM/YYYY','NLS_CALENDAR=''THAI BUDDHA''') into tmp from dual;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
