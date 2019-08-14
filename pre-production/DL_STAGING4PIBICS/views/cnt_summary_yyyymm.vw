CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" ("TABLE_NAME", "YYYYMM", "PIBICS_COUNT", "PIBICS_DML_AT_MAX", "STAGING_COUNT", "STAGING_DML_AT_MAX", "INITIAL_LOAD_JOBNAME") AS 
  SELECT p.table_name AS table_name
      ,pkg_utils.get_yyyymm(p.create_date) AS yyyymm
      ,SUM(p.count) AS pibics_count
      ,MAX(p.dml_at) AS pibics_dml_at_max
      ,coalesce(SUM(s.count)
               ,0) AS staging_count
      ,MAX(s.dml_at) AS staging_dml_at_max
      ,'INITIAL_LOAD_PHASE1_' || p.table_name || '_' || pkg_utils.get_yyyymm(p.create_date) AS initial_load_jobname
FROM dl_staging4pibics.cnt_pibics p
LEFT JOIN dl_staging4pibics.cnt_staging s
ON s.table_name = p.table_name
AND s.create_date = p.create_date
GROUP BY p.table_name
        ,pkg_utils.get_yyyymm(p.create_date);
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM"."INITIAL_LOAD_JOBNAME" IS 'For join with DBMS-Scheduler Views';
   COMMENT ON TABLE "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM"  IS 'Overview of counters for PIBICS and STAGUING. PIBICS is the leading table , aggregated on MONTH';
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_SUMMARY_YYYYMM" TO "TESTADM";