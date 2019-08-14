CREATE TABLE "LOGGER"."LOGGER_PREFS" 
   (	"PREF_NAME" VARCHAR2(255), 
	"PREF_VALUE" VARCHAR2(255) NOT NULL ENABLE, 
	"PREF_TYPE" VARCHAR2(30) NOT NULL ENABLE
   ) ;
  ALTER TABLE "LOGGER"."LOGGER_PREFS" ADD CONSTRAINT "LOGGER_PREFS_PK" PRIMARY KEY ("PREF_TYPE", "PREF_NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "LOGGER"."LOGGER_PREFS" ADD CONSTRAINT "LOGGER_PREFS_CK1" CHECK (pref_name = upper(pref_name)) ENABLE;
  ALTER TABLE "LOGGER"."LOGGER_PREFS" ADD CONSTRAINT "LOGGER_PREFS_CK2" CHECK (pref_type = upper(pref_type)) ENABLE;
  CREATE UNIQUE INDEX "LOGGER"."LOGGER_PREFS_PK" ON "LOGGER"."LOGGER_PREFS" ("PREF_TYPE", "PREF_NAME") 
  ;
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_INTERFACE";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_INTERFACE";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_DBA";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_DBA";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_COMMON";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_COMMON";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_USER_MANAGEMENT";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_USER_MANAGEMENT";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "USER_MANAGEMENT";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "USER_MANAGEMENT";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_BORDERCONTROL";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_BLACKLIST";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_BLACKLIST";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DL_STAGING4PIBICS";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DL_STAGING4PIBICS";
  GRANT DELETE ON "LOGGER"."LOGGER_PREFS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "LOGGER"."LOGGER_PREFS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "LOGGER"."LOGGER_PREFS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "LOGGER"."LOGGER_PREFS" TO "DERMALOG_PROXY";
  CREATE OR REPLACE EDITIONABLE TRIGGER "LOGGER"."BIU_LOGGER_PREFS" 
  before insert or update on logger_prefs
  for each row
begin
  $if $$logger_no_op_install $then
    null;
  $else
    :new.pref_name := upper(:new.pref_name);
    :new.pref_type := upper(:new.pref_type);

    if 1=1
      and :new.pref_type = logger.g_pref_type_logger
      and :new.pref_name = 'LEVEL' then
      :new.pref_value := upper(:new.pref_value);
    end if;

    -- TODO mdsouza: 3.1.1
    -- TODO mdsouza: if removing then decrease indent
    -- $if $$currently_installing is null or not $$currently_installing $then
      -- Since logger.pks may not be installed when this trigger is compiled, need to move some code here
      if 1=1
        and :new.pref_type = logger.g_pref_type_logger
        and :new.pref_name = 'LEVEL'
        and upper(:new.pref_value) not in (logger.g_off_name, logger.g_permanent_name, logger.g_error_name, logger.g_warning_name, logger.g_information_name, logger.g_debug_name, logger.g_timing_name, logger.g_sys_context_name, logger.g_apex_name) then
        raise_application_error(-20000, '"LEVEL" must be one of the following values: ' ||
          logger.g_off_name || ', ' || logger.g_permanent_name || ', ' || logger.g_error_name || ', ' ||
          logger.g_warning_name || ', ' || logger.g_information_name || ', ' || logger.g_debug_name || ', ' ||
          logger.g_timing_name || ', ' || logger.g_sys_context_name || ', ' || logger.g_apex_name);
      end if;

      -- Allow for null to be used for Plugins, then default to NONE
      if 1=1
        and :new.pref_type = logger.g_pref_type_logger
        and :new.pref_name like 'PLUGIN_FN%'
        and :new.pref_value is null then
        :new.pref_value := 'NONE';
      end if;

      -- #103
      -- Only predefined preferences and Custom Preferences are allowed
      -- Custom Preferences must be prefixed with CUST_
      if 1=1
        and :new.pref_type = logger.g_pref_type_logger
        and :new.pref_name not in (
          'GLOBAL_CONTEXT_NAME'
          ,'INCLUDE_CALL_STACK'
          ,'INSTALL_SCHEMA'
          ,'LEVEL'
          ,'LOGGER_DEBUG'
          ,'LOGGER_VERSION'
          ,'PLUGIN_FN_ERROR'
          ,'PREF_BY_CLIENT_ID_EXPIRE_HOURS'
          ,'PROTECT_ADMIN_PROCS'
          ,'PURGE_AFTER_DAYS'
          ,'PURGE_MIN_LEVEL'
        )
      then
        raise_application_error (-20000, 'Setting system level preferences are restricted to a set list.');
      end if;

      -- this is because the logger package is not installed yet.  We enable it in logger_configure
      logger.null_global_contexts;
    -- TODO mdsouza: 3.1.1
    -- $end
  $end -- $$logger_no_op_install
end;
/
ALTER TRIGGER "LOGGER"."BIU_LOGGER_PREFS" ENABLE;