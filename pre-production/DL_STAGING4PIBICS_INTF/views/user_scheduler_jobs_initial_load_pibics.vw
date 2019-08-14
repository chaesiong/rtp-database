CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS_INTF"."USER_SCHEDULER_JOBS_INITIAL_LOAD_PIBICS" ("TABLE_NAME", "YYYYMM", "PHASE", "ENABLED", "STATE", "NEXT_OR_LAST_RUN_DATE", "RETRY_COUNT", "FAILURE_COUNT", "JOB_NAME", "COMMENTS") AS 
  WITH transactions AS
 (SELECT table_name
        ,yyyymm
        ,initial_load_jobname
        ,'PHASE1' AS phase
  FROM dl_staging4pibics.cnt_summary_yyyymm
  UNION
  SELECT table_name
        ,yyyymm
        ,initial_load_jobname
        ,'PHASE2' AS phase
  FROM cnt_summary_yyyymm)
SELECT t.table_name
      ,t.yyyymm
      ,t.phase
      ,enabled
      ,state
      ,CASE state
           WHEN 'RETRY SCHEDULED' THEN
            next_run_date
           WHEN 'SUCCEEDED' THEN
            last_start_date
           WHEN 'STOPPED' THEN
            last_start_date
           ELSE
            NULL
       END AS next_or_last_run_date
      ,retry_count
      ,failure_count
      ,job_name
      ,comments
FROM user_scheduler_jobs j
LEFT JOIN transactions t
ON (t.initial_load_jobname = j.job_name)
WHERE job_class = 'INITIAL_LOAD_PIBICS';
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."USER_SCHEDULER_JOBS_INITIAL_LOAD_PIBICS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."USER_SCHEDULER_JOBS_INITIAL_LOAD_PIBICS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."USER_SCHEDULER_JOBS_INITIAL_LOAD_PIBICS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."USER_SCHEDULER_JOBS_INITIAL_LOAD_PIBICS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."USER_SCHEDULER_JOBS_INITIAL_LOAD_PIBICS" TO "DERMALOG_PROXY";
