CREATE TABLE "PIBICSDM2"."WF_EDUHEADER_LOG" 
   (	"EH_SEQNO" NUMBER, 
	"EH_SEQNO_LOG" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USERID" VARCHAR2(30 CHAR), 
	"PROFILE_SEQNO" NUMBER, 
	"EH_DOCDATE" DATE, 
	"EH_FISCALYEAR" CHAR(4 CHAR), 
	"EH_TOTALAMT" NUMBER(10,2), 
	"EH_TOTALITEM" NUMBER, 
	"EH_COVERDOCSTATUS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"EH_RUNNINGNO" VARCHAR2(5 CHAR), 
	"EH_YEAR" VARCHAR2(4 CHAR), 
	"NAME" VARCHAR2(30 CHAR), 
	"SNAME" VARCHAR2(50 CHAR), 
	"RANK_SEQNO" VARCHAR2(3 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"POS_SEQNO" VARCHAR2(6 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"USER_DEPT_SEQNO" NUMBER, 
	"USER_DEPTCD" CHAR(3 CHAR), 
	"PAID_STATUS" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_EDUHEADER_LOG" ADD CONSTRAINT "WF_STUDYHEADER_LOG_PK" PRIMARY KEY ("EH_SEQNO_LOG")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_STUDYHEADER_LOG_PK" ON "PIBICSDM2"."WF_EDUHEADER_LOG" ("EH_SEQNO_LOG") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WF_EDUHEADER_LOG" TO "BIOSAADM";
