CREATE TABLE "DL_INTERFACE"."LOG_BLACKLIST_HITS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"SENDER_SYSTEM" VARCHAR2(100 CHAR), 
	"SENDER_USER" VARCHAR2(100 CHAR), 
	"SENDER_OBJECT_ID" VARCHAR2(100 CHAR), 
	"SENDER_REQUEST" CLOB NOT NULL ENABLE, 
	"RESPONSE" CLOB NOT NULL ENABLE, 
	"ELAPSED_TIME_SECONDS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"NUMBER_OF_HITS" NUMBER DEFAULT ON NULL 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_INTERFACE"."LOG_BLACKLIST_HITS" ADD CONSTRAINT "LOG_BLACKLIST_HITS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."DML_TYPE" IS 'Audit (I.nsert, U.pdate, D.elete)';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."SENDER_SYSTEM" IS 'System what sent the request (e.g. BMBS)';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."SENDER_USER" IS 'Username of the user who sent the request';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."SENDER_OBJECT_ID" IS 'ID of the object that raises the blacklist hit';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."SENDER_REQUEST" IS 'JSON code of the request that was send';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."RESPONSE" IS 'Response of the blacklist service';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."ELAPSED_TIME_SECONDS" IS 'Elapsed time in seconds it took to send a resoonse';
   COMMENT ON COLUMN "DL_INTERFACE"."LOG_BLACKLIST_HITS"."NUMBER_OF_HITS" IS 'Number of hits the blacklist response got';
  CREATE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_I1" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" ("INS_AT") 
  ;
CREATE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS_I2" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" ("SENDER_OBJECT_ID") 
  ;
CREATE UNIQUE INDEX "DL_INTERFACE"."LOG_BLACKLIST_HITS$PK" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000313579C00010$$" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" (
  ;
CREATE UNIQUE INDEX "DL_INTERFACE"."SYS_IL0000313579C00011$$" ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" (
  ;
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "SERVAPP";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "BIO_BD";
  GRANT DELETE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "APPSUP";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "TESTADM";
  GRANT SELECT ON "DL_INTERFACE"."LOG_BLACKLIST_HITS" TO "TRAINEE";
