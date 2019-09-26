CREATE TABLE "PIBICSDM2"."RANKORG" 
   (	"RANK_SEQNO" NUMBER, 
	"RANKID" CHAR(2 CHAR), 
	"RANKNM" VARCHAR2(60 CHAR), 
	"RANKFULLNM" VARCHAR2(60 CHAR), 
	"RANKLEVEL" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
