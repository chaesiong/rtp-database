CREATE TABLE "PIBICSDM2"."EF_TRANSFER_DATA" 
   (	"ROUNDNO" NUMBER, 
	"TYPEDATA" CHAR(1 CHAR), 
	"RECORDCOUNT" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"STATUS" CHAR(1 CHAR), 
	"STARTTIME" VARCHAR2(20 CHAR), 
	"ENDTIME" VARCHAR2(20 CHAR), 
	"ISSUCCESS" CHAR(1 CHAR), 
	"MSG_ERR" VARCHAR2(500 CHAR), 
	"DATE_REQUEST" VARCHAR2(8 CHAR)
   ) ;
