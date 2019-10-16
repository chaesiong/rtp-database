CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NATIONFORTM8" (seqno_tmp number) return varchar2 is
tnm varchar2(20);
begin
 begin
 select national_seqno into tnm from reps_tm8 where tm8_seqno=seqno_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/