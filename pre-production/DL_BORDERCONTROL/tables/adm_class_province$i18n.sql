CREATE TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" ADD CONSTRAINT "ADM_CLASS_PROVINCE$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" ADD CONSTRAINT "ADM_CLASS_PROVINCE$I18N$CHK00" CHECK (locale != 'en_US') ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" ADD CONSTRAINT "ADM_CLASS_PROVINCE$I18N$CHK01" CHECK (dml_type IN ('I','U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."DISPLAY_VALUE" IS 'Name of the administrative classification';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N"."NOTICE" IS 'Column for notes';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N$PK" ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$I18N" TO "TRAINEE";
