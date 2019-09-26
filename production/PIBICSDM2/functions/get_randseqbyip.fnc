CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RANDSEQBYIP" (ip_tmp varchar2) return number is
seq number;
begin
    begin
    select c.rank_seqno into seq   from fw_user a , hr_profile b, rank c where a.person_id = b.profile_seqno and b.rank_seqno = c.rank_seqno and a.user_id=ip_tmp;   
    Exception When No_Data_Found Then Null ;
    end;
  return seq;
end;
/
