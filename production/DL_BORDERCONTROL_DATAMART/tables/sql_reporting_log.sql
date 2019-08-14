CREATE TABLE "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" 
   (	"SQLTEXT_GENERATED" VARCHAR2(4000), 
	"CREATE_TIMESTAMP" TIMESTAMP (6) DEFAULT systimestamp NOT NULL ENABLE, 
	"SQLERR" VARCHAR2(4000), 
	"SQLCODE" VARCHAR2(20)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" ADD CONSTRAINT "SQL_REPORTING_LOG_PK" PRIMARY KEY ("CREATE_TIMESTAMP")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG_PK" ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" ("CREATE_TIMESTAMP") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."SQL_REPORTING_LOG" TO "APPSUP";