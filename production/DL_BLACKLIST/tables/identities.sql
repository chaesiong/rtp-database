CREATE TABLE "DL_BLACKLIST"."IDENTITIES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT sys_guid(), 
	"UNIQUE_VALUE" VARCHAR2(32 CHAR) GENERATED ALWAYS AS ("KEY_VALUE"||'') VIRTUAL , 
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
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"DATE_OF_BIRTH_PARTIAL" "DL_BLACKLIST"."CT_PARTIAL_DATE" , 
	"CRD_FLAG" VARCHAR2(1 CHAR), 
	"CRD_RESULT_FLAG" VARCHAR2(1 CHAR), 
	"CRD_UPDATED_DATETIME" DATE, 
	"CRD_RESULT_XML" CLOB, 
	"CRD_BLIN_SEQ" NUMBER, 
	"BODY_HEIGHT" NUMBER, 
	"BODY_WEIGHT" NUMBER
   ) ;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$CK03" CHECK ( dml_type IN (
            'I',
            'U'
        ) ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_COUNTRY_OF_BIRTH" FOREIGN KEY ("COUNTRY_OF_BIRTH")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_OWNER" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_PROFESSION" FOREIGN KEY ("PROFESSION")
	  REFERENCES "DL_COMMON"."PROFESSIONS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_SALUTATION" FOREIGN KEY ("SALUTATION")
	  REFERENCES "DL_COMMON"."SALUTATIONS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK_SEX" FOREIGN KEY ("SEX")
	  REFERENCES "DL_COMMON"."HUMAN_SEXES" ("KEY_VALUE") DISABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES"."DATE_OF_BIRTH_PARTIAL" IS 'Special Date Type for Date of Birth, day and month can be zero';
  CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX00" ON "DL_BLACKLIST"."IDENTITIES" ("OWNER") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX01" ON "DL_BLACKLIST"."IDENTITIES" ("COUNTRY_OF_BIRTH") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX02" ON "DL_BLACKLIST"."IDENTITIES" ("NATIONALITY") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX03" ON "DL_BLACKLIST"."IDENTITIES" ("SEX") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX04" ON "DL_BLACKLIST"."IDENTITIES" ("SALUTATION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX05" ON "DL_BLACKLIST"."IDENTITIES" ("PROFESSION") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX90" ON "DL_BLACKLIST"."IDENTITIES" (LOWER(TRIM("SURNAME")), LOWER(TRIM("SURNAME_THAI")), LOWER(TRIM("MIDDLE_NAME")), LOWER(TRIM("MIDDLENAME_THAI")), LOWER(TRIM("GIVEN_NAME")), LOWER(TRIM("GIVENNAME_THAI")), "NATIONALITY", "KEY_VALUE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX91" ON "DL_BLACKLIST"."IDENTITIES" (SOUNDEX(TRIM("SURNAME")), SOUNDEX(TRIM("SURNAME_THAI")), SOUNDEX(TRIM("MIDDLE_NAME")), SOUNDEX(TRIM("MIDDLENAME_THAI")), SOUNDEX(TRIM("GIVEN_NAME")), SOUNDEX(TRIM("GIVENNAME_THAI")), "NATIONALITY", "KEY_VALUE") 
  ;
CREATE INDEX "DL_BLACKLIST"."IDENTITIES$IX92" ON "DL_BLACKLIST"."IDENTITIES" ("DML_AT") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$PK" ON "DL_BLACKLIST"."IDENTITIES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."IDENTITIES$UQ00" ON "DL_BLACKLIST"."IDENTITIES" ("UNIQUE_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000523049C00044$$" ON "DL_BLACKLIST"."IDENTITIES" (
  ;
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "APPSUP";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO PUBLIC;
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES" TO PUBLIC;
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "PIBICSAPP";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "PIBICSAPP";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "DL_BORDERCONTROL";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "BIO_BD";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."IDENTITIES" TO "BIOSAADM";
