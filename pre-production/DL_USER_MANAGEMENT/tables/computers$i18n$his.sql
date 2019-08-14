CREATE TABLE "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR), 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" ADD CONSTRAINT "COMPUTERS$I18N$HIS$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                            ,'U'
                                                                                                            ,'D')) ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS$IX00" ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" ("ID", "LOCALE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."COMPUTERS$I18N$HIS" TO "TESTADM";
