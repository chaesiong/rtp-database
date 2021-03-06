CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_RQS_DOCEXAMINATION" 
   (	"DOCEXAMINATION_SEQNO" NUMBER, 
	"TMTYPE" CHAR(1 CHAR), 
	"TM_SEQNO" NUMBER, 
	"DETAILED_EXAM" VARCHAR2(1000 CHAR), 
	"EXAM_SDATE" DATE, 
	"EXAM_RDATE" DATE, 
	"TEST_RESULT" VARCHAR2(300 CHAR), 
	"REMARK" VARCHAR2(1000 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_RQS_DOCEXAMINATION" ADD CONSTRAINT "TMP_SYNC_MAS_RQS_DOCEXAMINATION_PK" PRIMARY KEY ("DOCEXAMINATION_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_RQS_DOCEXAMINATION_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_RQS_DOCEXAMINATION" ("DOCEXAMINATION_SEQNO") 
  ;
