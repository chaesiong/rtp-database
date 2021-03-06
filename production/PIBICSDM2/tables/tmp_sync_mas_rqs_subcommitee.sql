CREATE TABLE "PIBICSDM2"."TMP_SYNC_MAS_RQS_SUBCOMMITEE" 
   (	"SUBCOMMITEE_SEQNO" NUMBER, 
	"TMTYPE" CHAR(1 CHAR), 
	"TM_SEQNO" NUMBER, 
	"SMEETING_NO" VARCHAR2(20 CHAR), 
	"SMEETING_DATE" DATE, 
	"SREMARK" VARCHAR2(1000 CHAR), 
	"SRESOLVE" CHAR(2 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"SR_DETAIL" VARCHAR2(200 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_SYNC_MAS_RQS_SUBCOMMITEE" ADD CONSTRAINT "TMP_SYNC_MAS_RQS_SUBCOMMITEE_PK" PRIMARY KEY ("SUBCOMMITEE_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."TMP_SYNC_MAS_RQS_SUBCOMMITEE_PK" ON "PIBICSDM2"."TMP_SYNC_MAS_RQS_SUBCOMMITEE" ("SUBCOMMITEE_SEQNO") 
  ;
