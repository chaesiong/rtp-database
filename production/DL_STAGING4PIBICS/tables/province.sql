CREATE TABLE "DL_STAGING4PIBICS"."PROVINCE" 
   (	"PV_SEQNO" NUMBER NOT NULL ENABLE, 
	"REG_SEQNO" NUMBER, 
	"PVCD" VARCHAR2(2 CHAR), 
	"PV_DESC" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"NUM_HOTEL" NUMBER DEFAULT 0, 
	"PV_DESC_EN" VARCHAR2(60 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"PL_SEQNO" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."PROVINCE" ADD CONSTRAINT "PROVINCE_PK" PRIMARY KEY ("PV_SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."PROVINCE"."PV_SEQNO" IS 'Surrogate key ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."PROVINCE"."VERSION" IS 'Check Query';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."PROVINCE"."DEPT_SEQNO" IS 'Surrogate key ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."PROVINCE"."PL_SEQNO" IS 'Surrogate key  (policeLocality)';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."PROVINCE_PK" ON "DL_STAGING4PIBICS"."PROVINCE" ("PV_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PROVINCE" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PROVINCE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PROVINCE" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PROVINCE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PROVINCE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PROVINCE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PROVINCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PROVINCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PROVINCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PROVINCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PROVINCE" TO "APPSUP";
