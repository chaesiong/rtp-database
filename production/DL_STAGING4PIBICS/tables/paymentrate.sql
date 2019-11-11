CREATE TABLE "DL_STAGING4PIBICS"."PAYMENTRATE" 
   (	"PRATE_SEQNO" NUMBER NOT NULL ENABLE, 
	"PRATENO" VARCHAR2(10 CHAR), 
	"PRATENM" VARCHAR2(500 CHAR), 
	"PRATEAMOUNT" NUMBER(10,2), 
	"LIMITAMOUNT" NUMBER, 
	"PRATETYPE" VARCHAR2(1 CHAR), 
	"FSS_SEQNO" NUMBER, 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG_SYSTEM" VARCHAR2(10 CHAR), 
	"CHARGEDOF" VARCHAR2(200 CHAR), 
	"PRATEABBRENM" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "DL_STAGING4PIBICS"."PAYMENTRATE" ADD CONSTRAINT "PAYMENTRATE_PK" PRIMARY KEY ("PRATE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_STAGING4PIBICS"."PAYMENTRATE_PK" ON "DL_STAGING4PIBICS"."PAYMENTRATE" ("PRATE_SEQNO") 
  ;
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DL_COMMON";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DL_COMMON";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DL_COMMON";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "SERVAPP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIO_BD";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "APPSUP";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT DELETE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT INDEX ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT INSERT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT SELECT ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT READ ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_STAGING4PIBICS"."PAYMENTRATE" TO "BIOSAADM";
