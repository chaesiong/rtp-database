CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTRATEFROMPOSDATE" (esyear char,esmonth char) return number is
tmp number;
begin
    begin    
        select sum(otrate)otratesum into tmp from(
        select profile_seqno,pos_date , nvl(GET_OTRATE(esyear,esmonth,profile_seqno),0) otrate from hr_profile_ot  where substr(pos_date,0,6)=esyear||esmonth and  dept_seqno is not null and c_type<>'9'); 
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
