CREATE TABLE "DL_COMMON"."ENTRY_EXITS$I18N$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_COMMON"."ENTRY_EXITS$I18N$HIS" ADD CONSTRAINT "ENTRY_EXITS$I18N$HIS$CHK$C05" CHECK (DML_TYPE in ('I'
                                                                                                         ,'U'
                                                                                                         ,'D')) ENABLE;
  CREATE INDEX "DL_COMMON"."ENTRY_EXITS$I18N$HIS$IX00" ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" ("KEY_VALUE", "LOCALE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ENTRY_EXITS$I18N$HIS" TO "APPSUP";
