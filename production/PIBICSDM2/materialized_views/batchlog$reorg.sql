CREATE MATERIALIZED VIEW "PIBICSDM2"."BATCHLOG$REORG" ("BATCHLOGNO", "BATCH_SRC", "FILE_TYPE", "FILE_NAME", "FILE_SIZE", "TOTALROW", "PRROW", "ERRROW", "STARTPROCESS", "ENDPROCESS", "STATUS", "CREUSR", "CREDTE", "TFSTATUS", "TOTALINS", "TOTALUPD", "TOTALDEL", "NOTE", "DATAFILEERROR", "TRANSFERDTE")
  ON PREBUILT TABLE WITH REDUCED PRECISION
  USING INDEX 
  REFRESH FAST ON DEMAND
  WITH PRIMARY KEY USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE ON QUERY COMPUTATION DISABLE QUERY REWRITE
  AS SELECT "BATCHLOG"."BATCHLOGNO" "BATCHLOGNO","BATCHLOG"."BATCH_SRC" "BATCH_SRC","BATCHLOG"."FILE_TYPE" "FILE_TYPE","BATCHLOG"."FILE_NAME" "FILE_NAME","BATCHLOG"."FILE_SIZE" "FILE_SIZE","BATCHLOG"."TOTALROW" "TOTALROW","BATCHLOG"."PRROW" "PRROW","BATCHLOG"."ERRROW" "ERRROW","BATCHLOG"."STARTPROCESS" "STARTPROCESS","BATCHLOG"."ENDPROCESS" "ENDPROCESS","BATCHLOG"."STATUS" "STATUS","BATCHLOG"."CREUSR" "CREUSR","BATCHLOG"."CREDTE" "CREDTE","BATCHLOG"."TFSTATUS" "TFSTATUS","BATCHLOG"."TOTALINS" "TOTALINS","BATCHLOG"."TOTALUPD" "TOTALUPD","BATCHLOG"."TOTALDEL" "TOTALDEL","BATCHLOG"."NOTE" "NOTE","BATCHLOG"."DATAFILEERROR" "DATAFILEERROR","BATCHLOG"."TRANSFERDTE" "TRANSFERDTE" FROM "PIBICS"."BATCHLOG" "BATCHLOG";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."BATCHLOG$REORG" TO "BIOSAADM";
