CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_BLIMPREASONS_TYPE" (reasonTypeseq_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select reason_typenm into tmp from Blimreason_type where reason_type_seqno=reasonTypeseq_tmp;

 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_BLIMPREASONS_TYPE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_BLIMPREASONS_TYPE" TO "BIOSAADM";
