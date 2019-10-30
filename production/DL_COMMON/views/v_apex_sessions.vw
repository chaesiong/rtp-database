CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_COMMON"."V_APEX_SESSIONS" ("APEX_SESSION_ID", "COOKIE_VALUE", "WORKSPACE_NAME", "SESSION_CREATED", "SESSION_MAX_IDLE_SEC", "IDLE_TIMEOUT_ON", "LIFE_TIMEOUT_ON", "REMOTE_ADDR", "ON_NEW_INSTANCE_FIRED_FOR", "USER_NAME", "AUTHENTICATION_RESULT", "SCREEN_READER_MODE_YN", "HIGH_CONTRAST_MODE_YN", "SESSION_TIME_ZONE", "SESSION_LANG", "SESSION_TERRITORY", "RAS_SESSIONID", "WORKSPACE_USER_ID", "DEBUG_LEVEL", "TRACE_MODE", "TIMEOUT_COMPUTATION") AS 
  select id as apex_session_id
       , cookie_value
       , apex_util.find_workspace(security_group_id) as workspace_name
       , created_on as session_created
       , max_idle_sec as session_max_idle_sec
       , idle_timeout_on
       , life_timeout_on
       , remote_addr
       , on_new_instance_fired_for
       , username as user_name
       , authentication_result
       , screen_reader_mode_yn
       , high_contrast_mode_yn
       , session_time_zone
       , session_lang
       , session_territory
       , ras_sessionid
       , workspace_user_id
       , debug_level
       , trace_mode
       , timeout_computation
from  apex_050100.wwv_flow_sessions$;
  GRANT SELECT ON "DL_COMMON"."V_APEX_SESSIONS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."V_APEX_SESSIONS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."V_APEX_SESSIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."V_APEX_SESSIONS" TO "BIOSUPPORT";
