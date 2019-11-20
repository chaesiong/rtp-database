CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BLIMPREASONS" (reasoncd_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select REASONTNM into tmp from Blimpreason where reasoncd=trim(reasoncd_tmp);
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_BLIMPREASONS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_BLIMPREASONS" TO "BIOSAADM";
