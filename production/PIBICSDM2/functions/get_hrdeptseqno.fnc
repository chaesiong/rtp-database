CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_HRDEPTSEQNO" (userid_tmp varchar2) return varchar2 is
tmp Number;
begin
    begin
    select dept_seqno into tmp from fw_user a, hr_profile b where a.person_id=B.PROFILE_SEQNO and a.user_id = trim(userid_tmp);
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRDEPTSEQNO" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRDEPTSEQNO" TO "BIOSAADM";
