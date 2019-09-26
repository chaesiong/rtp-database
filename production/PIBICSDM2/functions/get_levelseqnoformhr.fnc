CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_LEVELSEQNOFORMHR" (profileseq_tmp number) return number is 
tmp number;
begin
    begin
    select level_seqno into tmp  from hr_profile where profile_seqno=profileseq_tmp;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
