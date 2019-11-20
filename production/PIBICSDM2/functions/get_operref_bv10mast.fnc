CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OPERREF_BV10MAST" (operf_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select operref into tmp from Operationref where opercd=trim(operf_tmp);
  Exception When No_Data_Found Then return 'ม.16' ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OPERREF_BV10MAST" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OPERREF_BV10MAST" TO "BIOSAADM";
