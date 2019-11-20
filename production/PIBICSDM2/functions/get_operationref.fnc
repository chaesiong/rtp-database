CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OPERATIONREF" (operf_tmp varchar2) return varchar2 is
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select operref into tnm from Operationref where opercd=trim(operf_tmp);
  Exception When No_Data_Found Then null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OPERATIONREF" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OPERATIONREF" TO "BIOSAADM";
