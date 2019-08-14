CREATE TABLE "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(256 CHAR), 
	"USER_SOURCE" NUMBER, 
	"APP_NAME" VARCHAR2(100 CHAR), 
	"OPERATION" NUMBER, 
	"COMMENTS" VARCHAR2(500 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" ADD CONSTRAINT "ACTIVITIES$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                    ,'U'
                                                                                                    ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."ACTIVITIES$HIS$IX00" ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ACTIVITIES$HIS" TO "APPSUP";
