CREATE TABLE "DL_COMMON"."CONTINENTS$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6), 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_COMMON"."CONTINENTS$HIS" ADD CONSTRAINT "CONTINENTS$HIS$CHK$C03" CHECK (dml_type IN ('I', 'U', 'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."DISPLAY_VALUE" IS 'Name of the continent';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."DISPLAY_CODE" IS 'Two characters to describe the continent; will be used by the customer';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."NOTICE" IS 'Colume for notice';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."CONTINENTS$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."CONTINENTS$HIS"  IS 'History of Continents';
  GRANT SELECT ON "DL_COMMON"."CONTINENTS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."CONTINENTS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."CONTINENTS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CONTINENTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CONTINENTS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."CONTINENTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CONTINENTS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."CONTINENTS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."CONTINENTS$HIS" TO "BIOSUPPORT";
