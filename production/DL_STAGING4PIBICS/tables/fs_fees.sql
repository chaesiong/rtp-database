CREATE TABLE "DL_STAGING4PIBICS"."FS_FEES" 
   (	"FEES_SEQNO" NUMBER NOT NULL ENABLE, 
	"FEESNO" VARCHAR2(50 CHAR), 
	"FEESLIPNO" VARCHAR2(20 CHAR), 
	"FEESLIPBOOKNO" VARCHAR2(20 CHAR), 
	"FEESLIPDATE" TIMESTAMP (6), 
	"FEESLIPTOTAL" NUMBER(10,2), 
	"PRINTFLAG" VARCHAR2(1 CHAR), 
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
	"FEESSTATUS" VARCHAR2(10 CHAR), 
	"FEESREMARK" VARCHAR2(200 CHAR), 
	"FLAG_SYSTEM" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_IP" VARCHAR2(20 CHAR), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_IP" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER(10,0), 
	"SLIPTYPE" VARCHAR2(1 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"APPROVE_BY" VARCHAR2(20 CHAR)
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."FS_FEES" ADD CONSTRAINT "FS_FEES_PK" PRIMARY KEY ("FEES_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."FS_FEES_PK" ON "DL_STAGING4PIBICS"."FS_FEES" ("FEES_SEQNO") 
  ;
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_FEES" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_FEES" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_FEES" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_FEES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_FEES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_FEES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."FS_FEES" TO "BIOSAADM";
