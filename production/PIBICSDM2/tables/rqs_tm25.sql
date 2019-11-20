CREATE TABLE "PIBICSDM2"."RQS_TM25" 
   (	"TM25_SEQNO" NUMBER, 
	"REQUESTTYPETM" CHAR(1 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"TMNO" CHAR(3 CHAR), 
	"RUNNINGNO" CHAR(3 CHAR), 
	"YEAR" CHAR(4 CHAR), 
	"APPLYTM_DATE" DATE, 
	"SUFFIX_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" NUMBER, 
	"OCC_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORTISSUE" VARCHAR2(60 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORTEXP_DATE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"TRAVEL_FROM" VARCHAR2(60 CHAR), 
	"ARRVDEPT_SEQNO" NUMBER, 
	"ARRV_DATE" DATE, 
	"TM6TYPE" CHAR(1 CHAR), 
	"TM6NO" VARCHAR2(20 CHAR), 
	"ADDR" VARCHAR2(500 CHAR), 
	"TELEPHONENO" VARCHAR2(200 CHAR), 
	"REASONEXTENSION" VARCHAR2(2000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TM_SEQNO" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"PERMIT_DATE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_TM25" ADD CONSTRAINT "RQS_TM25_PK" PRIMARY KEY ("TM25_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_TM25_PK" ON "PIBICSDM2"."RQS_TM25" ("TM25_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_TM25" TO "BIOSAADM";
