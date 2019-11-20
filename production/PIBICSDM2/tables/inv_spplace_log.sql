CREATE TABLE "PIBICSDM2"."INV_SPPLACE_LOG" 
   (	"SPP_SEQNO" NUMBER, 
	"SP_SEQNO" NUMBER, 
	"SPP_PLACENAME" VARCHAR2(300 CHAR), 
	"PV_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"TMB_SEQNO" NUMBER, 
	"VERSION" NUMBER DEFAULT 1, 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"ACTFLAG" CHAR(1 CHAR), 
	"SPP_SECURITYLEVEL" NUMBER, 
	"SPPLACELOG_SEQNO" NUMBER, 
	"SPPLACELOG_DATE" TIMESTAMP (6), 
	"SPPLACELOG_FLAG" CHAR(1 CHAR), 
	"SPPLACELOG_USRUPD" VARCHAR2(20 CHAR), 
	"SPP_REMARK" CLOB, 
	"SUSPECTLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_SPPLACE_LOG" ADD CONSTRAINT "INV_SPPLACE_LOG_PK" PRIMARY KEY ("SPPLACELOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPPLACE_LOG" ADD CONSTRAINT "INV_SPPLACE_LOG_R04" FOREIGN KEY ("TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPPLACE_LOG" ADD CONSTRAINT "INV_SPPLACE_LOG_R01" FOREIGN KEY ("SUSPECTLOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_SUSPECT_LOG" ("SUSPECTLOG_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPPLACE_LOG" ADD CONSTRAINT "INV_SPPLACE_LOG_R03" FOREIGN KEY ("AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_SPPLACE_LOG" ADD CONSTRAINT "INV_SPPLACE_LOG_R02" FOREIGN KEY ("PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_SPPLACE_LOG_PK" ON "PIBICSDM2"."INV_SPPLACE_LOG" ("SPPLACELOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301597C00018$$" ON "PIBICSDM2"."INV_SPPLACE_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_SPPLACE_LOG" TO "BIOSAADM";
