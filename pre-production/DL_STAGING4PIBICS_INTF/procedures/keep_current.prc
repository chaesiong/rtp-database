CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT" (p_process_name IN VARCHAR2
                                                               ,p_date         IN DATE DEFAULT SYSDATE) AUTHID DEFINER IS
    -- especially useful to be callled by dbms_scheduler

    l_tag VARCHAR2(100 CHAR) := 'TRANSACTION_DATA_SYNC_' || p_process_name || '  / ' ||
                                to_char(SYSDATE
                                       ,'YYYYMMDDHH24MISS');

    l_cnt PLS_INTEGER;

BEGIN
    dbms_application_info.set_client_info(client_info => l_tag);
    dl_staging4pibics.pkg_operating.refresh_pibics_counter(pi_table_name => p_process_name);
    dl_staging4pibics.pkg_ops_transactional.merge_yyyymmdd(p_process_name         => p_process_name
                                                          ,p_create_date_yyyymmdd => to_char(p_date
                                                                                            ,'YYYYMMDD')
                                                          ,p_tag                  => l_tag);
    SELECT coalesce(COUNT(*)
                   ,0)
    INTO l_cnt
    FROM dl_staging4pibics_intf.ops_sync_processes
    WHERE staging_table_name = p_process_name
    AND shall_be_processed = 'Y';
    IF l_cnt <> 0 THEN
        dl_staging4pibics_intf.pkg_ops_transactional.keep_current(p_process_name => p_process_name
                                                                 ,p_tag          => l_tag);
    END IF;

    dbms_output.put_line(l_tag);
END keep_current;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."KEEP_CURRENT" TO "TRAINEE";
