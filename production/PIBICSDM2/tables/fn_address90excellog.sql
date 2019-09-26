CREATE TABLE "PIBICSDM2"."FN_ADDRESS90EXCELLOG" 
   (	"FNEXLOGSEQNO" NUMBER, 
	"DEPT_SEQNO" NUMBER, 
	"PROFILE_SEQNO" NUMBER, 
	"FILENAME" VARCHAR2(200 CHAR), 
	"UPLOADSTATUS" CHAR(1 CHAR), 
	"TOTALROW" NUMBER, 
	"PRROW" NUMBER, 
	"ERRROW" NUMBER, 
	"STARTPROCESS" TIMESTAMP (6), 
	"ENDPROCESS" TIMESTAMP (6), 
	"STATUS" CHAR(1 CHAR), 
	"STATUSFILE" CHAR(1 CHAR), 
	"FILEERROR" VARCHAR2(100 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
