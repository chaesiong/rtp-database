CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FSDEPTCHANGE" (esyear char,esmonth varchar,profileseq Number) return NumbER is
tmp number;
begin
    begin   
      select b.orgdept_seqno into tmp  from fs_deptchange a, fs_deptchangeperson b 
      where a.fsdeptchangeseqno=b.fsdeptchangeseqno and a.estimateyear=esyear and a.estimatemonth=esmonth and b.profile_seqno=profileseq;        
   Exception When No_Data_Found Then Null ;
      return null;
    end;
  return tmp;
end;
/
