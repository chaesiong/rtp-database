CREATE TABLE "PIBICSDM2"."SLTD_LOG" 
   (	"SLTD_LOG_SEQ" NUMBER, 
	"TRAN_DATE" DATE DEFAULT sysdate, 
	"USER_ID" VARCHAR2(30 CHAR), 
	"PROGRAM_ID" VARCHAR2(30 CHAR), 
	"SERVICENAME" VARCHAR2(30 CHAR), 
	"IN_DIN" VARCHAR2(80 CHAR), 
	"IN_COUNTRY_OF_REG" VARCHAR2(3 CHAR), 
	"IN_TYPE_OF_DOC" VARCHAR2(3 CHAR) DEFAULT 'PAS', 
	"IN_ITEM_ID" VARCHAR2(80 CHAR), 
	"OUT_SERVER" VARCHAR2(80 CHAR), 
	"RESULT_CODE" VARCHAR2(80 CHAR), 
	"RESULT_OTHER_CODE" NUMBER, 
	"RESULTCHECK" VARCHAR2(1 CHAR), 
	"NOTE" VARCHAR2(80 CHAR), 
	"OUT_DIN" VARCHAR2(80 CHAR), 
	"OUT_COUNTRY_OF_REG" VARCHAR2(80 CHAR), 
	"OUT_TYPE_OF_DOC" VARCHAR2(80 CHAR), 
	"OUTCOUNTRECORD" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."SLTD_LOG" ADD CONSTRAINT "SLTD_LOG_PK" PRIMARY KEY ("SLTD_LOG_SEQ")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."SLTD_LOG_IND" ON "PIBICSDM2"."SLTD_LOG" ("TRAN_DATE", "IN_DIN") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SLTD_LOG_PK" ON "PIBICSDM2"."SLTD_LOG" ("SLTD_LOG_SEQ") 
  ;