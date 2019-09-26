CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_POLICORGANIZES" (orgcd_tmp varchar2) return varchar2 is
tnm varchar2(200);
tmp varchar2(200);
begin
 begin
 select orgnm into tnm from POLICORGANIZE where orgcd=trim(orgcd_tmp);
tmp := tnm;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
