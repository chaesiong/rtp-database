CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_OPERATING" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    PROCEDURE purge_run(p_run_id IN log_run_steps.run_id%TYPE) AS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        BEGIN
            DELETE FROM log_run_steps
            WHERE run_id = p_run_id;

        EXCEPTION
            WHEN no_data_found THEN
                RAISE err_run_id_invalid;
        END;

        COMMIT;
    END purge_run;

    PROCEDURE purge_all_runs_for_tag(p_tag IN log_run_steps.tag%TYPE) IS

        l_log_scope       logger_logs.scope%TYPE := gc_log_scope_prefix || 'purge_all_runs_for_tag';
        l_tag_preferences pkg_utils.tag_preferences;
        l_cnt             NUMBER := 0;
    BEGIN
        l_tag_preferences := pkg_utils.get_tag_preferences(p_tag);
        logger.log('START , tag  ' || l_tag_preferences.tag
                  ,l_log_scope);
        IF l_tag_preferences.is_default THEN
            logger.log(pkg_utils.gc_txt_default_tag
                      ,l_log_scope);
        END IF;
        FOR r IN (SELECT run_id
                  FROM log_run_steps
                  WHERE tag = l_tag_preferences.tag)
        LOOP
            l_cnt := l_cnt + 1;
            purge_run(r.run_id);
        END LOOP;

        logger.log('END , purged  this number of processes: ' || l_cnt
                  ,l_log_scope);
    END purge_all_runs_for_tag;

    PROCEDURE refresh_pibics_counter(pi_table_name IN VARCHAR2) IS
        --useful from DL_STAGING4PIBICS_INTF
    BEGIN
        pkg_utils.reset_pibics_counter(pi_table_name => pi_table_name);
        pkg_utils.update_pibics_counter(pi_table_name => pi_table_name);
    END refresh_pibics_counter;

    PROCEDURE refresh_all_pibics_counter IS
        l_overall_count NUMBER;
    BEGIN
        FOR r IN (SELECT process_name
                  FROM dl_staging4pibics.ops_pibics_load_processes p
                  WHERE kind = 'B'
                  AND shall_be_synced = 'Y'
                  ORDER BY process_name)
        LOOP
            refresh_pibics_counter(pi_table_name => r.process_name);

        END LOOP;

        SELECT SUM(COUNT)
        INTO l_overall_count
        FROM dl_staging4pibics.cnt_pibics;
        IF l_overall_count = 0 THEN
            RAISE no_data_found;
        END IF;
    END refresh_all_pibics_counter;

    PROCEDURE refresh_all_staging_counter IS
    BEGIN
        FOR r IN (SELECT process_name
                  FROM dl_staging4pibics.ops_pibics_load_processes p
                  WHERE kind = 'B'
                  AND shall_be_synced = 'Y'
                  ORDER BY process_name)
        LOOP
            pkg_utils.reset_staging_counter(pi_table_name => r.process_name);
            pkg_utils.update_staging_counter(pi_table_name => r.process_name);

        END LOOP;

    END refresh_all_staging_counter;

    PROCEDURE merge_transcode_table(p_process_name IN VARCHAR2) IS
    BEGIN
        EXECUTE IMMEDIATE ' begin pkg_transcode.load_' || p_process_name || ';   end; ';
    END merge_transcode_table;

    PROCEDURE load_all_transcode_tables(p_tag IN log_run_steps.tag%TYPE) IS
        l_log_scope  logger_logs.scope%TYPE := gc_log_scope_prefix || 'load_all';
        l_run_params pkg_utils.run_params;
        l_tag        log_run_steps.tag%TYPE := p_tag;
    BEGIN
        IF l_tag IS NULL THEN
            l_tag := 'load_all_transcode_tables ' || to_char(SYSDATE
                                                            ,'YYYYMMDD HH24:MI:SS');
        END IF;
        l_run_params.tag          := l_tag;
        l_run_params.process_name := pkg_transcode.lc_p_transcode;
        pkg_utils.start_run(p_params => l_run_params);
        logger.log('START'
                  ,l_log_scope);
        FOR r IN (SELECT process_name
                  FROM dl_staging4pibics.ops_pibics_load_processes p
                  WHERE kind = 'M'
                  AND shall_be_synced = 'Y'
                  ORDER BY process_name)
        LOOP
            merge_transcode_table(r.process_name);
        END LOOP;

        logger.log('END. '
                  ,l_log_scope);

    END load_all_transcode_tables;

BEGIN
    pkg_utils.get_and_use_logger_preferences;
END pkg_operating;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPERATING" TO "DL_STAGING4PIBICS_INTF";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPERATING" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPERATING" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPERATING" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPERATING" TO "BIOSAADM";
