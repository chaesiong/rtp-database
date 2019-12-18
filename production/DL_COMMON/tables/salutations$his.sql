CREATE TABLE "DL_COMMON"."SALUTATIONS$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_COMMON"."SALUTATIONS$HIS" ADD CONSTRAINT "SALUTATIONS$HIS$CHK$C03" CHECK (dml_type IN ('I', 'U', 'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."DISPLAY_VALUE" IS 'Name of the salutations';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."DISPLAY_CODE" IS 'Two characters to describe the relation; will be used by the customer';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."NOTICE" IS 'Colume for notice';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."SALUTATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."SALUTATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."SALUTATIONS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."SALUTATIONS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$HIS" TO "PORNRUKSA_S";
