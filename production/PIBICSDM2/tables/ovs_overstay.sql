CREATE TABLE "PIBICSDM2"."OVS_OVERSTAY" 
   (	"ID" NUMBER(10,0), 
	"PASSPORT_NO" VARCHAR2(50 CHAR), 
	"TM6_NO" VARCHAR2(50 CHAR), 
	"TRAVEL_DOC_NO" VARCHAR2(20 CHAR), 
	"TRAVEL_DOC_TYPE" VARCHAR2(50 CHAR), 
	"FAMILY_NAME" VARCHAR2(100 CHAR), 
	"FIRST_NAME" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATIONALITY" VARCHAR2(100 CHAR), 
	"WL_ID" VARCHAR2(7 CHAR), 
	"CREATE_TIME" TIMESTAMP (6), 
	"UPDATE_TIME" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(30 CHAR), 
	"UPDATE_BY" VARCHAR2(30 CHAR), 
	"STATUS" VARCHAR2(5 CHAR), 
	"ALLOW_DATE" TIMESTAMP (6), 
	"OVER_AMOUNT" NUMBER(5,0), 
	"PROHIBIT_AMOUNT" NUMBER(5,0), 
	"PRESENT_DATE" TIMESTAMP (6), 
	"EFFECTIVE_DATE" TIMESTAMP (6), 
	"EXPIRED_DATE" TIMESTAMP (6), 
	"REMARK" VARCHAR2(500 CHAR), 
	"PRESENT_TYPE" CHAR(1 CHAR), 
	"ORG_UNIT1" VARCHAR2(10 CHAR), 
	"ORG_UNIT2" VARCHAR2(10 CHAR), 
	"ORG_UNIT3" VARCHAR2(10 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."PK_OVS_OVERSTAY" ON "PIBICSDM2"."OVS_OVERSTAY" ("ID") 
  ;