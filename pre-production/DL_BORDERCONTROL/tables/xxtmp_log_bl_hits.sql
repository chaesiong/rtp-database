CREATE TABLE "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"SENDER_SYSTEM" VARCHAR2(100 CHAR), 
	"SENDER_USER" VARCHAR2(100 CHAR), 
	"SENDER_OBJECT_ID" VARCHAR2(100 CHAR), 
	"SENDER_REQUEST" CLOB NOT NULL ENABLE, 
	"RESPONSE" CLOB NOT NULL ENABLE, 
	"ELAPSED_TIME_SECONDS" NUMBER NOT NULL ENABLE, 
	"NUMBER_OF_HITS" NUMBER NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" ADD CONSTRAINT "XXTMP_LOG_BL_HITS_PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  CREATE INDEX "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS_IDX1" ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" ("NUMBER_OF_HITS") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS_JIDX" ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" (JSON_VALUE("SENDER_REQUEST" FORMAT JSON , '$.demographic.passportNumber' RETURNING VARCHAR2(4000) NULL ON ERROR)) 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000372932C00010$$" ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000372932C00011$$" ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS_PK" ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."XXTMP_LOG_BL_HITS" TO "TESTADM";
