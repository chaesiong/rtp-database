CREATE TABLE "DL_BLACKLIST"."IDENTITIES_BK" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR), 
	"SALUTATION" VARCHAR2(32 CHAR), 
	"SURNAME" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"GIVEN_NAME" VARCHAR2(100 CHAR), 
	"SURNAME_THAI" VARCHAR2(100 CHAR), 
	"MIDDLENAME_THAI" VARCHAR2(100 CHAR), 
	"GIVENNAME_THAI" VARCHAR2(100 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"PLACE_OF_BIRTH" VARCHAR2(150 CHAR), 
	"COUNTRY_OF_BIRTH" VARCHAR2(32 CHAR), 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"SEX" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"PROFESSION" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_0" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_1" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_2" VARCHAR2(32 CHAR), 
	"ADDRESS_0" VARCHAR2(500 CHAR), 
	"ADDRESS_1" VARCHAR2(500 CHAR), 
	"ADDRESS_2" VARCHAR2(500 CHAR), 
	"BODY_HEIGHT" NUMBER, 
	"BODY_WEIGHT" NUMBER, 
	"BODY_SHAPE" VARCHAR2(100 CHAR), 
	"HAIR_COLOR" VARCHAR2(100 CHAR), 
	"HAIR_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"FACE_SHAPE" VARCHAR2(100 CHAR), 
	"EYE_COLOR" VARCHAR2(100 CHAR), 
	"SKIN" VARCHAR2(100 CHAR), 
	"DOMINANT_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"SPECIAL_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"PHONETIC_SURNAME" VARCHAR2(100 CHAR), 
	"PHONETIC_MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"PHONETIC_GIVEN_NAME" VARCHAR2(100 CHAR), 
	"OWNER" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_SOURCE" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_0" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_1" VARCHAR2(128 CHAR), 
	"EXTENDED_DATA_PK_2" VARCHAR2(128 CHAR), 
	"AUTHORITY" VARCHAR2(100 CHAR), 
	"BEHAVIOUR" VARCHAR2(100 CHAR), 
	"CASENUMBER" VARCHAR2(100 CHAR), 
	"LEVEL_CONFIDENTIALITY" VARCHAR2(100 CHAR), 
	"REASON" VARCHAR2(100 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_TYPE" VARCHAR2(1 CHAR), 
	"CRD_FLAG" VARCHAR2(1 CHAR), 
	"CRD_RESULT_FLAG" VARCHAR2(1 CHAR), 
	"CRD_UPDATED_DATETIME" DATE, 
	"CRD_RESULT_XML" CLOB
   ) ;
  CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000480779C00055$$" ON "DL_BLACKLIST"."IDENTITIES_BK" (
  ;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_BK" TO "TESTADM";
