CREATE TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR), 
	"DISPLAY_NAME" VARCHAR2(100 CHAR), 
	"DESCRIPTION" VARCHAR2(100 CHAR), 
	"IS_MODIFIABLE_IN_APEX" NUMBER, 
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
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" ADD CONSTRAINT "PARAMETER_SETTINGS$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                                    ,'U'
                                                                                                                    ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS$IX00" ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."PARAMETER_SETTINGS$HIS" TO "TESTADM";