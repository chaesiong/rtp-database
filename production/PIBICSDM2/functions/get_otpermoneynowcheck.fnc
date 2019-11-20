CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_OTPERMONEYNOWCHECK" (esyear char,esmonth char) return varchar2 is
tmp number;
begin
    begin    
    select (sum (totalamount)  /((get_sumallrate(esyear,esmonth)+nvl(get_otratefromposdatenowcheck(esyear,esmonth),0))-(get_commandertm2+(select  nvl(sum(sumratenon),0) sumratenon from VWOTNONCOUNTNUMRATE  where estimateyear=esyear and estimatemonth=esmonth))) )   
     into tmp from ot_otslip where estimateyear = esyear and estimatemonth = esmonth and otslipstatus='ACTIVE'  group by estimateyear , estimatemonth;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTPERMONEYNOWCHECK" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_OTPERMONEYNOWCHECK" TO "BIOSAADM";
