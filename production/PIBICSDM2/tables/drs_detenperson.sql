CREATE TABLE "PIBICSDM2"."DRS_DETENPERSON" 
   (	"DETENPERSON_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(100 CHAR), 
	"EFIRSTNM" VARCHAR2(100 CHAR), 
	"EMIDDLENM" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATIONAL_SEQNO" NUMBER, 
	"AGE" NUMBER, 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"OCCNM" VARCHAR2(200 CHAR), 
	"IDDOCUMENTNO" VARCHAR2(60 CHAR), 
	"IDDOCUMENTTYPE" VARCHAR2(60 CHAR), 
	"IDDOCUMENTISSUE" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"OTHERNM1" VARCHAR2(200 CHAR), 
	"OTHERNM2" VARCHAR2(200 CHAR), 
	"OTHERNM3" VARCHAR2(200 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"AGE_MONTH" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."DRS_DETENPERSON" ADD PRIMARY KEY ("DETENPERSON_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."DRS_DETENPERSON" ADD FOREIGN KEY ("NATIONAL_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ON DELETE CASCADE DISABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."DRS_DETENPERSON_PK" ON "PIBICSDM2"."DRS_DETENPERSON" ("DETENPERSON_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."DRS_DETENPERSON" TO "BIOSAADM";
