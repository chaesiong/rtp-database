CREATE TABLE "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"COMPUTER_ID" VARCHAR2(32 CHAR), 
	"COMPUTER_DN" VARCHAR2(256 CHAR), 
	"ORG_UNIT_ID" VARCHAR2(32 CHAR), 
	"ORG_UNIT_DN" VARCHAR2(256 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TAG" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" ADD CONSTRAINT "COMPUTER_ORG_UNIT_REL$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                                          ,'U'
                                                                                                                          ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS$IX00" ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" ("ID", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTER_ORG_UNIT_REL$HIS" TO "BIOSUPPORT";
