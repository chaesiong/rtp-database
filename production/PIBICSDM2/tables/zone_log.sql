CREATE TABLE "PIBICSDM2"."ZONE_LOG" 
   (	"ZONE_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"ZONE_SEQNO" NUMBER, 
	"SYSTEM_CODE" VARCHAR2(10 CHAR), 
	"ZONENM" VARCHAR2(50 CHAR), 
	"REMARK" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."ZONE_LOG_PK" ON "PIBICSDM2"."ZONE_LOG" ("ZONE_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ZONE_LOG" TO "BIOSAADM";
