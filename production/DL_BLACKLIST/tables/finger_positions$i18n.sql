CREATE TABLE "DL_BLACKLIST"."FINGER_POSITIONS$I18N" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL rawtohex(sys_guid() ) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"VALUE_SHORT" VARCHAR2(30 CHAR), 
	"VALUE_LONG" VARCHAR2(200 CHAR), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."FINGER_POSITIONS$I18N" ADD CONSTRAINT "FINGER_POSITIONS$I18N_CHK00" CHECK ( locale != 'en_US' ) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGER_POSITIONS$I18N" ADD CONSTRAINT "FINGER_POSITIONS$I18N_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."ID" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."LOCALE" IS 'Language and Country code, example ''en_US''';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."VALUE_SHORT" IS 'Short version of the lookup value (e.g. country code)';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."VALUE_LONG" IS 'Long version of the lookup value (e.g. country name)';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."DESCRIPTION" IS 'Description on the lookup value';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS$I18N"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON TABLE "DL_BLACKLIST"."FINGER_POSITIONS$I18N"  IS 'Translations LookUp Table finger_Positions';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."FINGER_POSITIONS$I18N_PK" ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" ("ID") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS$I18N" TO "APPSUP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."FINGER_POSITIONS$I18N$BIUR" BEFORE
    INSERT OR UPDATE ON dl_blacklist.finger_positions$i18n
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
ALTER TRIGGER "DL_BLACKLIST"."FINGER_POSITIONS$I18N$BIUR" ENABLE;
