CREATE TABLE "DL_BLACKLIST"."FINGERPRINTS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL rawtohex(sys_guid() ) NOT NULL ENABLE, 
	"IMAGE_ID" VARCHAR2(32 CHAR), 
	"BIOMETRIC_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"IMPRESSION_TYPE_ID" VARCHAR2(32 CHAR), 
	"FINGER_POSITION_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"MISSING_REASON_ID" VARCHAR2(32 CHAR), 
	"IS_ENCODED" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"ENCODE_ERROR" VARCHAR2(4000 CHAR), 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."FINGERPRINTS" ADD CONSTRAINT "FINGERPRINTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGERPRINTS" ADD CONSTRAINT "FINGER_BIOMETRIC_ID_FK" FOREIGN KEY ("BIOMETRIC_ID")
	  REFERENCES "DL_BLACKLIST"."BIOMETRICS" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGERPRINTS" ADD CONSTRAINT "FINGER_FINGER_POSITION_ID_FK" FOREIGN KEY ("FINGER_POSITION_ID")
	  REFERENCES "DL_BLACKLIST"."FINGER_POSITIONS" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGERPRINTS" ADD CONSTRAINT "FINGER_IMAGE_ID_FK" FOREIGN KEY ("IMAGE_ID")
	  REFERENCES "DL_BLACKLIST"."IMAGES" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGERPRINTS" ADD CONSTRAINT "FINGER_IMPRESSION_TYPE_ID_FK" FOREIGN KEY ("IMPRESSION_TYPE_ID")
	  REFERENCES "DL_BLACKLIST"."FINGER_IMPRESSION_TYPES" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGERPRINTS" ADD CONSTRAINT "FINGER_MISSING_REASON_ID_FK" FOREIGN KEY ("MISSING_REASON_ID")
	  REFERENCES "DL_BLACKLIST"."FINGER_MISSING_REASONS" ("ID") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."IMAGE_ID" IS 'Image foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."BIOMETRIC_ID" IS 'Biometric foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."IMPRESSION_TYPE_ID" IS 'Finger Impression foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."FINGER_POSITION_ID" IS 'Finger Position foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."MISSING_REASON_ID" IS 'FInger Missing Reason foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."IS_ENCODED" IS 'Is the fingerprint template encoded';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."ENCODE_ERROR" IS 'Encode error message';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGERPRINTS"."DML_TYPE" IS 'What type of DML was the last change of the record';
  CREATE INDEX "DL_BLACKLIST"."FINGER_BIOMETRIC_ID_IDX" ON "DL_BLACKLIST"."FINGERPRINTS" ("BIOMETRIC_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FINGER_IMAGE_ID_IDX" ON "DL_BLACKLIST"."FINGERPRINTS" ("IMAGE_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FINGER_IMPRESSION_TYPE_ID_IDX" ON "DL_BLACKLIST"."FINGERPRINTS" ("IMPRESSION_TYPE_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FINGER_MISSING_REASON_ID_IDX" ON "DL_BLACKLIST"."FINGERPRINTS" ("MISSING_REASON_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FINGER_POSITION_ID_IDX" ON "DL_BLACKLIST"."FINGERPRINTS" ("FINGER_POSITION_ID") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."FINGERPRINTS_PK" ON "DL_BLACKLIST"."FINGERPRINTS" ("ID") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."FINGERPRINTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGERPRINTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGERPRINTS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGERPRINTS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."FINGERPRINTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FINGERPRINTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."FINGERPRINTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."FINGERPRINTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FINGERPRINTS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGERPRINTS" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."FINGERPRINTS$BIUR" BEFORE
    INSERT OR UPDATE ON dl_blacklist.fingerprints
    FOR EACH ROW
BEGIN
    IF
        inserting
    THEN
        :new.ins_by := dl_common.pkg_session.get_audit_user ();
        :new.ins_at := systimestamp;
        :new.dml_by := dl_common.pkg_session.get_audit_user ();
        :new.dml_at := systimestamp;
        :new.dml_type := 'I';
    ELSIF updating THEN
        :new.ins_by :=:old.ins_by;
        :new.ins_at :=:old.ins_at;
        :new.dml_by := dl_common.pkg_session.get_audit_user ();
        :new.dml_at := systimestamp;
        :new.dml_type := 'U';
    END IF;
END;
/
ALTER TRIGGER "DL_BLACKLIST"."FINGERPRINTS$BIUR" ENABLE;