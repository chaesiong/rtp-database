CREATE TABLE "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" 
   (	"BACKEND_TABLE_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"SYNC_TABLE_NAME" VARCHAR2(100 CHAR), 
	"ERROR_TABLE_NAME" VARCHAR2(100 CHAR), 
	"KEY_COLUMN_LIST" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"BACKEND" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"SHALL_BE_SYNCED" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"PIBICS_TABLE_CD" VARCHAR2(1 CHAR), 
	"COPY_TARGET_CALL" VARCHAR2(200 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" ADD CONSTRAINT "OPS_BACKEND_PROCESSES_UK" UNIQUE ("BACKEND_TABLE_NAME", "PIBICS_TABLE_CD")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" ADD CONSTRAINT "OPS_BACKEND_PROCESSES_SHALL_BE_SYNCED" CHECK (SHALL_BE_SYNCED in ('Y','N')) ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES"."BACKEND_TABLE_NAME" IS 'Target table of the process ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES"."ERROR_TABLE_NAME" IS 'Error table, several processes might use the same error table ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES"."KEY_COLUMN_LIST" IS 'comma separated list of the columns for the business PK oon our side ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES"."SHALL_BE_SYNCED" IS '(Y)ey, (N)o, No for processes in development and similar situations';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES"."COPY_TARGET_CALL" IS 'PKG_NAME.PROCEDURE_NAME for call to copy target';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES"  IS 'Metatable for the  processes from the sync tables to Bordercontrol';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES_UK" ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" ("BACKEND_TABLE_NAME", "PIBICS_TABLE_CD") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_BACKEND_PROCESSES" TO "TRAINEE";
