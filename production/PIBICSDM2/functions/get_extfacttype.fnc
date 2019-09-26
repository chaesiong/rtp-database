CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTFACTTYPE" (status_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select decode(status_tmp,'สำนักงานปฏิบัติการภูมิภาค','4','สำนักงานผู้แทน','2','สำนักงานภูมิภาค','3','สำนักงานสาขา','1','') into tmp from dual;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
