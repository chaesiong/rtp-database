CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXTNAT_PURPOSE" (status_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
 select decode(status_tmp,'นักลงทุน 10 ล้านบาท','4','30 ล้านบาทขึ้นไป','2','นักลงทุน 2 ล้านบาท','3','30 ล้านบาทขึ้นไป (ชำระมูลค่าเต็ม)','1','') into tmp from dual;
 Exception When No_Data_Found Then Null ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTNAT_PURPOSE" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXTNAT_PURPOSE" TO "BIOSAADM";
