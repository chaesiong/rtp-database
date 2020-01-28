CREATE TABLE "DL_USER_MANAGEMENT"."USERS$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"USERNAME" VARCHAR2(50 CHAR), 
	"FIRST_NAME" VARCHAR2(100 CHAR), 
	"LAST_NAME" VARCHAR2(100 CHAR), 
	"MAIL_ADDRESS" VARCHAR2(320 CHAR), 
	"PHONE_NUMBER" VARCHAR2(15 CHAR), 
	"STATE" NUMBER, 
	"PW_HASH" VARCHAR2(4000 CHAR), 
	"PW_SALT" VARCHAR2(4000 CHAR), 
	"PW_ITERATION_COUNT" NUMBER, 
	"PW_EXPIRATION_DATE" DATE, 
	"PW_MUST_BE_CHANGED" CHAR(1 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR), 
	"PW_EXPIRE" NUMBER, 
	"NATIONAL_ID" NUMBER(13,0), 
	"FIRST_NAME_THAI" VARCHAR2(100 CHAR), 
	"LAST_NAME_THAI" VARCHAR2(100 CHAR), 
	"DOB" DATE, 
	"RANK" VARCHAR2(3 CHAR), 
	"DEPARTMENT_LEVEL_1" NUMBER, 
	"DEPARTMENT_LEVEL_2" NUMBER, 
	"DEPARTMENT_LEVEL_3" NUMBER, 
	"POSITION" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."USERS$HIS" ADD CONSTRAINT "USERS$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                          ,'U'
                                                                                          ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."USERS$HIS$IX00" ON "DL_USER_MANAGEMENT"."USERS$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "DL_BORDERCONTROL_DATAMART";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."USERS$HIS" TO "SANTIPATN_P";
