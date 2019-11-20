CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTFROMUSERID" (userid varchar2) return varchar2 is
tmp Number(4);
begin
 begin
    select dept_seqno into tmp from hr_profile p
 left join fw_user u
 on u.person_id = P.PROFILE_SEQNO
 where u.user_id = userid; 
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTFROMUSERID" TO "DL_BLACKLIST" WITH GRANT OPTION;
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTFROMUSERID" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTFROMUSERID" TO "BIOSAADM";
