CREATE TABLE "DL_USER_MANAGEMENT"."OBJECTS$I18N" 
   (	"ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 CHAR) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(250 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECTS$I18N" ADD CONSTRAINT "OBJECTS$I18N$PK" PRIMARY KEY ("ID", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECTS$I18N" ADD CONSTRAINT "OBJECTS$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECTS$I18N" ADD CONSTRAINT "OBJECTS$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                ,'U')) ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECTS$I18N" ADD CONSTRAINT "OBJECTS$I18N$FK00" FOREIGN KEY ("ID")
	  REFERENCES "DL_USER_MANAGEMENT"."OBJECTS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_USER_MANAGEMENT"."OBJECTS$I18N" ADD CONSTRAINT "OBJECTS$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
  CREATE INDEX "DL_USER_MANAGEMENT"."OBJECTS$I18N$IX02" ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" ("NAME") 
  ;
CREATE UNIQUE INDEX "DL_USER_MANAGEMENT"."OBJECTS$I18N$PK" ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" ("ID", "LOCALE") 
  ;
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "SERVAPP";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "APEX_USER_MANAGEMENT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "APPSUP";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_USER_MANAGEMENT"."OBJECTS$I18N" TO "BIOSUPPORT";
