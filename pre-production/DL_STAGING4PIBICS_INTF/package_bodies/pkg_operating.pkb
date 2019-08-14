CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_OPERATING" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    PROCEDURE purge_err$(p_owner        IN all_tables.owner%TYPE
                        ,p_table_name   IN all_tables.table_name%TYPE
                        ,p_ora_err_tag$ IN log_run_steps.tag%TYPE) IS

        l_stmt       VARCHAR2(1000);
        l_table_name all_tables.table_name%TYPE;
        l_cnt        NUMBER;
        l_log_scope  logger_logs.scope%TYPE := gc_log_scope_prefix || 'purge_err$';
    BEGIN
        l_table_name := CASE p_owner
                            WHEN 'DL_BORDERCONTROL' THEN
                             'ERR$_BC_' || p_table_name
                            ELSE
                             'ERR$_' || p_table_name
                        END;

        l_stmt := 'delete from ' || l_table_name || ' where ora_err_tag$ = :p1';
        --  logger.log(l_stmt,l_log_scope);
        EXECUTE IMMEDIATE l_stmt
            USING p_ora_err_tag$;
        l_cnt := SQL%ROWCOUNT;
        logger.log('deleted ' || l_cnt || ' rows from ' || l_table_name
                  ,l_log_scope);
    END purge_err$;
    --
    --
    --
    -- PUBLIC
    --
    --
    PROCEDURE purge_run(p_run_id IN NUMBER) AS

        PRAGMA AUTONOMOUS_TRANSACTION;
        l_log_scope logger_logs.scope%TYPE := gc_log_scope_prefix || 'purge_run';
    BEGIN
        logger.log('START , run ' || p_run_id
                  ,l_log_scope);

        FOR r IN (SELECT t.owner
                        ,t.table_name
                        ,s.tag
                  FROM log_run_steps s
                  INNER JOIN all_tables t
                  ON t.table_name = s.subtopic
                  WHERE s.run_id = p_run_id)
        LOOP
            purge_err$(p_owner        => r.owner
                      ,p_table_name   => r.table_name
                      ,p_ora_err_tag$ => r.tag);
        END LOOP;

        DELETE FROM log_run_steps
        WHERE run_id = p_run_id;

        COMMIT;
        logger.log('END'
                  ,l_log_scope);
    END purge_run;

    PROCEDURE purge_all_runs_for_tag(p_tag IN log_run_steps.tag%TYPE) IS
        l_log_scope logger_logs.scope%TYPE := gc_log_scope_prefix || 'purge_all_runs_for_tag';
        l_cnt       NUMBER := 0;
    BEGIN
        logger.log('START , tag  ' || p_tag
                  ,l_log_scope);
        FOR r IN (SELECT run_id
                  FROM log_run_steps
                  WHERE tag = p_tag)
        LOOP
            purge_run(r.run_id);
        END LOOP;

        logger.log('END , purged this number of ops_runs: ' || l_cnt
                  ,l_log_scope);
    END purge_all_runs_for_tag;

    PROCEDURE merge_transcode_table(p_process_name IN VARCHAR2) IS
        l_log_scope logger_logs.scope%TYPE := gc_log_scope_prefix || 'merge_transcode_table';
    BEGIN
        EXECUTE IMMEDIATE 'begin dl_staging4pibics_intf.pkg_sync_transcode.fill_' || p_process_name || ' ; end ; ';
    EXCEPTION
        WHEN dl_staging4pibics_intf.pkg_sync_transcode.err_no_data_merged THEN
            logger.log_error('no data loaded FOR ' || p_process_name
                            ,l_log_scope);
        WHEN dup_val_on_index THEN
            logger.log_error(SQLERRM
                            ,l_log_scope);
        WHEN OTHERS THEN
            IF SQLCODE = -02291 THEN
                logger.log_error(SQLERRM
                                ,l_log_scope);
                RETURN;
            END IF;
            RAISE;
    END merge_transcode_table;

    PROCEDURE sync_transcode(p_tag IN log_run_steps.tag%TYPE) IS
        l_log_scope  logger_logs.scope%TYPE := gc_log_scope_prefix || 'sync_transcode';
        l_run_params pkg_utils.run_params;
    BEGIN
        logger.log('START'
                  ,l_log_scope);
        dbms_application_info.set_action(l_log_scope);
        l_run_params.process_name := pkg_sync_transcode.gc_process_name;
        l_run_params.method       := pkg_utils.gc_method_copy;
        l_run_params.tag          := p_tag;
        pkg_utils.start_run(p_params => l_run_params);

        /* first the clusters in sequence then the rest */

        FOR r IN (SELECT process_name
                  FROM ops_staging_processes
                  WHERE kind = 'M'
                  AND shall_be_processed = 'Y'
                  ORDER BY process_cluster NULLS LAST
                          ,process_cluster_sequence)
        LOOP
            merge_transcode_table(p_process_name => r.process_name);
        END LOOP;

    END sync_transcode;

    PROCEDURE truncate_error_table(p_base_table_name IN pkg_utils.table_name) IS
    BEGIN
        EXECUTE IMMEDIATE ' truncate table dl_staging4pibics_intf.err$_' || p_base_table_name;
    END truncate_error_table;

    PROCEDURE delete_warnings_error_table(p_base_table_name IN pkg_utils.table_name) IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        EXECUTE IMMEDIATE 'delete  from dl_staging4pibics_intf.err$_' || p_base_table_name ||
                          ' where pkg_utils.is_warning(ora_err_mesg$) = 1';
        COMMIT;
    END delete_warnings_error_table;

    PROCEDURE reset_sync_counters IS
    BEGIN
        FOR r IN (SELECT sync_table_name
                        ,pibics_table_cd
                  FROM dl_staging4pibics_intf.ops_sync_processes)
        LOOP
            pkg_utils.reset_sync_counter(p_sync_table      => r.sync_table_name
                                        ,p_pibics_table_cd => r.pibics_table_cd);
        END LOOP;

    END reset_sync_counters;

    PROCEDURE refresh_sync_counters IS
        l_tab pkg_utils.tablenames_tab;
        l_tmp pkg_utils.tablenames;
    BEGIN
        reset_sync_counters;
        l_tab := pkg_utils.get_tablenames_backend;
        FOR i IN l_tab.first .. l_tab.last
        LOOP
            l_tmp := l_tab(i);
            --     dbms_output.put_line(l_tmp.sync_table || '/' || l_tmp.backend_table);
            pkg_utils.update_sync_counter(p_tablenames => l_tmp);
        END LOOP;

    END refresh_sync_counters;

    PROCEDURE reset_transcode_counters IS
    BEGIN
        FOR r IN (SELECT process_name
                  FROM dl_staging4pibics_intf.ops_staging_processes
                  WHERE kind = 'M')
        LOOP
            pkg_utils.reset_transcode_counter(p_trcd_table => 'TRCD_' || r.process_name);
        END LOOP;
    END reset_transcode_counters;

    PROCEDURE refresh_transcode_counters IS
    BEGIN
        FOR r IN (SELECT process_name
                  FROM dl_staging4pibics_intf.ops_staging_processes
                  WHERE kind = 'M'
                  AND shall_be_processed = 'Y')
        LOOP
            pkg_utils.update_transcode_counter(p_trcd_table => 'TRCD_' || r.process_name);
        END LOOP;
    END refresh_transcode_counters;

    PROCEDURE cleanup_err$_sync_blacklist_cases IS
        PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        -- delete error entries for entries which are now OK
        DELETE FROM err$_sync_blacklist_cases
        WHERE (wlcd, seqno) IN (SELECT wlcd
                                      ,seqno
                                FROM sync_blacklist_cases t
                                WHERE t.pibics_table_cd = 'W' -- watchlist
                                AND (t.case_id IS NOT NULL AND t.identity_id IS NOT NULL));
        DELETE FROM err$_sync_blacklist_cases
        WHERE wlcd IN
              (SELECT wlcd
               FROM sync_blacklist_cases t
               WHERE t.pibics_table_cd = 'L' --lostpassport
               AND (t.case_id IS NOT NULL AND t.identity_id IS NOT NULL AND t.travel_docs_id IS NOT NULL));
        --delete all error entries which are not the newest
        DELETE FROM err$_sync_blacklist_cases
        WHERE entry_id IN (SELECT entry_id
                           FROM (SELECT wlcd
                                       ,seqno
                                       ,pibics_table_cd
                                       ,entry_id
                                       ,row_number() over(PARTITION BY wlcd, seqno, pibics_table_cd ORDER BY entry_id DESC) rn
                                 FROM err$_sync_blacklist_cases)
                           WHERE rn > 1);
        COMMIT;
    END cleanup_err$_sync_blacklist_cases;

BEGIN
    pkg_preferences.get_and_use_logger_preferences;
END pkg_operating;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPERATING" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPERATING" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPERATING" TO "TRAINEE";
