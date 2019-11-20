CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_POLICEBYORG_CODE" (ORG_CODE_tmp Number) return varchar2 is
tmp varchar2(200);
begin
 begin
 select org into tmp  from policestation where ORG_CODE=ORG_CODE_tmp and rownum =1;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_POLICEBYORG_CODE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_POLICEBYORG_CODE" TO "BIOSAADM";
