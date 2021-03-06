CREATE TABLE "PIBICSDM2"."EXT_PROCESS_LOG" 
   (	"PROC_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"PROC_SEQNO" NUMBER, 
	"DOCNO" VARCHAR2(50 CHAR), 
	"DOCNO_YEAR" VARCHAR2(5 CHAR), 
	"GOVSECTION" VARCHAR2(100 CHAR), 
	"GOVAT_1" VARCHAR2(100 CHAR), 
	"GOVAT_2" VARCHAR2(100 CHAR), 
	"PROC_TO" VARCHAR2(100 CHAR), 
	"DOC_TEL" VARCHAR2(100 CHAR), 
	"DOC_DATE" DATE, 
	"IN_DATE" DATE, 
	"VISASTATUS" CHAR(1 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISA_EXPDATE" DATE, 
	"REMARK1" VARCHAR2(1000 CHAR), 
	"EXT_DATE" DATE, 
	"EXT_DAY" NUMBER, 
	"APPROVESTS" CHAR(1 CHAR), 
	"PERMIT_DATE" DATE, 
	"DISAPP_REASON" VARCHAR2(200 CHAR), 
	"REMARK4" VARCHAR2(1000 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"REMARK2_1" VARCHAR2(1000 CHAR), 
	"REMARK2_2" VARCHAR2(1000 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"REASON_SEQNO" NUMBER, 
	"U_RANK_SEQNO" NUMBER, 
	"U_NAME" VARCHAR2(150 CHAR), 
	"U_POSTLEVEL" VARCHAR2(150 CHAR), 
	"P_RANK_SEQNO" NUMBER, 
	"P_NAME" VARCHAR2(150 CHAR), 
	"P_POSTLEVEL" VARCHAR2(150 CHAR), 
	"PROVE_DATE" DATE, 
	"PROVE_BY" VARCHAR2(120 CHAR), 
	"COMPANYNM" VARCHAR2(1000 CHAR), 
	"O_DOCNO" VARCHAR2(50 CHAR), 
	"O_DOCNO_YEAR" VARCHAR2(5 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"PROVE_ID" VARCHAR2(20 CHAR), 
	"VISA_DATE" DATE, 
	"WPERMIT_DATE" DATE, 
	"WEPERMIT_DATE" DATE, 
	"PRESENT_BY" VARCHAR2(120 CHAR), 
	"PRESENT_ID" VARCHAR2(20 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"VISATYPESUB_SEQNO" NUMBER, 
	"STATUS_OFFLINE" VARCHAR2(1 CHAR), 
	"EXT_REASON_FLAG" CHAR(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_PROCESS_LOG" ADD CONSTRAINT "EXT_PROCESS_LOG_PK" PRIMARY KEY ("PROC_LOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_PROCESS_LOG_PK" ON "PIBICSDM2"."EXT_PROCESS_LOG" ("PROC_LOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXT_PROCESS_LOG" TO "BIOSAADM";
