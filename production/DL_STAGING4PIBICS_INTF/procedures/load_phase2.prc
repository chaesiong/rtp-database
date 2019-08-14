CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."LOAD_PHASE2" (p_process                IN VARCHAR2
                                                              ,p_yyyymm                 IN VARCHAR2
                                                              ,p_include_copy_to_target IN BOOLEAN) AUTHID DEFINER IS
    l_log_scope CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    l_tag VARCHAR2(200 CHAR);
BEGIN
    pkg_preferences.get_and_use_logger_preferences;
    l_tag := 'INITIAL_LOAD_PHASE2_' || p_process || '_' || p_yyyymm || ' / ' ||
             to_char(SYSDATE
                    ,'YYYYMMDDHH24MISS');
    sys.dbms_application_info.set_client_info(l_tag);
    logger.log('START ' || l_tag
              ,l_log_scope);
    dl_staging4pibics_intf.pkg_ops_transactional.insert_yyyymm(p_process_name           => p_process
                                                              ,p_yyyymm                 => p_yyyymm
                                                              ,p_tag                    => l_tag
                                                              ,p_include_copy_to_target => p_include_copy_to_target);
    logger.log('END ' || l_tag
              ,l_log_scope);
    dbms_output.put_line(l_tag); -- JOB output for DBMS_SCHEDULER

END load_phase2;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE2" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_PHASE2" TO "PIBICSAPP";
