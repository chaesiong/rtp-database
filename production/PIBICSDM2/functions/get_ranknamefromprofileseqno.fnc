CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RANKNAMEFROMPROFILESEQNO" (profileseq number, flag varchar2) return varchar2 is
anm varchar2(200);
fnm varchar2(200);
tmp varchar2(200);
seq varchar2(200);
begin
 begin
   select ranknm, rankfullnm ,rank_seqno into anm,fnm,seq  from rank where rank_seqno =  (select rank_seqno from hr_profile where profile_seqno =profileseq );
    if flag = 'A' then
        tmp := anm;
     elsif flag = 'F' then
        tmp := fnm;
     elsif flag = 'S' then
        tmp := seq;
     else tmp := anm;
    end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
