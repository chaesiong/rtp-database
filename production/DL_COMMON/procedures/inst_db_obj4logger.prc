CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_COMMON"."INST_DB_OBJ4LOGGER" (p_TO_SCHEMA     in varchar2
                                                        ,p_LOGGER_SCHEMA in varchar2 default 'LOGGER'
                                                         --
                                                         ) authid current_user is
  --
  --
  /*******************************************************************************
  * ???
  *
  *
  *
  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * WWirns    20.12.2017  Added
  *******************************************************************************/
  --
  v_TO_SCHEMA     varchar2(30 char);
  v_LOGGER_SCHEMA varchar2(30 char);
  --
begin
  --
  --
  v_TO_SCHEMA     := p_TO_SCHEMA;
  v_LOGGER_SCHEMA := nvl(p_LOGGER_SCHEMA
                        ,'LOGGER');
  --
  begin
    select t.USERNAME
      into v_TO_SCHEMA
      from ALL_USERS t
     where upper(t.USERNAME) = upper(v_TO_SCHEMA);
  exception
    when NO_DATA_FOUND then
      Raise_application_error(-20000
                             ,'v_TO_SCHEMA[''' || v_TO_SCHEMA || '''] does not exist!');
  end;
  --
  begin
    select t.USERNAME
      into v_LOGGER_SCHEMA
      from ALL_USERS t
     where upper(t.USERNAME) = upper(v_LOGGER_SCHEMA);
  exception
    when NO_DATA_FOUND then
      Raise_application_error(-20000
                             ,'v_LOGGER_SCHEMA[''' || v_LOGGER_SCHEMA || '''] does not exist!');
  end;
  --
  -- Statements out of "\ThirdParty\logger_3.1.1\scripts\grant_logger_to_user.sql"
  execute immediate 'grant execute on ' || v_LOGGER_SCHEMA || '.logger to ' || v_TO_SCHEMA;
  execute immediate 'grant select, delete on ' || v_LOGGER_SCHEMA || '.logger_logs to ' || v_TO_SCHEMA;
  execute immediate 'grant select on ' || v_LOGGER_SCHEMA || '.logger_logs_apex_items to ' || v_TO_SCHEMA;
  execute immediate 'grant select, update on ' || v_LOGGER_SCHEMA || '.logger_prefs to ' || v_TO_SCHEMA;
  execute immediate 'grant select on ' || v_LOGGER_SCHEMA || '.logger_prefs_by_client_id to ' || v_TO_SCHEMA;
  execute immediate 'grant select on ' || v_LOGGER_SCHEMA || '.logger_logs_5_min to ' || v_TO_SCHEMA;
  execute immediate 'grant select on ' || v_LOGGER_SCHEMA || '.logger_logs_60_min to ' || v_TO_SCHEMA;
  execute immediate 'grant select on ' || v_LOGGER_SCHEMA || '.logger_logs_terse to ' || v_TO_SCHEMA;
  --
  -- Statements out of "\ThirdParty\logger_3.1.1\scripts\create_logger_synonyms.sql"
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger for ' || v_LOGGER_SCHEMA || '.logger';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_logs for ' || v_LOGGER_SCHEMA || '.logger_logs';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_logs_apex_items for ' || v_LOGGER_SCHEMA || '.logger_logs_apex_items';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_prefs for ' || v_LOGGER_SCHEMA || '.logger_prefs';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_prefs_by_client_id for ' || v_LOGGER_SCHEMA || '.logger_prefs_by_client_id';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_logs_5_min for ' || v_LOGGER_SCHEMA || '.logger_logs_5_min';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_logs_60_min for ' || v_LOGGER_SCHEMA || '.logger_logs_60_min';
  execute immediate 'create or replace synonym ' || v_TO_SCHEMA || '.logger_logs_terse for ' || v_LOGGER_SCHEMA || '.logger_logs_terse';
  --
end INST_DB_OBJ4LOGGER;
/
  GRANT EXECUTE ON "DL_COMMON"."INST_DB_OBJ4LOGGER" TO PUBLIC;
  GRANT EXECUTE ON "DL_COMMON"."INST_DB_OBJ4LOGGER" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_COMMON"."INST_DB_OBJ4LOGGER" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_COMMON"."INST_DB_OBJ4LOGGER" TO "BIOSUPPORT";
