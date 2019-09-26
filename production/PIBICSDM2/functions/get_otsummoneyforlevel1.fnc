CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTSUMMONEYFORLEVEL1" (esyear char,esmonth char,deptle1seq number) return number is
tmp number;
begin
    begin    
         select sum(totalamount) into tmp  from ot_otslip 
        where  (estimateyear=esyear and estimatemonth=esmonth) 
        and dept_seqno in(select dept_seqno from department where (rel_code=deptle1seq or dept_seqno=deptle1seq )or (rel_code in (select dept_seqno from department where rel_code=deptle1seq)))
        group by dept_seqno,estimateyear,estimatemonth  order by dept_seqno;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
