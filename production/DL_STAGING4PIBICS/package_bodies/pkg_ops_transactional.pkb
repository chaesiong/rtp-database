CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" AS

    gc_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';
    --
    -- P U B L I C
    --

    PROCEDURE merge_yyyymmdd(p_process_name         IN pkg_utils.process_name
                            ,p_create_date_yyyymmdd IN pkg_utils.yyyymmdd
                            ,p_tag                  IN log_run_steps.tag%TYPE) IS
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'merge_yyyymmdd';
        l_run_params  pkg_utils.run_params;
        l_step_params pkg_utils.step_params;
    BEGIN
        l_run_params.process_name := p_process_name;
        l_run_params.tag          := p_tag;
        pkg_utils.start_run(p_params => l_run_params);
        logger.log('START ' || p_process_name
                  ,l_log_scope);

        l_step_params.table_name := p_process_name;
        l_step_params.timeframe  := p_create_date_yyyymmdd;
        EXECUTE IMMEDIATE 'BEGIN PKG_' || p_process_name || '.merge_yyyymmdd(p_step_params => :step_params); END;'
            USING l_step_params;
        logger.log(p_text  => 'END ' || p_process_name || ' ' || p_create_date_yyyymmdd
                  ,p_scope => l_log_scope);
    END merge_yyyymmdd;

    PROCEDURE merge_date_complete(p_date                      IN DATE DEFAULT trunc(SYSDATE)
                                 ,p_tag                       IN log_run_steps.tag%TYPE DEFAULT NULL
                                 ,p_refresh_pibics_mvs_before IN BOOLEAN DEFAULT FALSE) IS
        l_tag         log_run_steps.tag%TYPE := p_tag;
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'merge_date_complete';
        l_run_params  pkg_utils.run_params;
        l_step_params pkg_utils.step_params;
        l_cnt         PLS_INTEGER := 0;
    BEGIN
        IF l_tag IS NULL THEN
            l_tag := 'merge_complete_date ' || to_char(SYSDATE
                                                      ,'YYYYMMDD HH24:MI:SS');
        END IF;
        l_run_params.tag          := l_tag;
        l_run_params.process_name := pkg_utils.gc_p_many;
        pkg_utils.start_run(p_params => l_run_params);
        logger.log('START'
                  ,l_log_scope);
        IF p_refresh_pibics_mvs_before THEN
            pkg_operating.refresh_all_pibics_counter;
        END IF;
        FOR r IN (SELECT table_name
                  FROM dl_staging4pibics.cnt_summary
                  WHERE pibics_count > 0
                  AND create_date = trunc(p_date))
        LOOP
            l_cnt := l_cnt + 1;

            l_step_params.table_name := r.table_name;
            l_step_params.timeframe  := to_char(p_date
                                               ,'YYYYMMDD');
            sys.dbms_application_info.set_client_info(l_log_scope || ', processing ' || l_step_params.table_name || '/' ||
                                                      l_step_params.timeframe);
            EXECUTE IMMEDIATE 'BEGIN PKG_' || l_step_params.table_name ||
                              '.merge_yyyymmdd(p_step_params => :step_params); END;'
                USING l_step_params;
        END LOOP;
        sys.dbms_application_info.set_client_info(NULL);
        logger.log(p_text  => 'END ' || p_date || ' , cnt. steps ' || l_cnt
                  ,p_scope => l_log_scope);
    END merge_date_complete;

    PROCEDURE insert_yyyymm(p_process_name       IN pkg_utils.process_name
                           ,p_create_date_yyyymm IN pkg_utils.yyyymm
                           ,p_tag                IN log_run_steps.tag%TYPE) IS
        l_log_scope             logger_logs.scope%TYPE := gc_log_scope_prefix || 'insert_yyyymm';
        l_run_params            pkg_utils.run_params;
        l_step_params           pkg_utils.step_params;
        l_cnt_already_processed NUMBER;
    BEGIN
        l_run_params.process_name := p_process_name;
        l_run_params.tag          := p_tag;
        pkg_utils.start_run(p_params => l_run_params);
        logger.log('START ' || p_process_name
                  ,l_log_scope);

        l_step_params.table_name := p_process_name;
        l_step_params.timeframe  := p_create_date_yyyymm;
        l_cnt_already_processed  := pkg_utils.get_already_processed(p_table_name       => p_process_name
                                                                   ,p_create_date_yyyy => l_step_params.timeframe);
        IF l_cnt_already_processed > 0 THEN
            logger.log_warning(p_process_name || ' data exists for  ' || l_step_params.timeframe ||
                               ', insert_yyyymm will not execute.'
                              ,l_log_scope);
            RETURN;
        END IF;
        EXECUTE IMMEDIATE 'BEGIN PKG_' || p_process_name || '.insert_yyyymm(p_step_params => :step_params); END;'
            USING l_step_params;
        logger.log(p_text  => 'END ' || p_process_name || ' ' || p_create_date_yyyymm
                  ,p_scope => l_log_scope);
    END insert_yyyymm;

    PROCEDURE insert_all_yyyymm_processwise(p_process_name       IN pkg_utils.process_name
                                           ,p_tag                IN log_run_steps.tag%TYPE
                                           ,p_gather_stats_after IN BOOLEAN DEFAULT TRUE) AS
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'insert_all_yyyymm_process';
        l_run_params  pkg_utils.run_params;
        l_step_params pkg_utils.step_params;
        l_cnt         PLS_INTEGER := 0;
    BEGIN
        l_run_params.process_name := p_process_name;
        l_run_params.tag          := p_tag;
        pkg_utils.start_run(p_params => l_run_params);
        logger.log('START ' || p_process_name
                  ,l_log_scope);
        FOR r IN (SELECT trunc(create_date
                              ,'MM') AS create_date
                        ,coalesce(SUM(pibics_count)
                                 ,0) pibics_count
                        ,coalesce(SUM(staging_count)
                                 ,0) staging_count
                  FROM dl_staging4pibics.cnt_summary
                  WHERE table_name = p_process_name
                  GROUP BY table_name
                          ,trunc(create_date
                                ,'MM')
                  HAVING coalesce(SUM(staging_count), 0) = 0 AND coalesce(SUM(pibics_count), 0) > 0)
        LOOP
            l_cnt                    := l_cnt + 1;
            l_step_params.table_name := p_process_name;
            l_step_params.timeframe  := to_char(r.create_date
                                               ,'YYYYMM');
            sys.dbms_application_info.set_client_info(l_log_scope || ', processing ' || p_process_name || '/' ||
                                                      l_step_params.timeframe);
            BEGIN
                EXECUTE IMMEDIATE 'BEGIN PKG_' || p_process_name ||
                                  '.insert_yyyymm(p_step_params => :step_params); END;'
                    USING l_step_params;
            EXCEPTION
                WHEN dup_val_on_index THEN
                    logger.log_error(p_text  => p_process_name || '/' || l_step_params.timeframe ||
                                                pkg_utils.gc_txt_duplicate_key_error
                                    ,p_scope => l_log_scope);
            END;
        END LOOP;
        IF p_gather_stats_after THEN
            sys.dbms_application_info.set_client_info('Getting statitics for DL_STAGING4PIBICS.' || p_process_name);
            sys.dbms_stats.gather_table_stats(ownname          => 'DL_STAGING4PIBICS'
                                             ,tabname          => p_process_name
                                             ,cascade          => TRUE
                                             ,estimate_percent => 10
                                             ,method_opt       => 'for all indexed columns size 1'
                                             ,granularity      => 'ALL'
                                             ,degree           => 4);

        END IF;
        sys.dbms_application_info.set_client_info(NULL);
        logger.log(p_text  => 'END ' || p_process_name || ' , cnt. steps ' || l_cnt
                  ,p_scope => l_log_scope);

    END insert_all_yyyymm_processwise;

    PROCEDURE insert_all_yyyymm_timewise(p_yyyymm IN pkg_utils.yyyymm
                                        ,p_tag    IN log_run_steps.tag%TYPE) AS
        l_log_scope   logger_logs.scope%TYPE := gc_log_scope_prefix || 'insert_all_yyyymm_timewise';
        l_run_params  pkg_utils.run_params;
        l_step_params pkg_utils.step_params;
        l_cnt         PLS_INTEGER := 0;
    BEGIN
        l_run_params.process_name := pkg_utils.gc_p_many;
        l_run_params.tag          := p_tag;
        pkg_utils.start_run(p_params => l_run_params);
        logger.log('START ' || p_yyyymm
                  ,l_log_scope);
        FOR r IN (SELECT table_name
                        ,coalesce(SUM(pibics_count)
                                 ,0) pibics_count
                        ,coalesce(SUM(staging_count)
                                 ,0) staging_count
                  FROM dl_staging4pibics.cnt_summary
                  WHERE to_char(create_date
                               ,'YYYYMM') = p_yyyymm
                  GROUP BY table_name
                          ,trunc(create_date
                                ,'MM')
                  HAVING coalesce(SUM(staging_count), 0) = 0 AND coalesce(SUM(pibics_count), 0) > 0)
        LOOP
            l_cnt := l_cnt + 1;
            sys.dbms_application_info.set_client_info(l_log_scope || ', processing ' || r.table_name || '/' ||
                                                      l_step_params.timeframe);
            l_step_params.timeframe  := p_yyyymm;
            l_step_params.table_name := r.table_name;
            BEGIN
                EXECUTE IMMEDIATE 'BEGIN PKG_' || r.table_name || '.insert_yyyymm(p_step_params => :step_params); END;'
                    USING l_step_params;
            EXCEPTION
                WHEN dup_val_on_index THEN
                    logger.log_error(p_text  => r.table_name || '/' || l_step_params.timeframe ||
                                                pkg_utils.gc_txt_duplicate_key_error
                                    ,p_scope => l_log_scope);
            END;
        END LOOP;
        sys.dbms_application_info.set_client_info(NULL);
        logger.log(p_text  => 'END ' || p_yyyymm || ' , cnt. steps ' || l_cnt
                  ,p_scope => l_log_scope);

    END insert_all_yyyymm_timewise;

    PROCEDURE insert_loop_yyyymm_process(p_tag                       IN log_run_steps.tag%TYPE DEFAULT NULL
                                        ,p_refresh_pibics_mvs_before IN BOOLEAN DEFAULT FALSE
                                        ,p_gather_stats_after        IN BOOLEAN DEFAULT TRUE) IS
        l_tag log_run_steps.tag%TYPE := p_tag;
    BEGIN
        IF l_tag IS NULL THEN
            l_tag := 'insert_loop_yyyymm_process ' || to_char(SYSDATE
                                                             ,'YYYYMMDD HH24:MI:SS');
        END IF;
        IF p_refresh_pibics_mvs_before THEN
            pkg_operating.refresh_all_pibics_counter;
        END IF;
        FOR r IN (SELECT table_name
                        ,coalesce(SUM(pibics_count)
                                 ,0) pibics_count
                        ,coalesce(SUM(staging_count)
                                 ,0) staging_count
                  FROM dl_staging4pibics.cnt_summary
                  WHERE trunc(create_date -- only completed months
                             ,'MM') < trunc(SYSDATE
                                           ,'MM')
                  GROUP BY table_name
                  HAVING coalesce(SUM(staging_count), 0) = 0 AND coalesce(SUM(pibics_count), 0) > 0)
        LOOP
            pkg_ops_transactional.insert_all_yyyymm_processwise(p_process_name       => r.table_name
                                                               ,p_tag                => l_tag
                                                               ,p_gather_stats_after => p_gather_stats_after);

        END LOOP;
    END insert_loop_yyyymm_process;

    PROCEDURE insert_loop_yyyymm_time(p_tag                       IN log_run_steps.tag%TYPE DEFAULT NULL
                                     ,p_refresh_pibics_mvs_before IN BOOLEAN DEFAULT FALSE
                                     ,p_gather_schema_stats_after IN BOOLEAN DEFAULT TRUE) IS
        l_tag log_run_steps.tag%TYPE := p_tag;
    BEGIN
        IF l_tag IS NULL THEN
            l_tag := 'insert_loop_yyyymm_process ' || to_char(SYSDATE
                                                             ,'YYYYMMDD HH24:MI:SS');
        END IF;
        IF p_refresh_pibics_mvs_before THEN
            pkg_operating.refresh_all_pibics_counter;
        END IF;
        FOR r IN (SELECT trunc(create_date
                              ,'MM') AS create_date
                        ,coalesce(SUM(pibics_count)
                                 ,0) pibics_count
                        ,coalesce(SUM(staging_count)
                                 ,0) staging_count
                  FROM dl_staging4pibics.cnt_summary
                  WHERE trunc(create_date
                             ,'MM') < trunc(SYSDATE
                                           ,'MM')
                  GROUP BY trunc(create_date
                                ,'MM')
                  HAVING coalesce(SUM(staging_count), 0) = 0 AND coalesce(SUM(pibics_count), 0) > 0
                  ORDER BY trunc(create_date
                                ,'MM') DESC) -- backward in time
        LOOP
            pkg_ops_transactional.insert_all_yyyymm_timewise(p_yyyymm => to_char(r.create_date
                                                                                ,'YYYYMM')
                                                            ,p_tag    => l_tag);
        END LOOP;
        IF p_gather_schema_stats_after THEN
            sys.dbms_application_info.set_client_info('Getting scheme statitics for DL_STAGING4PIBICS');
            sys.dbms_stats.gather_schema_stats(ownname          => 'DL_STAGING4PIBICS'
                                              ,cascade          => TRUE
                                              ,estimate_percent => 10
                                              ,method_opt       => 'for all indexed columns size 1'
                                              ,granularity      => 'ALL'
                                              ,degree           => 4);
            sys.dbms_application_info.set_client_info(NULL);
        END IF;
    END insert_loop_yyyymm_time;

BEGIN
    pkg_utils.get_and_use_logger_preferences;

END pkg_ops_transactional;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" TO "DL_STAGING4PIBICS_INTF";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" TO "BIOSUPPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_OPS_TRANSACTIONAL" TO "BIOSAADM";
