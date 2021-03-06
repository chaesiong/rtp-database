CREATE TABLE "DL_STAGING4PIBICS"."FS_FINES" 
   (	"FINES_SEQNO" NUMBER NOT NULL ENABLE, 
	"FINESNO" VARCHAR2(20 CHAR), 
	"FINESLIPNO" VARCHAR2(20 CHAR), 
	"FINESLIPBOOKNO" VARCHAR2(20 CHAR), 
	"FINESLIPDATE" TIMESTAMP (6), 
	"PRINTFLAG" VARCHAR2(1 CHAR), 
	"FINESLIPAMOUNT" NUMBER(10,2), 
	"CHARGEDOF" VARCHAR2(100 CHAR), 
	"CHARGENO" VARCHAR2(20 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"TM6NO" VARCHAR2(7 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"CONV_SEQNO" NUMBER, 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"INDTE" DATE, 
	"VISATYPE_SEQNO" NUMBER, 
	"VISAEXPDTE" DATE, 
	"OUTDTE" DATE, 
	"FINESTATUS" VARCHAR2(10 CHAR), 
	"FINESREMARK" VARCHAR2(1500 CHAR), 
	"FLAG_SYSTEM" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER(10,0), 
	"PERMIT_SEQNO" NUMBER, 
	"PERMIT_DATE" DATE, 
	"SLIPTYPE" VARCHAR2(1 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"STAFF_SEQNO" NUMBER
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."FS_FINES" ADD CONSTRAINT "FS_FINES_PK" PRIMARY KEY ("FINES_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."FS_FINES_PK" ON "DL_STAGING4PIBICS"."FS_FINES" ("FINES_SEQNO") 
  ;
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_FINES" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_FINES" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_FINES" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_FINES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_FINES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_FINES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."FS_FINES" TO "BIOSAADM";
