CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTREASONCD" (reasonSeqno_TMP Number) return varchar2 is
tmp varchar2(4);
begin
    begin
    select reasoncd into tmp from ext_reason where reason_seqno=reasonSeqno_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTREASONCD" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTREASONCD" TO "BIOSAADM";
