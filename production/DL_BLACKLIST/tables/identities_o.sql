CREATE TABLE "DL_BLACKLIST"."IDENTITIES_O" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL sys_guid() NOT NULL ENABLE, 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR) GENERATED ALWAYS AS ("KEY_VALUE"||'') VIRTUAL , 
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
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"CRD_FLAG" VARCHAR2(1 CHAR), 
	"CRD_RESULT_FLAG" VARCHAR2(1 CHAR), 
	"CRD_UPDATED_DATETIME" DATE, 
	"CRD_RESULT_XML" CLOB, 
	"CRD_BLIN_SEQ" NUMBER
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$CK00_O" CHECK ( key_value = upper(key_value) ) DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$CK03_O" CHECK ( dml_type IN (
            'I',
            'U'
        ) ) DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$PK_O" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_OWNER_O" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_COUNTRY_OF_BIRTH_O" FOREIGN KEY ("COUNTRY_OF_BIRTH")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_NATIONALITY_O" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_SEX_O" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_SALUTATION_O" FOREIGN KEY ("SALUTATION")
	  REFERENCES "DL_COMMON"."SALUTATIONS" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES_O" ADD CONSTRAINT "IDENTITIES$FK_PROFESSION_O" FOREIGN KEY ("PROFESSION")
	  REFERENCES "DL_COMMON"."PROFESSIONS" ("KEY_VALUE") DISABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."KEY_VALUE" IS 'Internal used primary key as free format';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."UNIQUE_VALUE" IS 'Natural unique key: Currently generated value by expression ""';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SALUTATION" IS 'Salutation';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SURNAME" IS 'Surname';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."MIDDLE_NAME" IS 'Middle name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."GIVEN_NAME" IS 'Given name';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SURNAME_THAI" IS 'Surname thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."MIDDLENAME_THAI" IS 'Middle name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."GIVENNAME_THAI" IS 'Given name thai';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DATE_OF_BIRTH" IS 'Date of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PLACE_OF_BIRTH" IS 'Place of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."COUNTRY_OF_BIRTH" IS 'Country of birth';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."NATIONALITY" IS 'Nationality';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SEX" IS 'Sex';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."NOTICE" IS 'Any notice onto this identity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PROFESSION" IS 'Profession';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONE_NUMBER_0" IS 'First known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONE_NUMBER_1" IS 'Second known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONE_NUMBER_2" IS 'Third known phone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."ADDRESS_0" IS 'First known complete address';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."ADDRESS_1" IS 'Second known complete address';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."ADDRESS_2" IS 'Third known complete address';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BODY_HEIGHT" IS 'Height of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BODY_WEIGHT" IS 'Weight of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BODY_SHAPE" IS 'Shape of the body';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."HAIR_COLOR" IS 'Color of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."HAIR_CHARACTERISTIC" IS 'Characteristic of the hair';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."FACE_SHAPE" IS 'Shape of the Face';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EYE_COLOR" IS 'Color of the eye';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SKIN" IS 'Skin';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DOMINANT_CHARACTERISTIC" IS 'The identities dominant Characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."SPECIAL_CHARACTERISTIC" IS 'Any other special characteristic';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONETIC_SURNAME" IS 'Surname phonetically written';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONETIC_MIDDLE_NAME" IS 'Middle name phonetically written';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."PHONETIC_GIVEN_NAME" IS 'Given name phonetically written';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."OWNER" IS 'Owner of record, normally who hast it inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_SOURCE" IS 'The source of any linked data onto this entity, e. g. SCHEMA.TABLE';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_PK_0" IS 'The first primary key value into the source of any linked data onto this entity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_PK_1" IS 'The second primary key value into the source of any linked data onto this entity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."EXTENDED_DATA_PK_2" IS 'The thirdt primary key value into the source of any linked data onto this entity';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."AUTHORITY" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."BEHAVIOUR" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."CASENUMBER" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."LEVEL_CONFIDENTIALITY" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."REASON" IS 'unused';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES_O"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON TABLE "DL_BLACKLIST"."IDENTITIES_O"  IS 'Identities of a person';
  CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX00_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("OWNER") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX01_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("COUNTRY_OF_BIRTH") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX02_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("NATIONALITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX03_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("SEX") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX04_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("SALUTATION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX05_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("PROFESSION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX06_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("EXTENDED_DATA_PK_0", "EXTENDED_DATA_PK_1", "EXTENDED_DATA_PK_2", "EXTENDED_DATA_SOURCE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX90_O" ON "DL_BLACKLIST"."IDENTITIES_O" (LOWER(TRIM("SURNAME")), LOWER(TRIM("SURNAME_THAI")), LOWER(TRIM("MIDDLE_NAME")), LOWER(TRIM("MIDDLENAME_THAI")), LOWER(TRIM("GIVEN_NAME")), LOWER(TRIM("GIVENNAME_THAI")), "SEX", "DATE_OF_BIRTH", "NATIONALITY", "KEY_VALUE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX91_O" ON "DL_BLACKLIST"."IDENTITIES_O" (SOUNDEX(TRIM("SURNAME")), SOUNDEX(TRIM("SURNAME_THAI")), SOUNDEX(TRIM("MIDDLE_NAME")), SOUNDEX(TRIM("MIDDLENAME_THAI")), SOUNDEX(TRIM("GIVEN_NAME")), SOUNDEX(TRIM("GIVENNAME_THAI")), "SEX", "DATE_OF_BIRTH", "NATIONALITY", "KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$PK_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$UQ00_O" ON "DL_BLACKLIST"."IDENTITIES_O" ("UNIQUE_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312621C00055$$" ON "DL_BLACKLIST"."IDENTITIES_O" (
  ;
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO PUBLIC;
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES_O" TO PUBLIC;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "APPSUP";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."IDENTITIES_O" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES_O" TO "PUNYAWII_D";
