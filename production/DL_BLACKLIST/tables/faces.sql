CREATE TABLE "DL_BLACKLIST"."FACES" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL rawtohex(sys_guid() ) NOT NULL ENABLE, 
	"IMAGE_ID" VARCHAR2(32 CHAR), 
	"BIOMETRIC_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"FACE_POSITION_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"FACE_QUALITY_TYPE_ID" VARCHAR2(32 CHAR), 
	"FACE_MISSING_REASON_ID" VARCHAR2(32 CHAR), 
	"FACE_RESOLUTION_ID" VARCHAR2(32 CHAR), 
	"IS_ENCODED" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"ENCODE_ERROR" VARCHAR2(4000 CHAR), 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_BIOMETRIC_ID_FK" FOREIGN KEY ("BIOMETRIC_ID")
	  REFERENCES "DL_BLACKLIST"."BIOMETRICS" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_FACE_POSITION_ID_FK" FOREIGN KEY ("FACE_POSITION_ID")
	  REFERENCES "DL_BLACKLIST"."FACE_POSITIONS" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_IMAGE_ID_FK" FOREIGN KEY ("IMAGE_ID")
	  REFERENCES "DL_BLACKLIST"."IMAGES" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_MISSING_REASON_ID_FK" FOREIGN KEY ("FACE_MISSING_REASON_ID")
	  REFERENCES "DL_BLACKLIST"."FACE_MISSING_REASONS" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_QUALITY_TYPE_ID_FK" FOREIGN KEY ("FACE_QUALITY_TYPE_ID")
	  REFERENCES "DL_BLACKLIST"."FACE_QUALITY_TYPES" ("ID") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FACES" ADD CONSTRAINT "FACES_RESOLUTION_ID_FK" FOREIGN KEY ("FACE_RESOLUTION_ID")
	  REFERENCES "DL_BLACKLIST"."FACE_RESOLUTIONS" ("ID") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."IMAGE_ID" IS 'image foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."BIOMETRIC_ID" IS 'biometric foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."FACE_POSITION_ID" IS 'face position foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."FACE_QUALITY_TYPE_ID" IS 'face quality foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."FACE_MISSING_REASON_ID" IS 'face missing reason foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."FACE_RESOLUTION_ID" IS 'face resolution foreign key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."IS_ENCODED" IS 'Is the face template encoded';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."ENCODE_ERROR" IS 'Encode error message';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FACES"."DML_TYPE" IS 'What type of DML was the last change of the record';
  CREATE INDEX "DL_BLACKLIST"."FACES_BIOMETRIC_ID_IDX" ON "DL_BLACKLIST"."FACES" ("BIOMETRIC_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FACES_FACE_POSITION_IDX" ON "DL_BLACKLIST"."FACES" ("FACE_POSITION_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FACES_IMAGE_ID_IDX" ON "DL_BLACKLIST"."FACES" ("IMAGE_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FACES_MISSING_REASON_IDX" ON "DL_BLACKLIST"."FACES" ("FACE_MISSING_REASON_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FACES_QUALITY_TYPE_ID_IDX" ON "DL_BLACKLIST"."FACES" ("FACE_QUALITY_TYPE_ID") 
  ;
CREATE INDEX "DL_BLACKLIST"."FACES_RESOLUTION_ID_IDX" ON "DL_BLACKLIST"."FACES" ("FACE_RESOLUTION_ID") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."FACES_PK" ON "DL_BLACKLIST"."FACES" ("ID") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."FACES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FACES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FACES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."FACES" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FACES" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."FACES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FACES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."FACES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."FACES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FACES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FACES" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."FACES$BIUR" BEFORE
    INSERT OR UPDATE ON dl_blacklist.faces
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
ALTER TRIGGER "DL_BLACKLIST"."FACES$BIUR" ENABLE;
