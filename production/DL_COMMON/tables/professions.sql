CREATE TABLE "DL_COMMON"."PROFESSIONS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(16 CHAR) NOT NULL ENABLE, 
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
  ALTER TABLE "DL_COMMON"."PROFESSIONS" ADD CONSTRAINT "PROFESSIONS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."PROFESSIONS" ADD CONSTRAINT "PROFESSIONS$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."PROFESSIONS" ADD CONSTRAINT "PROFESSIONS$CHK$C00" CHECK (key_value = UPPER(key_value) AND LENGTH(key_value) >= 3) ENABLE;
  ALTER TABLE "DL_COMMON"."PROFESSIONS" ADD CONSTRAINT "PROFESSIONS$CHK$C01" CHECK (locale = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."PROFESSIONS" ADD CONSTRAINT "PROFESSIONS$CHK$C02" CHECK (is_active IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."PROFESSIONS" ADD CONSTRAINT "PROFESSIONS$CHK$C03" CHECK (dml_type IN ('I', 'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."DISPLAY_VALUE" IS 'Name of the profession';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."DISPLAY_CODE" IS 'Two characters to describe the relation; will be used by the customer';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."NOTICE" IS 'Calumn for notes';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
  CREATE UNIQUE INDEX "DL_COMMON"."PROFESSIONS$PK" ON "DL_COMMON"."PROFESSIONS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."PROFESSIONS$UQ00" ON "DL_COMMON"."PROFESSIONS" ("NUM_VALUE") 
  ;
  GRANT DELETE ON "DL_COMMON"."PROFESSIONS" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_COMMON"."PROFESSIONS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."PROFESSIONS" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_COMMON"."PROFESSIONS" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."PROFESSIONS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PROFESSIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."PROFESSIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS" TO "PORNRUKSA_S";
