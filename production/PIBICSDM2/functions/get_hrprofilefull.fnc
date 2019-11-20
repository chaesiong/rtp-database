CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_HRPROFILEFULL" (userid_tmp varchar2) return varchar2 is
tmp varchar2(200);
begin
    begin
     select get_RankNm(trim(userid_tmp), 'A') ||' '||  b.name||' '||b.sname into tmp from fw_user a, hr_profile b where a.person_id=b.profile_seqno and a.user_id = trim(userid_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRPROFILEFULL" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRPROFILEFULL" TO "BIOSAADM";
