CREATE TABLE "PIBICSDM2"."EDNQ_PERSON" 
   (	"EDNQPERSON_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_DATE" DATE, 
	"PASSPORTEXP_DATE" DATE, 
	"PERMIT_SEQNO" NUMBER, 
	"EDMEXP_DATE" DATE, 
	"EDMISSUE_BY" VARCHAR2(60 CHAR), 
	"EDMISSUE_DATE" DATE, 
	"TM13_SEQNO" NUMBER, 
	"TM13NO" NUMBER, 
	"TM13YEAR" CHAR(4 CHAR), 
	"TM13STS" CHAR(1 CHAR), 
	"TM22_SEQNO" NUMBER, 
	"TM22NO" NUMBER, 
	"TM22YEAR" CHAR(4 CHAR), 
	"TM22STS" CHAR(1 CHAR), 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"RCNO_PVCD" VARCHAR2(3 CHAR), 
	"RCNO_RUNNINGNO" NUMBER, 
	"RCNO_YEAR" CHAR(4 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"CERTOFRESIDENCE_SEQNO" NUMBER, 
	"NQISSUE_DATE" DATE, 
	"NQISSUE_BY" VARCHAR2(60 CHAR), 
	"TM22TYPE" VARCHAR2(1 CHAR), 
	"STATUSEDNQ" CHAR(1 CHAR), 
	"STATUSEDNQDTE" DATE, 
	"OCC_DETAIL" VARCHAR2(60 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EDNQ_PERSON" ADD CONSTRAINT "EDNQ_PERSON_PK" PRIMARY KEY ("EDNQPERSON_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_PERSON" ADD FOREIGN KEY ("TM13_SEQNO")
	  REFERENCES "PIBICSDM2"."EDNQ_TM13" ("TM13_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_PERSON" ADD FOREIGN KEY ("TM22_SEQNO")
	  REFERENCES "PIBICSDM2"."EDNQ_TM22" ("TM22_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_PERSON" ADD FOREIGN KEY ("PERMIT_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_PERSON" ADD FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."EDNQ_PERSON" ADD FOREIGN KEY ("CERTOFRESIDENCE_SEQNO")
	  REFERENCES "PIBICSDM2"."CRS_CERTOFRESIDENCE" ("CERTOFRESIDENCE_SEQNO") DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EDNQ_PERSON_PK" ON "PIBICSDM2"."EDNQ_PERSON" ("EDNQPERSON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EDNQ_PERSON" TO "BIOSAADM";
