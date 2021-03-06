CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_RQS_REVOKETM9" 
   (	"REVOKETM9_SEQNO" NUMBER, 
	"TM9_SEQNO" NUMBER, 
	"RVKSECTION" VARCHAR2(200 CHAR), 
	"RVKDETAIL" VARCHAR2(2000 CHAR), 
	"RVK_DATE" DATE, 
	"RVKMEETING" VARCHAR2(20 CHAR), 
	"INTERIORMINISTER" VARCHAR2(100 CHAR), 
	"ORDERRVK_DATE" DATE, 
	"NOTICEINFO" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_RQS_REVOKETM9" ADD CONSTRAINT "TMP_SYNC_MAS_RQS_REVOKETM9_PK" PRIMARY KEY ("REVOKETM9_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_RQS_REVOKETM9_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_RQS_REVOKETM9" ("REVOKETM9_SEQNO") 
  ;
