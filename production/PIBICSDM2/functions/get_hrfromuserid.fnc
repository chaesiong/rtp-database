CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_HRFROMUSERID" (userid_tmp varchar2 ,flag char) return varchar2 is
tmp varchar2(200);
begin
    begin
        if flag='A' then
            select b.name||' '||b.sname into tmp from fw_user a, hr_profile b where a.person_id=b.profile_seqno and a.user_id = trim(userid_tmp);
        elsif  flag='B' then
             select to_char(profile_seqno) into tmp from fw_user a, hr_profile b where a.person_id=b.profile_seqno and a.user_id = trim(userid_tmp);
        elsif  flag='C' then
             select to_char(Dept_seqno) into tmp from fw_user a, hr_profile b where a.person_id=b.profile_seqno and a.user_id = trim(userid_tmp);
        elsif  flag='D' then
             select get_DeptCd(to_number(get_HrfromUserId (user_id,'C'))) into tmp from fw_user a, hr_profile b where a.person_id=b.profile_seqno and a.user_id = trim(userid_tmp);
        end if;
    Exception When No_Data_Found Then Null ;
    end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRFROMUSERID" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_HRFROMUSERID" TO "BIOSAADM";
