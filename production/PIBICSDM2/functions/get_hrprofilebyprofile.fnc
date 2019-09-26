CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_HRPROFILEBYPROFILE" (profileSeqno_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
     select   get_RankName(rank_seqno,'S')||' '||name||' '||sname  into tmp from  hr_profile where profile_seqno=profileSeqno_tmp ;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
