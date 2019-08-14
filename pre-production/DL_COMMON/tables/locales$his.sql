CREATE TABLE "DL_COMMON"."LOCALES$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LC_LANGUAGE" VARCHAR2(2 CHAR), 
	"LC_COUNTRY" VARCHAR2(2 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."LOCALES$HIS" ADD CONSTRAINT "LOCALES$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                       ,'U'
                                                                                       ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."LC_LANGUAGE" IS 'References table LANGUAGES';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."LC_COUNTRY" IS 'References table COUNTRIES';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES$HIS"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."LOCALES$HIS"  IS 'History of Locals';
  CREATE INDEX "DL_COMMON"."LOCALES$HIS$IX00" ON "DL_COMMON"."LOCALES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."LOCALES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."LOCALES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."LOCALES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."LOCALES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."LOCALES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."LOCALES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."LOCALES$HIS" TO "TESTADM";
