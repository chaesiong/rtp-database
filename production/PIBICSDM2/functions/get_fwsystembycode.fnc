CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FWSYSTEMBYCODE" (systemCode_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select system_name into tmp  from fw_system where system_code=systemCode_tmp;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
