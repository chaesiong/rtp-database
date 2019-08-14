CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS_INTF"."PKG_MAINTENANCE" AS
    unknown_job EXCEPTION;
    PRAGMA EXCEPTION_INIT(unknown_job
                         ,-27475);

    object_does_not_exist EXCEPTION;
    PRAGMA EXCEPTION_INIT(object_does_not_exist
                         ,-27476);

    PROCEDURE submit_ongoing_synchronisation_job(p_jobname     IN VARCHAR2
                                                ,p_jobaction   IN VARCHAR2
                                                ,p_jobcomments IN VARCHAR2
                                                ,p_schedule    IN VARCHAR2) IS
    BEGIN
        BEGIN
            dbms_scheduler.drop_job(job_name => p_jobname
                                   ,force    => TRUE);
        EXCEPTION
            WHEN unknown_job THEN
                NULL;
        END;

        dbms_scheduler.create_job(job_name   => p_jobname
                                 ,job_type   => 'PLSQL_BLOCK'
                                 ,job_class  => gc_ongoing_jobclass
                                 ,job_action => p_jobaction
                                 ,enabled    => FALSE
                                 ,auto_drop  => FALSE
                                 ,comments   => p_jobcomments);
        IF p_schedule IS NOT NULL THEN
            dbms_scheduler.set_attribute_null(NAME      => p_jobname
                                             ,attribute => 'SCHEDULE_NAME'); -- yes , this is required for the next set_attribute_null
            dbms_scheduler.set_attribute_null(NAME      => p_jobname
                                             ,attribute => 'START_DATE');
            dbms_scheduler.set_attribute_null(NAME      => p_jobname
                                             ,attribute => 'REPEAT_INTERVAL');

            dbms_scheduler.set_attribute(NAME      => p_jobname
                                        ,attribute => 'SCHEDULE_NAME'
                                        ,VALUE     => p_schedule);
        ELSE
            dbms_scheduler.set_attribute(NAME      => p_jobname
                                        ,attribute => 'MAX_FAILURES'
                                        ,VALUE     => 5);
            dbms_scheduler.set_attribute(NAME      => p_jobname
                                        ,attribute => 'RESTART_ON_FAILURE'
                                        ,VALUE     => TRUE);

        END IF;

    END submit_ongoing_synchronisation_job;

    PROCEDURE disable_ongoing_synchronisation IS
    BEGIN
        FOR r IN (SELECT 'DL_STAGING4PIBICS_INTF.' || job_name AS job
                  FROM user_scheduler_jobs t
                  WHERE t.job_class = gc_ongoing_jobclass)
        LOOP
            BEGIN
                dbms_scheduler.disable(NAME => r.job);
            EXCEPTION
                WHEN OTHERS THEN
                    NULL;
            END;
        END LOOP;
    END disable_ongoing_synchronisation;

    PROCEDURE enable_ongoing_synchronisation IS
    BEGIN
        FOR r IN (SELECT 'DL_STAGING4PIBICS_INTF.' || job_name AS job
                  FROM user_scheduler_jobs t
                  WHERE t.number_of_arguments = 0
                  AND t.job_class = gc_ongoing_jobclass)
        LOOP
            dbms_scheduler.enable(NAME => r.job); -- they will start according to their scheduler
        END LOOP;
    END enable_ongoing_synchronisation;

    PROCEDURE create_or_recreate_ongoing_synchronisation IS
    BEGIN
        BEGIN
            dbms_scheduler.drop_schedule(schedule_name => gc_transactional_data_schedule
                                        ,force         => TRUE);
        EXCEPTION
            WHEN object_does_not_exist THEN
                NULL;
        END;
        dbms_scheduler.create_schedule(schedule_name   => gc_transactional_data_schedule
                                      ,start_date      => SYSDATE + ((1 / 24 / 60) * 1)
                                      ,repeat_interval => 'FREQ=MINUTELY; INTERVAL=23'
                                      ,comments        => 'every some minutes we get the transactional data');

        BEGIN
            dbms_scheduler.drop_schedule(schedule_name => gc_metadata_schedule
                                        ,force         => TRUE);
        EXCEPTION
            WHEN object_does_not_exist THEN
                NULL;
        END;
        dbms_scheduler.create_schedule(schedule_name   => gc_metadata_schedule
                                      ,start_date      => SYSDATE + ((1 / 24 / 60) * 1)
                                      ,repeat_interval => 'FREQ=HOURLY; INTERVAL=23'
                                      ,comments        => 'every some hours we get the metadata');

        FOR r IN (SELECT *
                  FROM dl_staging4pibics.ops_pibics_load_processes t
                  WHERE t.shall_be_synced = 'Y'
                  AND t.kind = 'B')
        LOOP
            submit_ongoing_synchronisation_job(p_jobname     => 'TRANSACTION_DATA_SYNC_' || r.process_name
                                              ,p_jobaction   => q'[BEGIN dl_staging4pibics_intf.keep_current(p_process_name => ']' ||
                                                                 r.process_name || q'['); END;]'
                                              ,p_jobcomments => 'keep ^transactional data current  ' || r.process_name ||
                                                                ' from  PIBICS  to BORDERCONTROL '
                                              ,p_schedule    => gc_transactional_data_schedule);

        END LOOP;
        FOR r IN (SELECT *
                  FROM dl_staging4pibics.ops_pibics_load_processes t
                  WHERE t.shall_be_synced = 'Y'
                  AND t.kind = 'M')
        LOOP
            submit_ongoing_synchronisation_job(p_jobname     => 'METADATA_SYNC_' || r.process_name
                                              ,p_jobaction   => q'[BEGIN dl_staging4pibics_intf.transfer_meta_data(p_process => ']' ||
                                                                 r.process_name || q'['); END;]'
                                              ,p_jobcomments => 'keep metadata current  ' || r.process_name ||
                                                                ' from  PIBICS  to BORDERCONTROL '
                                              ,p_schedule    => gc_metadata_schedule);

        END LOOP;

    END create_or_recreate_ongoing_synchronisation;

    PROCEDURE nuke_the_scheduler IS
    BEGIN

        FOR r IN (SELECT s.schedule_name
                  FROM user_scheduler_schedules s)
        LOOP
            dbms_scheduler.drop_schedule(schedule_name => r.schedule_name
                                        ,force         => TRUE);
        END LOOP;
        FOR r IN (SELECT j.job_name

                  FROM user_scheduler_jobs j)
        LOOP
            dbms_scheduler.drop_job(job_name => r.job_name
                                   ,force    => TRUE);
            dbms_scheduler.purge_log(log_history => 0
                                    ,job_name    => r.job_name);
        END LOOP;

    END nuke_the_scheduler;

END pkg_maintenance;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_MAINTENANCE" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_STAGING4PIBICS_INTF"."PKG_MAINTENANCE" TO "PIBICSAPP";
