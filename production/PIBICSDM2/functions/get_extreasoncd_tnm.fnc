CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTREASONCD_TNM" (reasonSeqno_TMP Number) return varchar2 is
tmp varchar2(200);
begin
    begin
    select reasoncd||' '||reasonexttnm into tmp from ext_reason where reason_seqno=reasonSeqno_TMP;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/