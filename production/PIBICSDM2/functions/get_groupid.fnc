CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_GROUPID" (userid_tmp varchar2) return varchar2 is
tnm varchar2(20);
begin
 begin
 select group_id into tnm from fw_groupuser a, fw_user b where rownum=1 and a.user_id=b.user_id and b.person_id=userid_tmp;
  Exception When No_Data_Found Then return null ;
 end;
  return tnm;
end;
/
