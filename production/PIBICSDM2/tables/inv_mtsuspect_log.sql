CREATE TABLE "PIBICSDM2"."INV_MTSUSPECT_LOG" 
   (	"MTS_SEQNO" NUMBER, 
	"MT_SEQNO" NUMBER, 
	"MT_TNAME" VARCHAR2(30 CHAR), 
	"MT_TSNAME" VARCHAR2(30 CHAR), 
	"MT_ENAME" VARCHAR2(30 CHAR), 
	"MT_EMNAME" VARCHAR2(30 CHAR), 
	"MT_ESNAME" VARCHAR2(30 CHAR), 
	"MTSUSPECTLOG_SEQNO" NUMBER, 
	"MTSUSPECTLOG_DATE" TIMESTAMP (6), 
	"MTSUSPECTLOG_FLAG" CHAR(1 CHAR), 
	"MTSUSPECTLOG_USRUPD" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"MT_IDCARD" VARCHAR2(13 CHAR), 
	"MT_PASSNO" VARCHAR2(20 CHAR), 
	"MASTERFILELOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INV_MTSUSPECT_LOG" ADD CONSTRAINT "INV_MTSUSPECT_LOG_PK" PRIMARY KEY ("MTSUSPECTLOG_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."INV_MTSUSPECT_LOG" ADD CONSTRAINT "INV_MTSUSPECT_LOG_R01" FOREIGN KEY ("MASTERFILELOG_SEQNO")
	  REFERENCES "PIBICSDM2"."INV_MASTERFILE_LOG" ("MASTERFILELOG_SEQNO") ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INV_MTSUSPECT_LOG_PK" ON "PIBICSDM2"."INV_MTSUSPECT_LOG" ("MTSUSPECTLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INV_MTSUSPECT_LOG" TO "BIOSAADM";
