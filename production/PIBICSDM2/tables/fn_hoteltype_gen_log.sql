CREATE TABLE "PIBICSDM2"."FN_HOTELTYPE_GEN_LOG" 
   (	"HTYPEGEN_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"HTYPEGEN_SEQNO" NUMBER, 
	"HTYPE_SEQNO" NUMBER, 
	"SUBTYPE_FLAG" CHAR(1 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER, 
	"SHORTNESS" CHAR(1 CHAR)
   ) ;
