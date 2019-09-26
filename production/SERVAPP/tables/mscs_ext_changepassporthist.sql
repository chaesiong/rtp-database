CREATE TABLE "SERVAPP"."MSCS_EXT_CHANGEPASSPORTHIST" 
   (	"PASSHIST_SEQNO" NUMBER, 
	"MOVESTAMP_SEQNO" NUMBER, 
	"EXTPERSON_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_PIC" VARCHAR2(50 CHAR), 
	"ISSUE_DATE" DATE, 
	"ISSUE_PLACE" VARCHAR2(100 CHAR), 
	"EXP_DATE" DATE, 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"FLAG" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"EFAMILYNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"UIPADDRESS" VARCHAR2(20 CHAR), 
	"BOIVISATYPE_SEQNO" NUMBER, 
	"BOIVISASUBTYPE_SEQNO" NUMBER, 
	"BOIVISADATE" DATE, 
	"BOIPERMITDATE" DATE, 
	"BOIREMARK" VARCHAR2(2000 CHAR), 
	"MOVESTAMP_TYPE" CHAR(1 CHAR), 
	"PASSPORT_IMG" BLOB
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_CHANGEPASSPORTHIST" ADD CONSTRAINT "MSCS_EXT_CHANGEPASSHIST_PK" PRIMARY KEY ("PASSHIST_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."MSCS_EXT_CHANGEPASSHIST_PK" ON "SERVAPP"."MSCS_EXT_CHANGEPASSPORTHIST" ("PASSHIST_SEQNO") 
  ;
  ;
