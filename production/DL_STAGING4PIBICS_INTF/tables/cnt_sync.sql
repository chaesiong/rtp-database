CREATE TABLE "DL_STAGING4PIBICS_INTF"."CNT_SYNC" 
   (	"SYNC_TABLE_NAME" VARCHAR2(30 CHAR) NOT NULL ENABLE, 
	"PIBICS_TABLE_CD" VARCHAR2(1 CHAR), 
	"CREATE_DATE_DAY" DATE NOT NULL ENABLE, 
	"COUNT" NUMBER DEFAULT 0, 
	"TO_INSERT" NUMBER DEFAULT 0, 
	"TO_UPDATE" NUMBER DEFAULT 0, 
	"TO_BE_IGNORED" NUMBER DEFAULT 0, 
	"DML_AT" TIMESTAMP (6) DEFAULT systimestamp NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."CNT_SYNC" ADD CONSTRAINT "CNT_SYNC_UK" UNIQUE ("SYNC_TABLE_NAME", "PIBICS_TABLE_CD", "CREATE_DATE_DAY")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."SYNC_TABLE_NAME" IS 'Name of the  syn table for the data';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."PIBICS_TABLE_CD" IS 'When the synctable is used  in several backend processed. This column mus exist in the sync_able with the same name and value ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."CREATE_DATE_DAY" IS 'Truncated to date ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."COUNT" IS 'Count of Rows';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."TO_INSERT" IS 'Number of rows to  insert, because some target keys are not filled , only not ignored rows ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."TO_UPDATE" IS 'Number of rows to insert or update , because PIBICS information is newer , but the data ia already copied in the target table , only not ignored rows ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."CNT_SYNC"."TO_BE_IGNORED" IS 'Number of rows which are known garbage and should not be processeed further ';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."CNT_SYNC"  IS 'Counters for the staging tables, maintained by program. Several staging tables may feed one sync table and  several staging_tables might feed one sync table. This is a n:m relation';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."CNT_SYNC_UK" ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" ("SYNC_TABLE_NAME", "PIBICS_TABLE_CD", "CREATE_DATE_DAY") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."CNT_SYNC" TO "BIOSUPPORT";
