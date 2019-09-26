CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTSUMMONEY" (esyear char,esmonth char) return number is
tmp number;
begin
    begin    
         select sum(totalamount) into tmp  from ot_otslip 
        where  (estimateyear=esyear and estimatemonth=esmonth) and OTSLIPSTATUS='ACTIVE';
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
