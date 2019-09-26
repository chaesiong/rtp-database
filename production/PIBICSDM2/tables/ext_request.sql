CREATE TABLE "PIBICSDM2"."EXT_REQUEST" 
   (	"REQ_SEQNO" NUMBER, 
	"CANCEL_SEQNO" NUMBER, 
	"DOCNO" VARCHAR2(20 CHAR), 
	"DOCDATE" DATE, 
	"REMARK" VARCHAR2(300 CHAR), 
	"DOC_FILENAME" VARCHAR2(50 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."EXT_REQUEST" ADD CONSTRAINT "EXT_REQUEST_PK" PRIMARY KEY ("REQ_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."EXT_REQUEST_PK" ON "PIBICSDM2"."EXT_REQUEST" ("REQ_SEQNO") 
  ;
