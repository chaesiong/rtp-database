CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTPOSLEVEL" (esyear char,esmonth varchar,profileseq Number) return Number is
tmp number;
posd varchar2(6);
begin
    begin   
        select substr(pos_date,1,6) posdate into posd  from hr_profile_ot where profile_seqno = profileseq;
        if posd=(esyear||esmonth) then
          select a.poslevel_seqno into tmp from ot_accountperson a,ot_account b where B.ACCOUNTSEQNO=a.accountseqno 
          and b.estimatemonth=(esmonth-1) and b.estimateyear=esyear and a.profile_seqno=profileseq;
      else
            select a.level_seqno into tmp from hr_profile_ot a where  a.profile_seqno=profileseq;
       end if;
   Exception When No_Data_Found Then Null ;
               select  b.poslevel_seqno into tmp from ot_nonauthorized a,ot_nonauthperson b where A.OTNONAUTHSEQNO=B.OTNONAUTHSEQNO
                 and a.estimatemonth=(esmonth-1) and A.ESTIMATEYEAR=esyear and b.profile_seqno=profileseq;
       
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTPOSLEVEL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTPOSLEVEL" TO "BIOSAADM";
