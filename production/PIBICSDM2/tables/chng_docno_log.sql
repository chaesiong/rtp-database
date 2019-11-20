CREATE TABLE "PIBICSDM2"."CHNG_DOCNO_LOG" 
   (	"DOCNO_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"DOCNO_SEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"RUNNO" NUMBER, 
	"CTYPE" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"F_TEXT" VARCHAR2(20 CHAR), 
	"L_TEXT" VARCHAR2(20 CHAR), 
	"M_TEXT" VARCHAR2(20 CHAR), 
	"N_DIGIT" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"GOVSECTION" VARCHAR2(50 CHAR), 
	"PROC_TO" VARCHAR2(100 CHAR), 
	"PROC_RUNNO" VARCHAR2(25 CHAR), 
	"TEL" VARCHAR2(20 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CHNG_DOCNO_LOG" TO "BIOSAADM";
