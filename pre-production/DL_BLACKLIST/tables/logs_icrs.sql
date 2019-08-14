CREATE TABLE "DL_BLACKLIST"."LOGS_ICRS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"BLACKLIST_CASE_ID" VARCHAR2(32 CHAR), 
	"NIST_FILE" BLOB, 
	"NIST_FILE_MIMETYPE" VARCHAR2(32 CHAR), 
	"NIST_FILE_NAME" VARCHAR2(255 CHAR), 
	"SERVICE_RESPONSE" CLOB, 
	"SERVICE_SEND" DATE, 
	"SERVICE_RECEIVE" DATE, 
	"SERVICE_RESULT" NUMBER(1,0), 
	"STATUS" CHAR(1 CHAR)
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."LOGS_ICRS" ADD CONSTRAINT "LOGS_ICRS$CK01" CHECK (status IN ('S', 'F', 'T', 'A')) ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."BLACKLIST_CASE_ID" IS 'FK BLACKLIST_CASE';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."NIST_FILE" IS 'NIST file that was send to the webservice (request)';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."NIST_FILE_MIMETYPE" IS 'NIST file mimetype';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."NIST_FILE_NAME" IS 'NIST file name';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."SERVICE_RESPONSE" IS 'Response as JSON from the webservice (response)';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."SERVICE_SEND" IS 'Timestamp the file was sent';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."SERVICE_RECEIVE" IS 'Timestamp the response was received';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."SERVICE_RESULT" IS 'Number of the result (e.g. 0 = not found, 1 = found)';
   COMMENT ON COLUMN "DL_BLACKLIST"."LOGS_ICRS"."STATUS" IS 'Status of the request (S = SEND, F = FINISHED, T = TIMEOUT, A = ABORTED)';
   COMMENT ON TABLE "DL_BLACKLIST"."LOGS_ICRS"  IS 'Log of ICRS webservice';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312645C00008$$" ON "DL_BLACKLIST"."LOGS_ICRS" (
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312645C00011$$" ON "DL_BLACKLIST"."LOGS_ICRS" (
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."LOGS_ICRS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "DL_BORDERCONTROL";
  GRANT UPDATE ON "DL_BLACKLIST"."LOGS_ICRS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."LOGS_ICRS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."LOGS_ICRS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."LOGS_ICRS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."LOGS_ICRS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "TESTADM";
  GRANT INSERT ON "DL_BLACKLIST"."LOGS_ICRS" TO "TRAINEE";
  GRANT SELECT ON "DL_BLACKLIST"."LOGS_ICRS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BLACKLIST"."LOGS_ICRS" TO "TRAINEE";
