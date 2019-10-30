CREATE TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR), 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"STREET" VARCHAR2(250 CHAR), 
	"CITY" VARCHAR2(130 CHAR), 
	"STATE_PROVINCE" VARCHAR2(130 CHAR), 
	"POSTCODE" VARCHAR2(40 CHAR), 
	"COUNTRY" VARCHAR2(32 CHAR), 
	"CONTACT_INFO" VARCHAR2(500 CHAR), 
	"SORT_ORDER" NUMBER, 
	"IS_ACTIVE" NUMBER, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" ADD CONSTRAINT "ORG_UNITS$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                  ,'U'
                                                                                                  ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."ORG_UNITS$HIS$IX00" ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."ORG_UNITS$HIS" TO "BIOSUPPORT";
