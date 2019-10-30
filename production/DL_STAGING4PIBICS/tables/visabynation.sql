CREATE TABLE "DL_STAGING4PIBICS"."VISABYNATION" 
   (	"VISAN_SEQNO" NUMBER NOT NULL ENABLE, 
	"COUNTCD" VARCHAR2(3 CHAR), 
	"VISATYPECD" VARCHAR2(4 CHAR), 
	"DEFAULTVISA" VARCHAR2(1 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"COUNT_SEQNO" NUMBER, 
	"VISA_SEQNO" NUMBER, 
	"VISATYPECDORG" VARCHAR2(4 CHAR), 
	"FIXDEPTLINE" VARCHAR2(1 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_STAGING4PIBICS"."VISABYNATION" ADD CONSTRAINT "VISABYNATIONR_PK" PRIMARY KEY ("VISAN_SEQNO")
  USING INDEX (CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."VISABYNATION_PK" ON "DL_STAGING4PIBICS"."VISABYNATION" ("VISAN_SEQNO") 
  )  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."VISABYNATION_PK" ON "DL_STAGING4PIBICS"."VISABYNATION" ("VISAN_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."VISABYNATION" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."VISABYNATION" TO "BIOSUPPORT";
