CREATE TABLE "DL_BLACKLIST"."TRAVEL_DOCS_BK" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR), 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR), 
	"DOC_TYPE" VARCHAR2(2 CHAR), 
	"ISSUING_COUNTRY" VARCHAR2(3 CHAR), 
	"DOC_NUMBER" VARCHAR2(20 CHAR), 
	"DATE_OF_ISSUE" DATE, 
	"DATE_OF_EXPIRY$VC" VARCHAR2(6 CHAR), 
	"DATE_OF_EXPIRY" DATE, 
	"SURNAME" VARCHAR2(100 CHAR), 
	"GIVEN_NAME" VARCHAR2(100 CHAR), 
	"NATIONALITY" VARCHAR2(3 CHAR), 
	"PLACE_OF_BIRTH" VARCHAR2(100 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"ISSUING_AUTHORITY" VARCHAR2(100 CHAR), 
	"DATE_OF_BIRTH$VC" VARCHAR2(6 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"MRZ_FORMAT" VARCHAR2(4 CHAR), 
	"MRZ_DATA" VARCHAR2(90 CHAR), 
	"DATA_ACQUISITION_TYPE" VARCHAR2(6 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_TYPE" VARCHAR2(1 CHAR), 
	"OWNER" VARCHAR2(128 CHAR), 
	"IDENTITY" VARCHAR2(32 CHAR), 
	"DOC_CLASS" VARCHAR2(32 CHAR), 
	"HAIR_COLOR" VARCHAR2(100 CHAR), 
	"HAIR_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"EXTENDED_DATA_SOURCE" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_0" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_1" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_2" VARCHAR2(128 CHAR), 
	"FACE_ID" VARCHAR2(32 CHAR)
   ) ;
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS_BK" TO "BIOSUPPORT";
