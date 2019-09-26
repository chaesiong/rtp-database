CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTRATEFROMPOSDATENOWCHECK" (esyear char,esmonth char) return number is
tmp number;
begin  
    begin    
        select SUM(nvl(GET_OTRATEOLDPOSDATE(esyear,esmonth,profile_seqno),0)) INTO tmp from hr_profile_ot where substr(pos_date,0,6)=esyear||esmonth and c_type <> '9';
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
