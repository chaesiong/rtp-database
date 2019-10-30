CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."LOAD_TMMAIN" (p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                                                              ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE)
    AUTHID DEFINER IS
    l_log_scope CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    l_tag VARCHAR2(200 CHAR);
BEGIN
    pkg_preferences.get_and_use_logger_preferences;
    l_tag := 'INITIAL_LOAD_TMMAIN_' || p_lowest_tmrunno_to_copy || '_' || p_highest_tmrunno_to_copy || ' / ' ||
             to_char(SYSDATE
                    ,'YYYYMMDDHH24MISS');
    sys.dbms_application_info.set_client_info(l_tag);
    logger.log('START ' || l_tag
              ,l_log_scope);
    BEGIN
        dl_staging4pibics.pkg_tmmain.copy_to_staging(p_lowest_tmrunno_to_copy  => p_lowest_tmrunno_to_copy
                                                    ,p_highest_tmrunno_to_copy => p_highest_tmrunno_to_copy);
    EXCEPTION
        WHEN OTHERS THEN
            pkg_preferences.get_and_use_logger_preferences; -- phase 1 error shall be visible here
            logger.log_error('duplicate data in STAGING for  ' || l_tag
                            ,l_log_scope);
            dbms_output.put_line(l_tag);
            RAISE;
    END;
    pkg_preferences.get_and_use_logger_preferences;
    dl_staging4pibics_intf.pkg_st_tmmain.copy_to_target(p_lowest_tmrunno_to_copy  => p_lowest_tmrunno_to_copy
                                                       ,p_highest_tmrunno_to_copy => p_highest_tmrunno_to_copy
                                                       ,p_tag                     => l_tag);

    logger.log('END ' || l_tag
              ,l_log_scope);
    dbms_output.put_line(l_tag); -- JOB output for DBMS_SCHEDULER

END load_tmmain;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_TMMAIN" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_TMMAIN" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_TMMAIN" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."LOAD_TMMAIN" TO "BIOSUPPORT";
