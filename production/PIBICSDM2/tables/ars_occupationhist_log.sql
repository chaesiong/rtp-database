CREATE TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" 
   (	"OCCUPATIONHISTLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"OCCUPATIONHIST_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"LICENSE_NUMBER" VARCHAR2(30 CHAR), 
	"LICENSE_ISSUEPV" NUMBER, 
	"LICENSE_DATE" DATE, 
	"LICENSEEXP_DATE" DATE, 
	"POSITION" VARCHAR2(60 CHAR), 
	"COMPANYNM" VARCHAR2(60 CHAR), 
	"ADDR" VARCHAR2(60 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"TELPHONENO" VARCHAR2(50 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"ALIENCERTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD CONSTRAINT "ARS_OCCUPATIONHIST_LOG_PK" PRIMARY KEY ("OCCUPATIONHISTLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD CONSTRAINT "ARS_OCCUPATIONHIST_LOG_R01" FOREIGN KEY ("LICENSE_ISSUEPV")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ADD FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG_PK" ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" ("OCCUPATIONHISTLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ARS_OCCUPATIONHIST_LOG" TO "BIOSAADM";
