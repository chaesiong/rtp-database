CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_LEVELSEQNOFORMHR_OT" (profileseq_tmp number) return number is 
tmp number;
begin
    begin
    select level_seqno into tmp  from hr_profile_ot where profile_seqno=profileseq_tmp;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_LEVELSEQNOFORMHR_OT" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_LEVELSEQNOFORMHR_OT" TO "BIOSAADM";
