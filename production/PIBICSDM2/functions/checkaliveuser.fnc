CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."CHECKALIVEUSER" (v_userid varchar2, v_logintime varchar2) RETURN varchar2 IS
    tmp varchar2(10);
    begin
    begin
        
        select 'SIGNOUT' into tmp from (
        select user_id, action, max(to_char(logout_time, 'yyyymmddhh24miss')) maxlogout_time from fw_log where to_char(logindate, 'YYYYMMDD') between to_char(sysdate-1, 'YYYYMMDD') and to_char(sysdate, 'YYYYMMDD') 
        and action = 'login'
        and user_id = v_userid
        --and logout_type = 'E'
        and logout_time is not null
        group by user_id, action, to_char(logout_time, 'yyyymmdd')) where maxlogout_time > v_logintime ;
     exception when no_data_found then 
     tmp := 'ALIVE';
     end;
        return tmp; 
END checkAliveUser;
/
  GRANT EXECUTE ON "PIBICSDM2"."CHECKALIVEUSER" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."CHECKALIVEUSER" TO "BIOSAADM";
