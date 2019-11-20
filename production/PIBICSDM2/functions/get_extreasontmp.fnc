CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTREASONTMP" (code_tmp varchar2) return varchar2 is 
tnm varchar2(200);
tmp varchar2(200);
begin
    begin
    select seqno into tmp from extreason_tmp  where code = trim(code_tmp) and rownum = 1;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTREASONTMP" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTREASONTMP" TO "BIOSAADM";
