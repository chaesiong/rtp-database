CREATE TABLE "PIBICSDM2"."PROVINCE_POLIS" 
   (	"PVPLS_SEQNO" NUMBER, 
	"LOC_CODE" VARCHAR2(6 CHAR), 
	"LOC_NAME" VARCHAR2(60 CHAR), 
	"LOC_ABBR_NAME" VARCHAR2(40 CHAR), 
	"LOC_LONG_NAME" VARCHAR2(120 CHAR), 
	"LOC_REP_NAME" VARCHAR2(120 CHAR), 
	"LOC_POST_CODE" VARCHAR2(5 CHAR), 
	"LOC_ENAME" VARCHAR2(80 CHAR), 
	"LOC_ABBR_ENAME" VARCHAR2(60 CHAR), 
	"LOC_LONG_ENAME" VARCHAR2(150 CHAR), 
	"LOC_REP_ENAME" VARCHAR2(150 CHAR), 
	"PROV_CODE" VARCHAR2(2 CHAR), 
	"AMP_CODE" VARCHAR2(2 CHAR), 
	"TUMBON_CODE" VARCHAR2(2 CHAR), 
	"UPD_ID" VARCHAR2(13 CHAR), 
	"UPD_DATE" DATE, 
	"LOC_TRAFF_CODE" VARCHAR2(3 CHAR), 
	"VERSION" NUMBER, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."PROVINCE_POLIS" ADD CONSTRAINT "PROVINCE_POLIS_TMP_PK" PRIMARY KEY ("PVPLS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."PROVINCE_POLIS_TMP_PK" ON "PIBICSDM2"."PROVINCE_POLIS" ("PVPLS_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."PROVINCE_POLIS" TO "BIOSAADM";
