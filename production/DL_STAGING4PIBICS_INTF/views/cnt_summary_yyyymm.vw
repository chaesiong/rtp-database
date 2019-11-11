CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" ("TABLE_NAME", "YYYYMM", "STAGING_COUNT", "STAGING_DML_AT", "SYNC_TABLE_NAME", "PIBICS_TABLE_CD", "SYNC_COUNT", "TO_INSERT", "TO_UPDATE", "TO_BE_IGNORED", "SYNC_DML_AT", "INITIAL_LOAD_JOBNAME") AS 
  WITH staging AS
 (SELECT table_name
        ,dl_staging4pibics_intf.pkg_utils.get_yyyymm(create_date) AS yyyymm
        ,coalesce(SUM(staging_count)
                 ,0) AS staging_count
        ,MAX(staging_dml_at) AS staging_dml_at
  FROM dl_staging4pibics.cnt_summary s
  GROUP BY table_name
          ,dl_staging4pibics_intf.pkg_utils.get_yyyymm(create_date)
  HAVING coalesce(SUM(staging_count), 0) > 0),
sync AS
 (SELECT sync_table_name
        ,pibics_table_cd
        ,dl_staging4pibics_intf.pkg_utils.get_yyyymm(create_date_day) AS yyyymm
        ,SUM(COUNT) AS sync_count
        ,MAX(dml_at) AS sync_dml_at
        ,SUM(to_insert) AS to_insert
        ,SUM(to_update) AS to_update
        ,SUM(to_be_ignored) AS to_be_ignored
  FROM dl_staging4pibics_intf.cnt_sync
  GROUP BY sync_table_name
          ,pibics_table_cd
          ,dl_staging4pibics_intf.pkg_utils.get_yyyymm(create_date_day)
  HAVING coalesce(SUM(COUNT), 0) > 0)
SELECT st.table_name
      ,st.yyyymm
      ,staging_count
      ,staging_dml_at
      ,sp.sync_table_name
      ,sy.pibics_table_cd
      ,coalesce(sy.sync_count
               ,0) AS sync_count
      ,coalesce(sy.to_insert
               ,0) AS to_insert
       ,coalesce(sy.to_update
               ,0) AS to_update
       ,coalesce(sy.to_be_ignored
               ,0) AS to_be_ignored
     ,sy.sync_dml_at
    ,'INITIAL_LOAD_PHASE2_' || st.table_name || '_' || st.yyyymm  AS initial_load_jobname
FROM staging st
INNER JOIN dl_staging4pibics_intf.ops_staging_processes p
ON p.process_name = st.table_name
AND p.kind = 'B'
AND p.shall_be_processed = 'Y'
INNER JOIN dl_staging4pibics_intf.ops_sync_processes sp
ON p.process_name = sp.staging_table_name
AND sp.shall_be_processed = 'Y'
LEFT JOIN sync sy
ON sy.sync_table_name = sp.sync_table_name
AND sy.yyyymm = st.yyyymm
AND (sy.pibics_table_cd = sp.pibics_table_cd OR (sy.pibics_table_cd IS NULL AND sp.pibics_table_cd IS NULL));
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM"  IS 'Control view for processes';
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
  GRANT MERGE VIEW ON "DL_STAGING4PIBICS_INTF"."CNT_SUMMARY_YYYYMM" TO "BIOSAADM";
