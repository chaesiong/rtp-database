CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RUNOTM8" (seqno_tmp number, v_tm8_seqno number) return varchar2 is
tnm varchar2(20);
begin
 begin
select runno+1 into tnm from(
select rownum runno, tm8child_seqno from (
select tm8child_seqno  from reps_tm8child where tm8_seqno = v_tm8_seqno  order by tm8child_seqno
) 
)where tm8child_seqno=seqno_tmp;
  Exception When No_Data_Found Then return '0' ;
 end;
  return tnm;
end;
/
