CREATE TABLE "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" 
   (	"CD_SEQNO_LOG" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(30 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"CD_SEQNO" NUMBER, 
	"CH_SEQNO" NUMBER, 
	"CD_REFNO" VARCHAR2(30 CHAR), 
	"CD_TYPE" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CD_REFSEQNO" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CH_SEQNO_LOG" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" ADD CONSTRAINT "WF_COVERDOCDETAIL_LOG_PK" PRIMARY KEY ("CD_SEQNO_LOG")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" ADD CONSTRAINT "WF_COVERDOCDETAIL_LOG_R01" FOREIGN KEY ("CH_SEQNO")
	  REFERENCES "PIBICSDM2"."WF_COVERDOCHEADER" ("CH_SEQNO") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_COVERDOCDETAIL_LOG_PK" ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" ("CD_SEQNO_LOG") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WF_COVERDOCDETAIL_LOG" TO "BIOSAADM";
