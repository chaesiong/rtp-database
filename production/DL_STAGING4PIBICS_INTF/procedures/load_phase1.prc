CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."LOAD_PHASE1" (p_process IN VARCHAR2
                                                              ,p_yyyymm  IN VARCHAR2) AUTHID DEFINER IS
    l_log_scope CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    l_tag VARCHAR2(200 CHAR);
BEGIN
    pkg_preferences.get_and_use_logger_preferences;
    l_tag := 'INITIAL_LOAD_PHASE1_' || p_process || '_' || p_yyyymm || ' / ' ||
             to_char(SYSDATE
                    ,'YYYYMMDDHH24MISS');
    sys.dbms_application_info.set_client_info(l_tag);
    logger.log('START ' || l_tag
              ,l_log_scope);
    BEGIN
        dl_staging4pibics.pkg_ops_transactional.insert_yyyymm(p_process_name       => p_process
                                                             ,p_create_date_yyyymm => p_yyyymm
                                                             ,p_tag                => l_tag);
    EXCEPTION
        WHEN dup_val_on_index THEN
            pkg_preferences.get_and_use_logger_preferences; -- phase 1 error shall be visible here
            logger.log_error('duplicate data in STAGING for  ' || l_tag
                            ,l_log_scope);
            dbms_output.put_line(l_tag);
            RAISE;
    END;
    pkg_preferences.get_and_use_logger_preferences;
    logger.log('END ' || l_tag
              ,l_log_scope);
    dbms_output.put_line(l_tag); -- JOB output for DBMS_SCHEDULER

END load_phase1;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE1" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE1" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE1" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE1" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE1" TO "BIOSAADM";
