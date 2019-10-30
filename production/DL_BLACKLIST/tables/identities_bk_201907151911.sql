CREATE TABLE "DL_BLACKLIST"."IDENTITIES_BK_201907151911" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR), 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR), 
	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"SEQNO" NUMBER, 
	"SALUTATION" VARCHAR2(32 CHAR), 
	"SURNAME" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"GIVEN_NAME" VARCHAR2(100 CHAR), 
	"SURNAME_THAI" VARCHAR2(100 CHAR), 
	"MIDDLENAME_THAI" VARCHAR2(100 CHAR), 
	"GIVENNAME_THAI" VARCHAR2(100 CHAR), 
	"DATE_OF_BIRTH" DATE, 
	"PLACE_OF_BIRTH" VARCHAR2(250 CHAR), 
	"COUNTRY_OF_BIRTH" VARCHAR2(32 CHAR), 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"SEX" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"PROFESSION" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_0" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_1" VARCHAR2(32 CHAR), 
	"PHONE_NUMBER_2" VARCHAR2(32 CHAR), 
	"BODY_SHAPE" VARCHAR2(100 CHAR), 
	"HAIR_COLOR" VARCHAR2(100 CHAR), 
	"HAIR_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"FACE_SHAPE" VARCHAR2(100 CHAR), 
	"EYE_COLOR" VARCHAR2(100 CHAR), 
	"SKIN" VARCHAR2(100 CHAR), 
	"DOMINANT_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"SPECIAL_CHARACTERISTIC" VARCHAR2(100 CHAR), 
	"OWNER" VARCHAR2(128 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"DATE_OF_BIRTH_PARTIAL" "DL_BLACKLIST"."CT_PARTIAL_DATE" , 
	"CRD_FLAG" VARCHAR2(1 CHAR), 
	"CRD_RESULT_FLAG" VARCHAR2(1 CHAR), 
	"CRD_UPDATED_DATETIME" DATE, 
	"CRD_RESULT_XML" CLOB, 
	"CRD_BLIN_SEQ" NUMBER, 
	"BODY_HEIGHT" NUMBER, 
	"BODY_WEIGHT" NUMBER
   ) ;
  CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000552393C00044$$" ON "DL_BLACKLIST"."IDENTITIES_BK_201907151911" (
  ;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_BK_201907151911" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_BK_201907151911" TO "BIOSUPPORT";
