CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CHILDNOTM8" (seqno_tmp number) return varchar2 is
tnm varchar2(20);
begin
 begin
 select childno +1 into tnm from reps_tm8 where tm8_seqno=seqno_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/