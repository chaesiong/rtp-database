CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_OPS_TRANSACTIONAL" AS
    g_log_scope_prefix CONSTANT logger_logs.scope%TYPE := lower($$PLSQL_UNIT_OWNER) || '.' || lower($$PLSQL_UNIT) || '.';

    err_not_existing_job EXCEPTION;
    PRAGMA EXCEPTION_INIT(err_not_existing_job
                         ,-27476);
    PROCEDURE keep_current(p_process_name IN pkg_utils.table_name
                          ,p_tag          IN log_run_steps.tag%TYPE) IS
    BEGIN
        EXECUTE IMMEDIATE 'begin dl_staging4pibics_intf.pkg_st_' || p_process_name ||
                          '.keep_current(p_tag => :tag); end ;'
            USING p_tag;

    END keep_current;

    PROCEDURE keep_current_all(p_tag IN log_run_steps.tag%TYPE) IS
    BEGIN
        FOR r IN (SELECT DISTINCT table_name AS table_name
                  FROM dl_staging4pibics_intf.cnt_summary_yyyymm
                  WHERE table_name IN (SELECT DISTINCT substr(NAME
                                                             ,8
                                                             ,99) AS table_name
                                       FROM user_source
                                       WHERE TYPE = 'PACKAGE'
                                       AND NAME LIKE 'PKG_ST%')

                  ORDER BY table_name ASC)
        LOOP
            keep_current(p_process_name => r.table_name
                        ,p_tag          => p_tag);
        END LOOP;

    END keep_current_all;

    PROCEDURE insert_yyyymm(p_process_name           IN pkg_utils.table_name
                           ,p_yyyymm                 IN pkg_utils.yyyymm
                           ,p_tag                    IN log_run_steps.tag%TYPE
                           ,p_include_copy_to_target IN BOOLEAN) IS
    BEGIN
        EXECUTE IMMEDIATE 'begin pkg_st_' || p_process_name ||
                          '.initial_load_for_yyyymm(p_yyyymm => :yyyymm  ,p_tag => :stag  , p_include_copy_to_target => :incl) ; end ;'
            USING p_yyyymm, p_tag, p_include_copy_to_target;
    END insert_yyyymm;

    PROCEDURE start_initial_load_job(p_jobname     IN VARCHAR2
                                    ,p_jobaction   IN VARCHAR2
                                    ,p_jobcomments IN VARCHAR2) IS
        l_job       user_scheduler_jobs%ROWTYPE;
        l_log_scope logger_logs.scope%TYPE := g_log_scope_prefix || 'submit_initial_load_job';
    BEGIN
        SELECT *
        INTO l_job
        FROM user_scheduler_jobs t
        WHERE t.job_name = p_jobname;
        CASE
            WHEN l_job.state IN ('RUNNING'
                                ,'SUCCEEDED') THEN
                NULL;
            WHEN l_job.state IN ('FAILED'
                                ,'RETRY SCHEDULED'
                                ,'STOPPED') THEN
                dbms_scheduler.disable(p_jobname); --reset failure count and try again
                dbms_scheduler.enable(p_jobname);
                logger.log(p_jobname || ' was in state ' || l_job.state || ' and shall start now again'
                          ,l_log_scope);

            ELSE
                logger.log(p_jobname || ' is in state ' || l_job.state ||
                           ' No action taken by submit_insert_yyyymm_job'
                          ,l_log_scope);
        END CASE;
    EXCEPTION
        WHEN no_data_found THEN
            dbms_scheduler.create_job(job_name   => p_jobname
                                     ,job_type   => 'PLSQL_BLOCK'
                                     ,job_class  => pkg_maintenance.gc_initial_load_jobclass
                                     ,job_action => p_jobaction
                                     ,enabled    => TRUE
                                     ,auto_drop  => FALSE
                                     ,comments   => p_jobcomments);
            dbms_scheduler.set_attribute(NAME      => p_jobname
                                        ,attribute => 'MAX_FAILURES'
                                        ,VALUE     => 5);
            dbms_scheduler.set_attribute(NAME      => p_jobname
                                        ,attribute => 'RESTART_ON_FAILURE'
                                        ,VALUE     => TRUE);
            logger.log(p_jobname || ' newly created and submitted'
                      ,l_log_scope);
        WHEN OTHERS THEN
            RAISE;
    END start_initial_load_job;

    PROCEDURE submit_job_insert_yyyymm_phase1(p_process_name IN pkg_utils.table_name
                                             ,p_yyyymm       IN pkg_utils.yyyymm) IS
        l_jobname VARCHAR2(200) := NULL;
    BEGIN
        l_jobname := 'INITIAL_LOAD_PHASE1_' || p_process_name || '_' || p_yyyymm;
        start_initial_load_job(p_jobname     => l_jobname
                              ,p_jobaction   => q'[BEGIN dl_staging4pibics_intf.load_phase1(p_process => ']' ||
                                                 p_process_name || q'[', p_yyyymm => ']' || p_yyyymm || q'['); END;]'
                              ,p_jobcomments => 'initial load for ' || p_process_name ||
                                                ' from  PIBICS  to STAGING (Phase 1) for timeframe ' || p_yyyymm);
    END submit_job_insert_yyyymm_phase1;

    PROCEDURE submit_job_insert_yyyymm_phase2(p_process_name           IN pkg_utils.table_name
                                             ,p_yyyymm                 IN pkg_utils.yyyymm
                                             ,p_include_copy_to_target IN BOOLEAN) IS
        l_jobname VARCHAR2(200) := NULL;
    BEGIN
        l_jobname := 'INITIAL_LOAD_PHASE2_' || p_process_name || '_' || p_yyyymm;
        start_initial_load_job(p_jobname     => l_jobname
                              ,p_jobaction   => q'[BEGIN dl_staging4pibics_intf.load_phase2(p_process => ']' ||
                                                 p_process_name || q'[', p_yyyymm => ']' || p_yyyymm ||
                                                 q'[', p_include_copy_to_target => ]' || CASE
                                                    WHEN p_include_copy_to_target THEN
                                                     'TRUE'
                                                    ELSE
                                                     'FALSE'
                                                END || q'[); END;]'
                              ,p_jobcomments => 'initial load for ' || p_process_name ||
                                                ' from  STAGING  to DL_BORDERCONTROL (Phase 2) for timeframe ' || p_yyyymm);

    END submit_job_insert_yyyymm_phase2;

    PROCEDURE submit_job_insert_yyyymm_start_to_end(p_process_name           IN pkg_utils.table_name
                                                   ,p_yyyymm                 IN pkg_utils.yyyymm
                                                   ,p_include_copy_to_target IN BOOLEAN) IS
        l_jobname VARCHAR2(200) := NULL;
    BEGIN
        l_jobname := 'INITIAL_LOAD_COMPLE_' || p_process_name || '_' || p_yyyymm;
        start_initial_load_job(p_jobname     => l_jobname
                              ,p_jobaction   => q'[BEGIN dl_staging4pibics_intf.load_phase1(p_process => ']' ||
                                                 p_process_name || q'[', p_yyyymm => ']' || p_yyyymm ||
                                                 q'['); dl_staging4pibics_intf.load_phase2(p_process => ']' ||
                                                 p_process_name || q'[', p_yyyymm => ']' || p_yyyymm ||
                                                 q'[', p_include_copy_to_target => ]' || CASE
                                                    WHEN p_include_copy_to_target THEN
                                                     'TRUE'
                                                    ELSE
                                                     'FALSE'
                                                END || q'[); END;]'
                              ,p_jobcomments => 'initial load for ' || p_process_name ||
                                                ' from  PIBICS to DL_BORDERCONTROL(Phase 1 and Phase 2) for timeframe ' ||
                                                p_yyyymm);
    END submit_job_insert_yyyymm_start_to_end;

    PROCEDURE submit_job_copy_tmmain(p_lowest_tmrunno_to_copy  IN dl_staging4pibics.cnt_tmmain.lowest_tmrunno_to_copy%TYPE
                                    ,p_highest_tmrunno_to_copy IN dl_staging4pibics.cnt_tmmain.highest_tmrunno_to_copy%TYPE) IS
        l_jobname VARCHAR2(200) := NULL;
    BEGIN
        l_jobname := 'INITIAL_LOAD_TMMAIN_' || p_lowest_tmrunno_to_copy || '_' || p_highest_tmrunno_to_copy;
        start_initial_load_job(p_jobname     => l_jobname
                              ,p_jobaction   => q'[BEGIN dl_staging4pibics_intf.load_tmmain(p_lowest_tmrunno_to_copy  => ']' ||
                                                 p_lowest_tmrunno_to_copy || q'[', p_highest_tmrunno_to_copy => ']' ||
                                                 p_highest_tmrunno_to_copy || q'[');  END;]'
                              ,p_jobcomments => 'initial load for TMMAIN      from  PIBICS to DL_BORDERCONTROL, ' ||
                                                p_lowest_tmrunno_to_copy || ' to ' || p_highest_tmrunno_to_copy);
    END submit_job_copy_tmmain;
BEGIN
    pkg_preferences.get_and_use_logger_preferences;
END pkg_ops_transactional;

--
--   Public
--
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPS_TRANSACTIONAL" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPS_TRANSACTIONAL" TO "PIBICSAPP";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPS_TRANSACTIONAL" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_OPS_TRANSACTIONAL" TO "BIOSUPPORT";
