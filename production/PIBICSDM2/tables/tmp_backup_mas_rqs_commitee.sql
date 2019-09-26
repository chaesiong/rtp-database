CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_RQS_COMMITEE" 
   (	"COMMITEE_SEQNO" NUMBER, 
	"TMTYPE" CHAR(1 CHAR), 
	"TM_SEQNO" NUMBER, 
	"CMEETING_NO" VARCHAR2(20 CHAR), 
	"CMEETING_DATE" DATE, 
	"CREMARK" VARCHAR2(1000 CHAR), 
	"CRESOLVE" CHAR(2 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"CR_DETAIL" VARCHAR2(200 CHAR)
   ) ;
