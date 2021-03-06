CREATE TABLE "DL_BLACKLIST"."IDENTITIES2BK" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
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
	"CRD_BLIN_SEQ" NUMBER
   ) ;
  CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000533575C00046$$" ON "DL_BLACKLIST"."IDENTITIES2BK" (
  ;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."IDENTITIES2BK" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES2BK" TO "PUNYAWII_D";
