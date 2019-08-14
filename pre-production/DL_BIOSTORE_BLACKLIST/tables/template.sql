CREATE TABLE "DL_BIOSTORE_BLACKLIST"."TEMPLATE" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"DATE_CREATED" TIMESTAMP (6), 
	"TEMPLATE_STATUS" NUMBER(4,0) NOT NULL ENABLE, 
	"SAMPLE_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"VALUE" BLOB
   ) ;
  ALTER TABLE "DL_BIOSTORE_BLACKLIST"."TEMPLATE" ADD CONSTRAINT "TEMPLATE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BIOSTORE_BLACKLIST"."TEMPLATE" ADD CONSTRAINT "FK_TEMPLATE_1" FOREIGN KEY ("SAMPLE_ID")
	  REFERENCES "DL_BIOSTORE_BLACKLIST"."BIOMETRIC_SAMPLE" ("ID") ON DELETE CASCADE ENABLE;
  CREATE INDEX "DL_BIOSTORE_BLACKLIST"."IDX_TEMPLATE_1" ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" ("SAMPLE_ID") 
  ;
CREATE UNIQUE INDEX "DL_BIOSTORE_BLACKLIST"."SYS_IL0000311761C00005$$" ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" (
  ;
CREATE UNIQUE INDEX "DL_BIOSTORE_BLACKLIST"."TEMPLATE_PK" ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" ("ID") 
  ;
  GRANT SELECT ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "SERVAPP";
  GRANT SELECT ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "BIO_BD";
  GRANT DELETE ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BIOSTORE_BLACKLIST"."TEMPLATE" TO "TESTADM";
