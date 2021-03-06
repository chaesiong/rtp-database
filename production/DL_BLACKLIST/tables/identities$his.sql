CREATE TABLE "DL_BLACKLIST"."IDENTITIES$HIS" 
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
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR), 
	"DATE_OF_BIRTH_PARTIAL" "DL_BLACKLIST"."CT_PARTIAL_DATE" , 
	"CRD_FLAG" VARCHAR2(1 CHAR), 
	"CRD_RESULT_FLAG" VARCHAR2(1 CHAR), 
	"CRD_UPDATED_DATETIME" DATE, 
	"CRD_RESULT_XML" CLOB, 
	"CRD_BLIN_SEQ" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES$HIS" ADD CONSTRAINT "IDENTITIES$HIS$CK00" CHECK ( dml_type IN (
            'D',
            'I',
            'U'
        ) ) ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."KEY_VALUE" IS 'Internal used primary key as free format';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."UNIQUE_VALUE" IS 'Natural unique key: Currently generated value by expression ""';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."SALUTATION" IS 'Salutation';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."SURNAME" IS 'Surname';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."MIDDLE_NAME" IS 'Middle Name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."GIVEN_NAME" IS 'Given Name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."SURNAME_THAI" IS 'Surname thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."MIDDLENAME_THAI" IS 'Middlename thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."GIVENNAME_THAI" IS 'Given Name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."DATE_OF_BIRTH" IS 'Date of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."PLACE_OF_BIRTH" IS 'Place of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."COUNTRY_OF_BIRTH" IS 'Country of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."NATIONALITY" IS 'Nationality';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."SEX" IS 'Sex';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."NOTICE" IS 'Any notice onto this identity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."PROFESSION" IS 'Profession';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."PHONE_NUMBER_0" IS 'First known number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."PHONE_NUMBER_1" IS 'Second known number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."PHONE_NUMBER_2" IS 'Third known number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."BODY_HEIGHT" IS 'Height of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."BODY_WEIGHT" IS 'Weight of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."BODY_SHAPE" IS 'Shape of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."HAIR_COLOR" IS 'Color of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."HAIR_CHARACTERISTIC" IS 'Charecteristic of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."FACE_SHAPE" IS 'Shape of the face';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."EYE_COLOR" IS 'Color of the eye';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."SKIN" IS 'Skin';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."DOMINANT_CHARACTERISTIC" IS 'The identities dominant Characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."SPECIAL_CHARACTERISTIC" IS 'Any other special Characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."OWNER" IS 'Owner';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$HIS"."DATE_OF_BIRTH_PARTIAL" IS 'Special Date Type for Date of Birth, day and month can be zero';
  CREATE INDEX "DL_BLACKLIST"."IDENTITIES$HIS$IX00" ON "DL_BLACKLIST"."IDENTITIES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312616C00043$$" ON "DL_BLACKLIST"."IDENTITIES$HIS" (
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$HIS" TO "PUNYAWII_D";
