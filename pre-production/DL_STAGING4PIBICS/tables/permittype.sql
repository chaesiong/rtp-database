CREATE TABLE "DL_STAGING4PIBICS"."PERMITTYPE" 
   (	"PERMIT_SEQNO" NUMBER NOT NULL ENABLE, 
	"PERMITCD" VARCHAR2(4 CHAR), 
	"PERMITNM" VARCHAR2(60 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."PERMITTYPE" ADD CONSTRAINT "PERMITTYPE_PK" PRIMARY KEY ("PERMIT_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."PERMITTYPE_PK" ON "DL_STAGING4PIBICS"."PERMITTYPE" ("PERMIT_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PERMITTYPE" TO "TESTADM";