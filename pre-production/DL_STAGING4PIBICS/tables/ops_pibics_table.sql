CREATE TABLE "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" 
   (	"TABLE_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"PROCESS_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" ADD CONSTRAINT "OPS_PIBICS_TABLE_PROCESS" FOREIGN KEY ("PROCESS_NAME")
	  REFERENCES "DL_STAGING4PIBICS"."OPS_PIBICS_LOAD_PROCESSES" ("PROCESS_NAME") ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE"."TABLE_NAME" IS 'name of the table in PIBICS';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE"."PROCESS_NAME" IS 'name of the process which works with this PIBICS table';
   COMMENT ON TABLE "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE"  IS 'Metatable for  PIBICS tables These tables belong to a LOAD_PROCESS';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE_PK" ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" ("TABLE_NAME") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."OPS_PIBICS_TABLE" TO "TESTADM";