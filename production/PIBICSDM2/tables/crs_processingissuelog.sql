CREATE TABLE "PIBICSDM2"."CRS_PROCESSINGISSUELOG" 
   (	"PROCESSINGISSUE_SEQNO" NUMBER, 
	"PROCESSINGNO" VARCHAR2(20 CHAR), 
	"PROCESSING_DATE" DATE, 
	"DEPT_SEQNO" NUMBER, 
	"PROCESSNM" VARCHAR2(60 CHAR), 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"PROCESSING_DETAIL" CLOB, 
	"ISSUE_FLAG" CHAR(1 CHAR), 
	"TFAMILYNM" VARCHAR2(60 CHAR), 
	"TFIRSTNM" VARCHAR2(60 CHAR), 
	"TMIDDLENM" VARCHAR2(60 CHAR), 
	"OTHERNM" VARCHAR2(100 CHAR), 
	"AGE" NUMBER, 
	"RESCERTTYPE_SEQNO" NUMBER, 
	"PROCESSINGISSUELOG_SEQNO" NUMBER, 
	"LOG_FLAG" VARCHAR2(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(60 CHAR), 
	"LOG_DATE" TIMESTAMP (6)
   ) ;
  ALTER TABLE "PIBICSDM2"."CRS_PROCESSINGISSUELOG" ADD CONSTRAINT "CRS_PROCESSIONISSUELOG_PK" PRIMARY KEY ("PROCESSINGISSUELOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."CRS_PROCESSIONISSUELOG_PK" ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" ("PROCESSINGISSUELOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000300972C00017$$" ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CRS_PROCESSINGISSUELOG" TO "BIOSAADM";
