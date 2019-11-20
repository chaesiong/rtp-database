CREATE TABLE "PIBICSDM2"."EDNQ_TM13_LOG" 
   (	"TM13_SEQNO" NUMBER, 
	"TM13NO" NUMBER, 
	"TM13YEAR" CHAR(4 CHAR), 
	"DOC_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"EDNQPERSON_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"TFAMILYNM" VARCHAR2(100 CHAR), 
	"TFIRSTNM" VARCHAR2(100 CHAR), 
	"TMIDDLENM" VARCHAR2(100 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"NATIONCD" CHAR(2 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"BIRTH_PLACE" VARCHAR2(60 CHAR), 
	"BIRTH_CITY" VARCHAR2(60 CHAR), 
	"BIRTH_STATE" VARCHAR2(60 CHAR), 
	"BIRTHCOUNT_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"ALIENCERT_NUMBER" NUMBER, 
	"ALIENCERT_YEAR" CHAR(4 CHAR), 
	"ACISSUE_DATE" DATE, 
	"ACPOLISESTATION_SEQNO" NUMBER, 
	"ACPV_SEQNO" NUMBER, 
	"ACRENEWTYPE" CHAR(1 CHAR), 
	"ACRENEWEXP_DATE" DATE, 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"RCISSUE_DATE" DATE, 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNUNGNO" NUMBER, 
	"RCNO_YEAR" CHAR(4 CHAR), 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"ADDR" VARCHAR2(60 CHAR), 
	"MOO" VARCHAR2(60 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"ROAD" VARCHAR2(60 CHAR), 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(10 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORT_ISSUE" VARCHAR2(50 CHAR), 
	"PASSPORTEXP_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"LEAVE_DATE" DATE, 
	"COUNTCD" CHAR(3 CHAR), 
	"COUNT_SEQNO" NUMBER, 
	"TM13STS" CHAR(1 CHAR), 
	"REASONDESC" VARCHAR2(2000 CHAR), 
	"EDMEXP_DATE" DATE, 
	"FEES_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TM13RUNNINGNO" VARCHAR2(14 CHAR), 
	"OTHERNM" VARCHAR2(100 CHAR), 
	"IN_DATE" DATE, 
	"RCISSUEPV_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"TM13LOG_SEQNO" NUMBER, 
	"LOG_DATE" DATE, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"OCC_DETAIL" VARCHAR2(60 CHAR), 
	"IMGTM13" BLOB, 
	"IMGSTS" CHAR(1 CHAR), 
	"FGPTM13" VARCHAR2(100 CHAR), 
	"FGPREMARK" VARCHAR2(1000 CHAR), 
	"FGPSTS" CHAR(1 CHAR), 
	"FGPMATCHPERCENT" NUMBER, 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"TEL" VARCHAR2(200 CHAR), 
	"CHKRUNNO" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EDNQ_TM13_LOG" ADD CONSTRAINT "EDNQ_TM13_LOG_PK" PRIMARY KEY ("TM13LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EDNQ_TM13_LOG_PK" ON "PIBICSDM2"."EDNQ_TM13_LOG" ("TM13LOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301094C00071$$" ON "PIBICSDM2"."EDNQ_TM13_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EDNQ_TM13_LOG" TO "BIOSAADM";
