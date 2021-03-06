CREATE TABLE "PIBICSDM2"."EXT_PERSON_LOG" 
   (	"EXTPERSON_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"EXTPERSON_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"CPASSPORTNO" VARCHAR2(20 CHAR), 
	"EXT_DATE" DATE, 
	"DOCNO" VARCHAR2(50 CHAR), 
	"TM6NO" VARCHAR2(50 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"BIRTH_PLACE" VARCHAR2(50 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"OPASSPORT_PLACE" VARCHAR2(50 CHAR), 
	"OPASSPORT_DATE" DATE, 
	"OPASSPORT_EXPDATE" DATE, 
	"CPASSPORT_PLACE" VARCHAR2(50 CHAR), 
	"CPASSPORT_EXPDATE" DATE, 
	"CPASSPORT_DATE" DATE, 
	"IN_DATE" DATE, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"FROMCOUNT" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"BILDING" VARCHAR2(100 CHAR), 
	"ADDR" VARCHAR2(100 CHAR), 
	"ROAD" VARCHAR2(100 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"POSTCODE" VARCHAR2(5 CHAR), 
	"TEL" VARCHAR2(100 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"REASON_DAY" NUMBER, 
	"APPROVE_STS" CHAR(1 CHAR), 
	"PERMIT_DATE" DATE, 
	"PERSON_STS" CHAR(1 CHAR), 
	"EXT_SEQNO" NUMBER, 
	"FEESLIP_SEQNO" NUMBER, 
	"SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"UDEPT_SEQNO" NUMBER, 
	"PASSPORT_PIC" BLOB, 
	"RQS_STS" CHAR(1 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"BUILDING" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PERSON_LOG" ADD CONSTRAINT "EXT_PERSON_LOG_PK" PRIMARY KEY ("EXTPERSON_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PERSON_LOG_PK" ON "PIBICSDM2"."EXT_PERSON_LOG" ("EXTPERSON_LOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301221C00053$$" ON "PIBICSDM2"."EXT_PERSON_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PERSON_LOG" TO "BIOSAADM";
