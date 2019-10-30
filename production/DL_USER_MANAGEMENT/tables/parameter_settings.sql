CREATE TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DISPLAY_NAME" VARCHAR2(100 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(100 CHAR), 
	"IS_MODIFIABLE_IN_APEX" NUMBER NOT NULL ENABLE, 
	"SORT_ORDER" NUMBER, 
	"VALUE_TYPE" NUMBER, 
	"DEFAULT_STR" VARCHAR2(30 CHAR), 
	"DEFAULT_NUM" NUMBER, 
	"DEFAULT_IS_ON" NUMBER, 
	"VALUE_STR" VARCHAR2(30 CHAR), 
	"VALUE_NUM" NUMBER, 
	"VALUE_IS_ON" NUMBER, 
	"ACTIVE_STR" VARCHAR2(30 CHAR) GENERATED ALWAYS AS (NVL("VALUE_STR","DEFAULT_STR")) VIRTUAL , 
	"ACTIVE_NUM" NUMBER GENERATED ALWAYS AS (NVL("VALUE_NUM","DEFAULT_NUM")) VIRTUAL , 
	"ACTIVE_IS_ON" NUMBER GENERATED ALWAYS AS (NVL("VALUE_IS_ON","DEFAULT_IS_ON")) VIRTUAL , 
	"ACTIVE_VALUE" VARCHAR2(4000 CHAR) GENERATED ALWAYS AS (COALESCE(NVL("VALUE_STR","DEFAULT_STR"),TO_CHAR(NVL("VALUE_NUM","DEFAULT_NUM")),CASE NVL("VALUE_IS_ON","DEFAULT_IS_ON") WHEN 1 THEN 'On' ELSE 'Off' END )) VIRTUAL , 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$UQ00" UNIQUE ("NAME")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_MODIFIABLE_CK" CHECK (IS_MODIFIABLE_IN_APEX = 1 or IS_MODIFIABLE_IN_APEX = 0) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_DEF_VALUE_CK" CHECK ((VALUE_TYPE = 1 and DEFAULT_STR is not null and DEFAULT_NUM is null and DEFAULT_IS_ON is null) or (VALUE_TYPE = 2 and DEFAULT_STR is null and DEFAULT_NUM is not null and DEFAULT_IS_ON is null) or
                                                                                                   (VALUE_TYPE = 3 and DEFAULT_STR is null and DEFAULT_NUM is null and DEFAULT_IS_ON is not null)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_IS_ON_CK" CHECK (VALUE_IS_ON in (1
                                                                                                              ,0)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_DEF_IS_ON_CK" CHECK (DEFAULT_IS_ON in (1
                                                                                                                    ,0)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAM_SETTINGS_VALUE_CK" CHECK ((VALUE_TYPE = 1 and VALUE_NUM is null and VALUE_IS_ON is null) or (VALUE_TYPE = 2 and VALUE_STR is null and VALUE_IS_ON is null) or (VALUE_TYPE = 3 and VALUE_STR is null and VALUE_NUM is null)) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$CHK00" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ADD CONSTRAINT "PARAMETER_SETTINGS$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                            ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ID" IS 'Artifical primary key';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."NAME" IS 'Name of the parameter';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DISPLAY_NAME" IS 'Name to be displayed in maintenance application';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DESCRIPTION" IS 'Description of the parameter';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."IS_MODIFIABLE_IN_APEX" IS '1 - to be maintainable in apex, 0 - not to be maintainable in apex';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."SORT_ORDER" IS 'Sort order in maintenance application. The lower the number, the higher is the display position of the parameter in the list';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_TYPE" IS '1 if the value is a string, 2 if the value is numeric, 3 if the value is boolean';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DEFAULT_STR" IS 'default string value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DEFAULT_NUM" IS 'default numeric value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."DEFAULT_IS_ON" IS 'default "boolean" value (1 means "is on", 0 means "is off")';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_STR" IS 'string value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_NUM" IS 'numeric value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."VALUE_IS_ON" IS '"boolean" value (1 means "is on", 0 means "is off")';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ACTIVE_STR" IS 'virtual column: active string value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ACTIVE_NUM" IS 'virtual column: active numeric value';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ACTIVE_IS_ON" IS 'virtual column: active value (converted to string format)';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"."TAG" IS 'Tag for the row, for example for better identifying the datasets by any DML-Statements.';
   COMMENT ON TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS"  IS 'Parameter settings for user management';
  CREATE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$IX00" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("NAME", "DISPLAY_NAME", "SORT_ORDER") 
  ;
CREATE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$IX01" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("DML_AT", "DML_BY") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$PK" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$UQ00" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" ("NAME") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS" TO "BIOSUPPORT";
