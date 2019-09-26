CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_NAMEBYIP" (ip_tmp varchar2) return varchar2 is
tnm varchar2(50);
begin
 begin
 select CHECKPOINTNO into tnm from mappingip where ipaddress=ip_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/
