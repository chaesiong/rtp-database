CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSFINEDATE" (seqno_tmp number) return varchar2 is
tnm date;
begin
 begin
 select fineslipdate into tnm from fs_fines where fines_seqno=seqno_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/
