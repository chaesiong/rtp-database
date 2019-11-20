CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_EXITROLESYSTEM" (useridtmp varchar2, role_idtmp number) RETURN NUMBER IS
    tmp Number;
    begin
        select c.role_id into tmp from fw_groupuser a, fw_role_memberlist b, fw_role c 
        where a.group_id=b.group_id and b.role_id=c.role_id and a.user_id = useridtmp and c.role_id = role_idtmp and rownum=1;
        return tmp;    
      exception when no_data_found then
      return null; 
END get_exitRoleSystem;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXITROLESYSTEM" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_EXITROLESYSTEM" TO "BIOSAADM";
