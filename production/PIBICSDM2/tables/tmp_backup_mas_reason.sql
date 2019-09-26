CREATE TABLE "PIBICSDM2"."TMP_BACKUP_MAS_REASON" 
   (	"REASON_SEQNO" NUMBER, 
	"REASONCD" CHAR(2 CHAR), 
	"REASONNM" VARCHAR2(100 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER
   ) ;
