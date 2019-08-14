CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM" ("PROCESS", "YYYYMM", "PIBICS_COUNT", "PIBICS_DML_AT") AS 
  (SELECT table_name  AS process
        ,dl_staging4pibics_intf.pkg_utils.get_yyyymm(create_date) AS yyyymm
        ,coalesce(SUM(pibics_count)
                 ,0) AS pibics_count
        ,MAX(pibics_dml_at) AS pibics_dml_at
  FROM dl_staging4pibics.cnt_summary s
  GROUP BY table_name
          ,dl_staging4pibics_intf.pkg_utils.get_yyyymm(create_date)
  HAVING coalesce(SUM(staging_count), 0) = 0);
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM"  IS 'These combinations of PROCESS and YYYYMM can be inserted in phase 1 because no target data exists in the STAGING table';
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."CNT_PHASE1_INSERT_YYYYMM" TO "DERMALOG_PROXY";
