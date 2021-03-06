CREATE TABLE "PIBICSDM2"."GUARTBANKLOG" 
   (	"GUARTBANKLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"GUARTBANK_SEQNO" NUMBER, 
	"GUARTDEPT_SEQNO" NUMBER, 
	"BANKNM" VARCHAR2(250 CHAR), 
	"BANKDESC" VARCHAR2(250 CHAR), 
	"AMOUNT" NUMBER(38,0), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"GUARTDEPTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."GUARTBANKLOG" ADD CONSTRAINT "GUARTBANKLOG_PK" PRIMARY KEY ("GUARTBANKLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."GUARTBANKLOG" ADD CONSTRAINT "GUARTBANKLOG_R01" FOREIGN KEY ("GUARTDEPTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."GUARTDEPTLOG" ("GUARTDEPTLOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."GUARTBANKLOG_PK" ON "PIBICSDM2"."GUARTBANKLOG" ("GUARTBANKLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."GUARTBANKLOG" TO "BIOSAADM";
