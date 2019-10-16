CREATE TABLE "PIBICSDM2"."SW_UPD_BOILETTER_LOG" 
   (	"SW_UPD_BOILETTER_LOG_SEQNO" NUMBER, 
	"PORT" VARCHAR2(6 CHAR), 
	"REQ_NO" VARCHAR2(20 CHAR), 
	"SUFFIX_SEQNO" NUMBER, 
	"FIRST_NAME" VARCHAR2(60 CHAR), 
	"MIDDLE_NAME" VARCHAR2(60 CHAR), 
	"LAST_NAME" VARCHAR2(60 CHAR), 
	"PASSPORT_NO" VARCHAR2(20 CHAR), 
	"NATIONALITY" VARCHAR2(3 CHAR), 
	"CALLBY_PROGRAM_ID" VARCHAR2(25 CHAR), 
	"CALLBY_USER" VARCHAR2(20 CHAR), 
	"CALLBY_IPADDRESS" VARCHAR2(20 CHAR), 
	"CALL_DATE" TIMESTAMP (6)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."SW_UPD_BOILETTER_LOG_PK" ON "PIBICSDM2"."SW_UPD_BOILETTER_LOG" ("SW_UPD_BOILETTER_LOG_SEQNO") 
  ;