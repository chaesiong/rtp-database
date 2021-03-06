CREATE TABLE "PIBICSDM2"."INV_PLPERSON_LOG" 
   (	"PLP_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLP_PASSNO" VARCHAR2(30 CHAR), 
	"PLP_IDCARD" CHAR(13 CHAR), 
	"PLP_TNAME" VARCHAR2(20 CHAR), 
	"PLP_TSNAME" VARCHAR2(20 CHAR), 
	"PLP_ENAME" VARCHAR2(20 CHAR), 
	"PLP_EMNAME" VARCHAR2(20 CHAR), 
	"PLP_ESNAME" VARCHAR2(20 CHAR), 
	"PLP_REMARK" VARCHAR2(600 CHAR), 
	"PLP_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"PLP_RELATEDTYPE" VARCHAR2(20 CHAR), 
	"PLP_OTHER" VARCHAR2(40 CHAR), 
	"PLPERSONLOG_SEQNO" NUMBER, 
	"PLPERSONLOG_DATE" TIMESTAMP (6), 
	"PLPERSONLOG_FLAG" CHAR(1 CHAR), 
	"PLPERSONLOG_USRUPD" VARCHAR2(20 CHAR), 
	"PLACELOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLPERSON_LOG" ADD CONSTRAINT "INV_PLPERSON_LOG_PK" PRIMARY KEY ("PLPERSONLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLPERSON_LOG" ADD CONSTRAINT "INV_PLPERSON_LOG_R01" FOREIGN KEY ("PLACELOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE_LOG" ("PLACELOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLPERSON_LOG_PK" ON "PIBICSDM2"."INV_PLPERSON_LOG" ("PLPERSONLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLPERSON_LOG" TO "BIOSAADM";
