CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTRATE" (esyear char,esmonth varchar,profileseq Number) return NumbER is
tmp number;
posd varchar2(6);
begin
    begin   
      
        select substr(pos_date,1,6) posdate into posd  from hr_profile_ot where profile_seqno = profileseq;
        if posd=(esyear||esmonth) then
          select secotrate into tmp from ot_poschange a ,ot_poschangeperson b where  A.OTPOSCHANGESEQNO=B.OTPOSCHANGESEQNO and  estimateyear||estimatemonth=esyear||esmonth and B.PROFILE_SEQNO=profileseq;
      else
            select b.otrate into tmp from hr_profile_ot a,ot_rate b  where a.level_seqno= b.poslevel_seqno and a.profile_seqno=profileseq;
       end if;
   Exception When No_Data_Found Then Null ;
               select  b.otrate into tmp from ot_nonauthorized a,ot_nonauthperson b where A.OTNONAUTHSEQNO=B.OTNONAUTHSEQNO
                 and a.estimatemonth=(esmonth-1) and A.ESTIMATEYEAR=esyear and b.profile_seqno=profileseq;
       
    end;
  return tmp;
end;
/
