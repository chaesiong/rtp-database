CREATE TABLE "PIBICSDM2"."INV_SPMOVEMENT_LOG" 
   (	"SPM_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPM_FROMDATE" DATE, 
	"SPM_TODATE" DATE, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER DEFAULT 1, 
	"SPM_SECURITYLEVEL" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPMOVEMENTLOG_SEQNO" NUMBER, 
	"SPMOVEMENTLOG_DATE" TIMESTAMP (6), 
	"SPMOVEMENTLOG_FLAG" CHAR(1 CHAR), 
	"SPMOVEMENTLOG_USRUPD" VARCHAR2(20 CHAR), 
	"SPM_MOVEMENT" CLOB, 
	"SPM_REMARK" CLOB, 
	"SUSPECTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPMOVEMENT_LOG" ADD CONSTRAINT "INV_SPMOVEMENT_LOG_PK" PRIMARY KEY ("SPMOVEMENTLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPMOVEMENT_LOG" ADD CONSTRAINT "INV_SPMOVEMENT_LOG_R01" FOREIGN KEY ("SUSPECTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT_LOG" ("SUSPECTLOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPMOVEMENT_LOG_PK" ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" ("SPMOVEMENTLOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301583C00016$$" ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301583C00017$$" ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPMOVEMENT_LOG" TO "BIOSAADM";
