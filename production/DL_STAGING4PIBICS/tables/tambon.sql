CREATE TABLE "DL_STAGING4PIBICS"."TAMBON" 
   (	"TMB_SEQNO" NUMBER NOT NULL ENABLE, 
	"TMBCD" VARCHAR2(2 CHAR), 
	"AMP_SEQNO" NUMBER, 
	"TMB_DESC" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"TMB_DESC_EN" VARCHAR2(60 CHAR), 
	"DEPT_SEQNO" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."TAMBON" ADD CONSTRAINT "TAMBON_PK" PRIMARY KEY ("TMB_SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."TAMBON"."TMB_SEQNO" IS 'Surrogate key';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."TAMBON_PK" ON "DL_STAGING4PIBICS"."TAMBON" ("TMB_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."TAMBON" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."TAMBON" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."TAMBON" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."TAMBON" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."TAMBON" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."TAMBON" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."TAMBON" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."TAMBON" TO "BIOSUPPORT";
