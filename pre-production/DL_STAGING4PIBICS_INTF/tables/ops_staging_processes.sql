CREATE TABLE "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" 
   (	"PROCESS_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"KIND" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"PROCESS_CLUSTER" VARCHAR2(100 CHAR), 
	"PROCESS_CLUSTER_SEQUENCE" NUMBER, 
	"SHALL_BE_PROCESSED" VARCHAR2(1 CHAR) NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" ADD CONSTRAINT "PIBICS_SYNC_PROCESSES_PK" PRIMARY KEY ("PROCESS_NAME")
  USING INDEX (CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES_PK" ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" ("PROCESS_NAME") 
  )  ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" ADD CONSTRAINT "OPS_STAGING_PROCESSES_CHK_KIND" CHECK (KIND in ('M', 'B')) ENABLE;
  ALTER TABLE "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" ADD CONSTRAINT "OPS_STAGING_PROCESSES_CHK_PROCESSED" CHECK (shall_be_processed in ('Y','N')) ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES"."PROCESS_NAME" IS 'mostly the name of the table in staging';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES"."KIND" IS '(M) ranscode (B) usiness-transaction';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES"."PROCESS_CLUSTER" IS 'Some processes are clustered, they have dependencies, this the name of the cluster';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES"."PROCESS_CLUSTER_SEQUENCE" IS 'the clustered processes are ordered in the cluster. This number controls the order';
   COMMENT ON COLUMN "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES"."SHALL_BE_PROCESSED" IS '(Y)ey, (N)o, No for processes in development and similar situations';
   COMMENT ON TABLE "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES"  IS 'Metatable for the dofferent sync-processes in the system';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES_PK" ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" ("PROCESS_NAME") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "TESTADM";
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."OPS_STAGING_PROCESSES" TO "TRAINEE";
