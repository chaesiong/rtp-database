CREATE TABLE "DL_STAGING4PIBICS"."RANKCRW" 
   (	"RANKCRW_SEQNO" NUMBER NOT NULL ENABLE, 
	"RANKFULLNM" VARCHAR2(30 CHAR), 
	"RANKNM" VARCHAR2(20 CHAR), 
	"CREATE_BY" VARCHAR2(20), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1), 
	"CONV_SEQNO" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."RANKCRW" ADD CONSTRAINT "RANKCRW_PK" PRIMARY KEY ("RANKCRW_SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."RANKCRW"."RANKCRW_SEQNO" IS 'Surrogate key';
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."RANKCRW_PK" ON "DL_STAGING4PIBICS"."RANKCRW" ("RANKCRW_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."RANKCRW" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RANKCRW" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RANKCRW" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RANKCRW" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."RANKCRW" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."RANKCRW" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."RANKCRW" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."RANKCRW" TO "BIOSUPPORT";
