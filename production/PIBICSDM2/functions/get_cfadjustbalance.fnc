CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_CFADJUSTBALANCE" (ESTIMATEYEAR_TMP varchar2, ESTIMATEMONTH_TMP varchar2) return char is
tmp char(1);
begin
 begin
 select CFADJUSTBALANCE into tmp from ot_policedue WHERE ESTIMATEYEAR = ESTIMATEYEAR_TMP AND ESTIMATEMONTH = ESTIMATEMONTH_TMP;
 Exception When No_Data_Found Then 
    tmp := 'N';
 end;
  return tmp;
end;
/
