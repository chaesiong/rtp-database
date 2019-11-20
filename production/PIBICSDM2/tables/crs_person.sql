CREATE TABLE "PIBICSDM2"."CRS_PERSON" 
   (	"CRSPERSON_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNINGNO" NUMBER, 
	"RCNO_YEAR" CHAR(4 CHAR), 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PERMIT_SEQNO" NUMBER, 
	"PERMIT_DATE" DATE, 
	"OPASSPORTNO" VARCHAR2(20 CHAR), 
	"OPASSPORT_DATE" DATE, 
	"OPASSPORTEXP_DATE" DATE, 
	"CPASSPORTNO" VARCHAR2(20 CHAR), 
	"CPASSPORT_DATE" DATE, 
	"CPASSPORTEXP_DATE" DATE, 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"TMTYPE" CHAR(1 CHAR), 
	"TMNO" VARCHAR2(10 CHAR), 
	"CRS_STS" CHAR(1 CHAR), 
	"APPVSTS_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"RCISSUE_BY" VARCHAR2(60 CHAR), 
	"RCISSUE_DATE" DATE, 
	"OCC_DETAIL" VARCHAR2(60 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CRS_PERSON" ADD CONSTRAINT "CRS_PERSON_PK" PRIMARY KEY ("CRSPERSON_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."CRS_PERSON" ADD FOREIGN KEY ("PERMIT_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_PERSON" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CRS_PERSON" ADD FOREIGN KEY ("CERTOFRESIDENCE_SEQNO")
	  REFERENCES "PIBICSDM2"."CRS_CERTOFRESIDENCE" ("CERTOFRESIDENCE_SEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."CRS_PERSON_BIRTHDATE_IDX" ON "PIBICSDM2"."CRS_PERSON" ("BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."CRS_PERSON_CERTOFRESIDENCE_IDX" ON "PIBICSDM2"."CRS_PERSON" ("CERTOFRESIDENCE_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."CRS_PERSON_CPASSPORTNO_IDX" ON "PIBICSDM2"."CRS_PERSON" ("CPASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."CRS_PERSON_CRSSTS_IDX" ON "PIBICSDM2"."CRS_PERSON" ("CRS_STS") 
  ;
CREATE INDEX "PIBICSDM2"."CRS_PERSON_NATIONSEQNO_IDX" ON "PIBICSDM2"."CRS_PERSON" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."CRS_PERSON_OPASSPORTNO_IDX" ON "PIBICSDM2"."CRS_PERSON" ("OPASSPORTNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CRS_PERSON_PK" ON "PIBICSDM2"."CRS_PERSON" ("CRSPERSON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "DL_INTERFACE";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CRS_PERSON" TO "BIOSAADM";
