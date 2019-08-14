CREATE TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"ADM_CLASS_REGION" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" ADD CONSTRAINT "ADM_CLASS_PROVINCE$HIS$CHK$C03" CHECK (dml_type IN ('I', 'U', 'D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."NOTICE" IS 'Column for notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."DISPLAY_VALUE" IS 'Name of the administrative classification';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."DISPLAY_CODE" IS 'Two characters to describe the administrative classification; will be used by the customer';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS"."ADM_CLASS_REGION" IS 'FK dl_bordercontrol.adm_class_region';
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$HIS" TO "APPSUP";
