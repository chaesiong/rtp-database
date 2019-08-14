CREATE TABLE "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES2" 
   (	"WLCD" VARCHAR2(7 CHAR), 
	"SEQNO" NUMBER, 
	"OWNERAGE" VARCHAR2(4 CHAR), 
	"EXPIRYDATE" DATE, 
	"NATIONCD" VARCHAR2(3 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"CASE_ID" VARCHAR2(32 CHAR), 
	"IDENTITY_ID" VARCHAR2(32 CHAR), 
	"ADDRESS_ID" VARCHAR2(32 CHAR), 
	"TRAVEL_DOCS_ID" VARCHAR2(32 CHAR), 
	"CREATE_DATE" DATE NOT NULL ENABLE, 
	"PIBICS_TABLE_CD" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"IS_ACTIVE_IN_MVLOG" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT 'I' NOT NULL ENABLE, 
	"DML_START_TS" TIMESTAMP (6) DEFAULT systimestamp NOT NULL ENABLE, 
	"CURRENTNESS_IN_PIBICS" DATE NOT NULL ENABLE, 
	"CURRENTNESS_IN_BC" DATE, 
	"ROW_SHALL_BE_IGNORED" VARCHAR2(1 CHAR) DEFAULT 'N' NOT NULL ENABLE, 
	"CNT_ERRORS" NUMBER(*,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  GRANT SELECT ON "DL_STAGING4PIBICS_INTF"."SYNC_BLACKLIST_CASES2" TO "APPSUP";
