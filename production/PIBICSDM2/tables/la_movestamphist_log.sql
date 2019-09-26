CREATE TABLE "PIBICSDM2"."LA_MOVESTAMPHIST_LOG" 
   (	"MOVESTAMPHIST_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"MOVESTAMPHIST_SEQNO" NUMBER, 
	"MOVESTAMP_SEQNO" NUMBER, 
	"PERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_ISSUEDATE" DATE, 
	"PASSPORT_ISSUEAT" VARCHAR2(100 CHAR), 
	"PASSPORT_EXPDATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(30 CHAR), 
	"EFIRSTNM" VARCHAR2(30 CHAR), 
	"EMIDDLENM" VARCHAR2(30 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"IPCREATE" VARCHAR2(20 CHAR), 
	"IPUPDATE" VARCHAR2(20 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"CDEPT_SEQNO" NUMBER, 
	"CZONE_SEQNO" NUMBER, 
	"UZONE_SEQNO" NUMBER, 
	"IMGPASS" BLOB
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."LA_MOVESTAMPHIST_LOG_PK" ON "PIBICSDM2"."LA_MOVESTAMPHIST_LOG" ("MOVESTAMPHIST_LOG_SEQNO") 
  ;
  ;
