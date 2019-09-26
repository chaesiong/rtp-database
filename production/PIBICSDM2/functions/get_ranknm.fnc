CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RANKNM" (userId_tmp varchar2, flag char) return varchar2 is
--flag => S=Shot, F=Full
abbrRankNm varchar2(200);
fullRankNm varchar2(200);
tmp varchar2(200);
begin
    begin    
        select ranknm, rankfullnm into abbrRankNm, fullRankNm from rank where rank_seqno =  (select rank_seqno from hr_profile where profile_seqno = (select person_id from fw_user where user_id = userId_tmp) );
    if flag = 'S' then
       tmp := abbrRankNm;
    elsif flag = 'F' then
       tmp := fullRankNm;
    else tmp := abbrRankNm;
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
