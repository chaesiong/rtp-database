CREATE TABLE "PIBICSDM2"."FILEDLYLOG" 
   (	"FILEDLYLOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"FILEDLY_SEQNO" NUMBER, 
	"ATTACHDLY_SEQNO" NUMBER, 
	"FILEPATH" VARCHAR2(100 CHAR), 
	"FILEDESC" VARCHAR2(250 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ATTACHDLYLOG_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."FILEDLYLOG" ADD CONSTRAINT "FILEDLYLOG_PK" PRIMARY KEY ("FILEDLYLOG_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."FILEDLYLOG_PK" ON "PIBICSDM2"."FILEDLYLOG" ("FILEDLYLOG_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FILEDLYLOG" TO "BIOSAADM";
