CREATE TABLE "PIBICSDM2"."RQS_PERSON" 
   (	"RQSPERSON_SEQNO" NUMBER, 
	"TM9AND14_SEQNO" NUMBER, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"CPASSPORTNO" VARCHAR2(20 CHAR), 
	"APPLY_DATE" DATE, 
	"DOCNO" VARCHAR2(20 CHAR), 
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
	"DEPT_SEQNO" NUMBER, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"APPRVSTS" CHAR(1 CHAR), 
	"PERMIT_DATE" DATE, 
	"PERSON_STS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"TM_FLAG" VARCHAR2(2 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"STATUSRQS" CHAR(1 CHAR), 
	"STATUSRQSDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."RQS_PERSON" ADD CONSTRAINT "EXT_PERSON_PK" PRIMARY KEY ("RQSPERSON_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "PIBICSDM2"."RQS_PERSON_PK" ON "PIBICSDM2"."RQS_PERSON" ("RQSPERSON_SEQNO") 
  )  ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_PERSON" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PIBICSDM2"."RQS_PERSON" ADD FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ON DELETE CASCADE ENABLE;
  CREATE INDEX "PIBICSDM2"."RQSP_APPRVSTS_IDX" ON "PIBICSDM2"."RQS_PERSON" ("APPRVSTS") 
  ;
CREATE INDEX "PIBICSDM2"."RQSP_BIRTH_DATE_IDX" ON "PIBICSDM2"."RQS_PERSON" ("BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."RQSP_CPASSPORTNO_IDX" ON "PIBICSDM2"."RQS_PERSON" ("CPASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."RQSP_NATION_SEQNO_IDX" ON "PIBICSDM2"."RQS_PERSON" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."RQSP_OPASSPORTNO_IDX" ON "PIBICSDM2"."RQS_PERSON" ("OPASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."RQS_PERSON_PK" ON "PIBICSDM2"."RQS_PERSON" ("RQSPERSON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."RQS_PERSON" TO "BIOSAADM";
