CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_APPVSTS" (sts_tmp char) return varchar2 is
tnm varchar2(20);
begin
 begin
   if sts_tmp='A' then
    tnm:='อนุญาต';
   elsif sts_tmp = 'N' then
    tnm:='ไม่อนุญาต';
   elsif sts_tmp = 'R' then
    tnm:='เพิกถอน';
   elsif sts_tmp = 'C' then
    tnm:='ยกเลิก';
   end if;
 end;
  return tnm;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_APPVSTS" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_APPVSTS" TO "BIOSAADM";
