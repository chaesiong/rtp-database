CREATE TABLE "DL_STAGING4PIBICS"."CONVEYANCE" 
   (	"CONV_SEQNO" NUMBER NOT NULL ENABLE, 
	"CONVCD" CHAR(4 CHAR), 
	"TRAVCD" CHAR(4 CHAR), 
	"CONVTNM" VARCHAR2(60 CHAR), 
	"CONVENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER(1,0)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."CONVEYANCE" ADD CONSTRAINT "CONVEYANCE_PK" PRIMARY KEY ("CONV_SEQNO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CONVEYANCE"."CONV_SEQNO" IS 'Surrogate key ';
   COMMENT ON COLUMN "DL_STAGING4PIBICS"."CONVEYANCE"."VERSION" IS 'Check Query';
  CREATE INDEX "DL_STAGING4PIBICS"."IDX_CONVEYANCE_500" ON "DL_STAGING4PIBICS"."CONVEYANCE" (TO_NUMBER("CONVCD")) 
  ;
CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."CONVEYANCE_PK" ON "DL_STAGING4PIBICS"."CONVEYANCE" ("CONV_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."CONVEYANCE" TO "APPSUP";