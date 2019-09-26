CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SLIPTYPE" (sts_tmp char) return varchar2 is
tnm varchar2(20);
begin
 begin
   if sts_tmp='A' then
    tnm:='อัตโนมัติ';
   elsif sts_tmp = 'M' then
    tnm:='กำหนดเอง';
   else
    tnm:='ทั้งหมด';
   end if;
 end;
  return tnm;
end;
/
