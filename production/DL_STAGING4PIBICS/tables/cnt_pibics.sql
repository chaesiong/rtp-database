CREATE TABLE "DL_STAGING4PIBICS"."CNT_PIBICS" 
   (	"TABLE_NAME" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"CREATE_DATE" DATE, 
	"COUNT" NUMBER DEFAULT 0, 
	"DML_AT" DATE DEFAULT SYSDATE
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."CNT_PIBICS" ADD CONSTRAINT "CNT_PIBICS_PK" PRIMARY KEY ("TABLE_NAME", "CREATE_DATE")
  USING INDEX (CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."CNT_PIBICS_UK" ON "DL_STAGING4PIBICS"."CNT_PIBICS" ("TABLE_NAME", "CREATE_DATE") 
  )  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CNT_PIBICS"."CREATE_DATE" IS 'Truncated to date';
   COMMENT ON TABLE "DL_STAGING4PIBICS"."CNT_PIBICS"  IS 'Counters for the PIBICS source tables, maintained by program';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."CNT_PIBICS_UK" ON "DL_STAGING4PIBICS"."CNT_PIBICS" ("TABLE_NAME", "CREATE_DATE") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."CNT_PIBICS" TO "BIOSAADM";
