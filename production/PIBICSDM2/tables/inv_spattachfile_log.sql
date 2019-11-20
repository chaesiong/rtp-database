CREATE TABLE "PIBICSDM2"."INV_SPATTACHFILE_LOG" 
   (	"SPAT_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPAT_FILENAME" VARCHAR2(30 CHAR), 
	"SPAT_FILEPATH" VARCHAR2(60 CHAR), 
	"SPAT_SECURITYLEVEL" NUMBER, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPATTACHFILELOG_SEQNO" NUMBER, 
	"SPATTACHFILELOG_DATE" TIMESTAMP (6), 
	"SPATTACHFILELOG_FLAG" CHAR(1 CHAR), 
	"SPATTACHFILELOG_USRUPD" VARCHAR2(20 CHAR), 
	"SUSPECTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPATTACHFILE_LOG" ADD CONSTRAINT "INV_SPATTACHFILE_LOG_PK" PRIMARY KEY ("SPATTACHFILELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPATTACHFILE_LOG" ADD CONSTRAINT "INV_SPATTACHFILE_LOG_R01" FOREIGN KEY ("SUSPECTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT_LOG" ("SUSPECTLOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPATTACHFILE_LOG_PK" ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" ("SPATTACHFILELOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPATTACHFILE_LOG" TO "BIOSAADM";
