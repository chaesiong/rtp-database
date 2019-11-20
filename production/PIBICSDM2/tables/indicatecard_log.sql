CREATE TABLE "PIBICSDM2"."INDICATECARD_LOG" 
   (	"IDC_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"IDC_SEQNO" NUMBER, 
	"IDCCD" CHAR(4 CHAR), 
	"IDCTNM" VARCHAR2(60 CHAR), 
	"IDCENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."INDICATECARD_LOG" ADD CONSTRAINT "INDICATECARD_LOG_PK" PRIMARY KEY ("IDC_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."INDICATECARD_LOG_PK" ON "PIBICSDM2"."INDICATECARD_LOG" ("IDC_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."INDICATECARD_LOG" TO "BIOSAADM";
