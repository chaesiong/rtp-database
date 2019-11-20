CREATE TABLE "PIBICSDM2"."SECRETLEVEL_LOG" 
   (	"SECRET_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"SECRET_SEQNO" NUMBER, 
	"SECRETCD" VARCHAR2(2 CHAR), 
	"SECRETNM" VARCHAR2(60 CHAR), 
	"SECRETFLAG" CHAR(1 CHAR), 
	"SECRETDESC" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."SECRETLEVEL_LOG" ADD CONSTRAINT "SECRETLEVEL_LOG_PK" PRIMARY KEY ("SECRET_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SECRETLEVEL_LOG_PK" ON "PIBICSDM2"."SECRETLEVEL_LOG" ("SECRET_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."SECRETLEVEL_LOG" TO "BIOSAADM";
