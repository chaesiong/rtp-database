CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SUMALLRATE" (esyear char,esmonth char) return number is
tmp number;
begin
    begin    
        select sum(sumrate) sumallrate into tmp from (
        select a.poslevel_seqno,a.otrate,a.actflag,count(b.level_seqno) ,(a.otrate * count(b.level_seqno)) sumrate from ot_rate a,hr_profile_ot b
        where a.poslevel_seqno=b.level_seqno and b.dept_seqno is not null and (nvl(substr(B.POS_DATE,1,6),0)!=esyear||esmonth ) and c_type <> '9' 
        group by a.poslevel_seqno,A.OTRATE,a.actflag
        order by a.poslevel_seqno);
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_SUMALLRATE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_SUMALLRATE" TO "BIOSAADM";
