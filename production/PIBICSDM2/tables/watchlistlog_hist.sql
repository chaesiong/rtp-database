CREATE TABLE "PIBICSDM2"."WATCHLISTLOG_HIST" 
   (	"WATCHLISTHISTID" NUMBER, 
	"WATCHLISTLOGID" NUMBER, 
	"DELREMARK" VARCHAR2(1000 CHAR), 
	"LOGUSERID" VARCHAR2(20 CHAR), 
	"LOGFLAG" VARCHAR2(1 CHAR), 
	"LOGDTE" DATE
   ) ;
  ALTER TABLE "PIBICSDM2"."WATCHLISTLOG_HIST" ADD PRIMARY KEY ("WATCHLISTHISTID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00206875" ON "PIBICSDM2"."WATCHLISTLOG_HIST" ("WATCHLISTHISTID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WATCHLISTLOG_HIST" TO "BIOSAADM";
