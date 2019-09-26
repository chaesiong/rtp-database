CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DOC_DATETM8DATE" (seqno_tmp number) return varchar2 is
tnm date;
begin
 begin
 select doc_date into tnm from reps_tm8 where tm8_seqno=seqno_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/
