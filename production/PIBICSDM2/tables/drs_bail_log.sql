CREATE TABLE "PIBICSDM2"."DRS_BAIL_LOG" 
   (	"BAIL_SEQNO" NUMBER, 
	"BAILTYPE" CHAR(1 CHAR), 
	"DOCNO" VARCHAR2(15 CHAR), 
	"DOC_DATE" DATE, 
	"BAIL_DATE" DATE, 
	"BAILEXP_DATE" DATE, 
	"AMNTCASH" NUMBER(12,2), 
	"AMNT_DAYS" NUMBER, 
	"BAILPURPOSE" VARCHAR2(200 CHAR), 
	"BUILD" VARCHAR2(50 CHAR), 
	"ADDR" VARCHAR2(50 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"TELENO" VARCHAR2(100 CHAR), 
	"MOBILENO" VARCHAR2(100 CHAR), 
	"CONTRACTSTS" CHAR(1 CHAR), 
	"CONTRACTSTS_NOTE" VARCHAR2(200 CHAR), 
	"APPROVESTS" CHAR(1 CHAR), 
	"APPROVESTS_NOTE" VARCHAR2(200 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"BAILNAME" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DETAINEE_NUMBER" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(50 CHAR), 
	"BAIL_LOG_SEQNO" NUMBER, 
	"APPVDATE" DATE, 
	"APPVNO" VARCHAR2(100 CHAR), 
	"APPVBY" CHAR(1 CHAR), 
	"APPOINT_DATE1" DATE, 
	"APPOINT_DATE2" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_BAIL_LOG" ADD PRIMARY KEY ("BAIL_LOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAIL_LOG" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAIL_LOG" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_BAIL_LOG" ADD FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207136" ON "PIBICSDM2"."DRS_BAIL_LOG" ("BAIL_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_BAIL_LOG" TO "BIOSAADM";
