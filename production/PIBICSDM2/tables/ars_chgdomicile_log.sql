CREATE TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" 
   (	"CHGDOMICILELOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"CHGDOMICILE_SEQNO" NUMBER, 
	"ALIENCERT_SEQNO" NUMBER, 
	"OOWNERNM" VARCHAR2(60 CHAR), 
	"OADDR" VARCHAR2(10 CHAR), 
	"OMOO" VARCHAR2(10 CHAR), 
	"OROAD" VARCHAR2(15 CHAR), 
	"OTMB_SEQNO" NUMBER, 
	"OAMP_SEQNO" NUMBER, 
	"OPV_SEQNO" NUMBER, 
	"OPOLIS_SEQNO" NUMBER, 
	"OPOLISBH_SEQNO" NUMBER, 
	"OPOLISPV_SEQNO" NUMBER, 
	"MOVE_DATE" DATE, 
	"OSIGNINGBY" VARCHAR2(60 CHAR), 
	"OREGISPOLIS" NUMBER, 
	"OREGISPOLIS_PV" NUMBER, 
	"NOWERNM" VARCHAR2(60 CHAR), 
	"NADDR" VARCHAR2(10 CHAR), 
	"NMOO" VARCHAR2(10 CHAR), 
	"NROAD" VARCHAR2(15 CHAR), 
	"NTMB_SEQNO" NUMBER, 
	"NAMP_SEQNO" NUMBER, 
	"NPV_SEQNO" NUMBER, 
	"NPOLIS_SEQNO" NUMBER, 
	"NPOLISBH_SEQNO" NUMBER, 
	"NPOLISPV_SEQNO" NUMBER, 
	"IN_DATE" DATE, 
	"NSIGNINGBY" VARCHAR2(60 CHAR), 
	"NREGISPOLIS" NUMBER, 
	"NREGISPOLIS_PV" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"OZIPCODE" VARCHAR2(5 CHAR), 
	"NZIPCODE" VARCHAR2(5 CHAR), 
	"ACBH_SEQNO" NUMBER, 
	"TELEPHONEN" VARCHAR2(20 CHAR), 
	"OREGION_SEQNO" NUMBER, 
	"NREGION_SEQNO" NUMBER, 
	"TELEPHONEO" VARCHAR2(20 CHAR), 
	"FLAG" CHAR(1 CHAR), 
	"ALIENCERTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD CONSTRAINT "ARS_CHGDOMICILE_LOG_PK" PRIMARY KEY ("CHGDOMICILELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD CONSTRAINT "ARS_CHGDOMICILE_LOG_R02" FOREIGN KEY ("NPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD CONSTRAINT "ARS_CHGDOMICILE_LOG_R01" FOREIGN KEY ("OPV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD CONSTRAINT "ARS_CHGDOMICILE_LOG_R07" FOREIGN KEY ("OREGISPOLIS_PV")
	  REFERENCES "PIBICSDM2"."PROVINCE_POLIS" ("PVPLS_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD CONSTRAINT "ARS_CHGDOMICILE_LOG_R11" FOREIGN KEY ("NREGISPOLIS_PV")
	  REFERENCES "PIBICSDM2"."PROVINCE_POLIS" ("PVPLS_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD FOREIGN KEY ("OTMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD FOREIGN KEY ("NTMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD FOREIGN KEY ("OAMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD FOREIGN KEY ("NAMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ADD CONSTRAINT "ARS_CHGDOMICILE_LOG_R03" FOREIGN KEY ("ALIENCERT_SEQNO")
	  REFERENCES "PIBICSDM2"."ARS_ALIENCERT" ("ALIENCERT_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ARS_CHGDOMICILE_LOG_PK" ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" ("CHGDOMICILELOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ARS_CHGDOMICILE_LOG" TO "BIOSAADM";
