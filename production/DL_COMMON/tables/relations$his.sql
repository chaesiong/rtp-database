CREATE TABLE "DL_COMMON"."RELATIONS$HIS" 
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
  ALTER TABLE "DL_COMMON"."RELATIONS$HIS" ADD CONSTRAINT "RELATIONS$HIS$CHK$C03" CHECK (dml_type IN ('I', 'U', 'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."DISPLAY_VALUE" IS 'Name of the relation';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."DISPLAY_CODE" IS 'Two characters to describe the relation; will be used by the customer';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."NOTICE" IS 'Colume for notice';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."RELATIONS$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
  GRANT SELECT ON "DL_COMMON"."RELATIONS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."RELATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."RELATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."RELATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."RELATIONS$HIS" TO "BIOSUPPORT";
