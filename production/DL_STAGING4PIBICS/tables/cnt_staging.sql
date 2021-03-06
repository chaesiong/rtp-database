CREATE TABLE "DL_STAGING4PIBICS"."CNT_STAGING" 
   (	"TABLE_NAME" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"CREATE_DATE" DATE, 
	"COUNT" NUMBER DEFAULT 0, 
	"DML_AT" DATE DEFAULT SYSDATE
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."CNT_STAGING" ADD CONSTRAINT "CNT_STAGING_UK" UNIQUE ("TABLE_NAME", "CREATE_DATE")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CNT_STAGING"."TABLE_NAME" IS 'Name of the table for the data';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CNT_STAGING"."CREATE_DATE" IS 'Truncated to date ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CNT_STAGING"."COUNT" IS 'Count of Rows';
   COMMENT ON TABLE "DL_STAGING4PIBICS"."CNT_STAGING"  IS 'Counters for the staging tables, maintained by program';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."CNT_STAGING_UK" ON "DL_STAGING4PIBICS"."CNT_STAGING" ("TABLE_NAME", "CREATE_DATE") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."CNT_STAGING" TO "BIOSAADM";
