CREATE TABLE "PIBICSDM2"."INV_PLMOVEMENT_LOG" 
   (	"PLM_SEQNO" NUMBER, 
	"PL_SEQNO" NUMBER, 
	"PLM_FROMDATE" DATE, 
	"PLM_TODATE" DATE, 
	"PLM_SECURITYLEVEL" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"PLMOVEMENTLOG_SEQNO" NUMBER, 
	"PLMOVEMENTLOG_DATE" TIMESTAMP (6), 
	"PLMOVEMENTLOG_FLAG" CHAR(1 CHAR), 
	"PLMOVEMENTLOG_USRUPD" VARCHAR2(20 CHAR), 
	"PLM_MOVEMENT" CLOB, 
	"PLM_REMARK" CLOB, 
	"PLACELOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_PLMOVEMENT_LOG" ADD CONSTRAINT "INV_PLMOVEMENT_LOG_PK" PRIMARY KEY ("PLMOVEMENTLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_PLMOVEMENT_LOG" ADD CONSTRAINT "INV_PLMOVEMENT_LOG_R01" FOREIGN KEY ("PLACELOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_PLACE_LOG" ("PLACELOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_PLMOVEMENT_LOG_PK" ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" ("PLMOVEMENTLOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301531C00016$$" ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301531C00017$$" ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_PLMOVEMENT_LOG" TO "BIOSAADM";
