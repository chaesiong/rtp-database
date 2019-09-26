CREATE TABLE "PIBICSDM2"."RQS_REVOKETM14" 
   (	"REVOKETM14_SEQNO" NUMBER, 
	"TM14_SEQNO" NUMBER, 
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
  ALTER TABLE "PIBICSDM2"."RQS_REVOKETM14" ADD CONSTRAINT "RQS_REVOKETM14_PK" PRIMARY KEY ("REVOKETM14_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."RQS_REVOKETM14_PK" ON "PIBICSDM2"."RQS_REVOKETM14" ("REVOKETM14_SEQNO") 
  ;
