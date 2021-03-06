CREATE TABLE "PIBICSDM2"."WF_APARTMENT_LOG" 
   (	"APTLOG_SEQNO" NUMBER, 
	"LOG_DATE" TIMESTAMP (6), 
	"LOG_FLAG" VARCHAR2(1 CHAR), 
	"LOG_USERID" VARCHAR2(30 CHAR), 
	"APT_SEQNO" NUMBER, 
	"APT_ROOMNO" VARCHAR2(5 CHAR), 
	"APT_WATER_METERNO" VARCHAR2(20 CHAR), 
	"APT_REMARK" VARCHAR2(500 CHAR), 
	"ACTFLAG" VARCHAR2(1 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"BD_ID" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."WF_APARTMENT_LOG" ADD CONSTRAINT "WF_APARTMENT_LOG_PK" PRIMARY KEY ("APTLOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."WF_APARTMENT_LOG_PK" ON "PIBICSDM2"."WF_APARTMENT_LOG" ("APTLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WF_APARTMENT_LOG" TO "BIOSAADM";
