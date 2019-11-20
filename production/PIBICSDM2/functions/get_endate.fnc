CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_ENDATE" return varchar2 is
tmp varchar2(200);
begin
    begin
    select to_char(sysdate,'DD/MM/YYYY','NLS_CALENDAR=GREGORIAN') into tmp from dual;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_ENDATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_ENDATE" TO "BIOSAADM";
