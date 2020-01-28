CREATE TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"ADM_CLASS_REGION" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ADD CONSTRAINT "ADM_CLASS_PROVINCE$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ADD CONSTRAINT "ADM_CLASS_PROVINCE$UQ01" UNIQUE ("DISPLAY_CODE", "ADM_CLASS_REGION")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ADD CONSTRAINT "ADM_CLASS_PROVINCE$CHK$C00" CHECK (key_value = UPPER(key_value) AND LENGTH(key_value) >= 3) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ADD CONSTRAINT "ADM_CLASS_PROVINCE$CHK$C01" CHECK (locale = 'en_US') ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ADD CONSTRAINT "ADM_CLASS_PROVINCE$CHK$C02" CHECK (is_active IN ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ADD CONSTRAINT "ADM_CLASS_PROVINCE$CHK$C03" CHECK (dml_type IN ('I', 'U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."NOTICE" IS 'Column for notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."DISPLAY_VALUE" IS 'Name of the administrative classification';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."DISPLAY_CODE" IS 'Two characters to describe the administrative classification; will be used by the customer';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"."ADM_CLASS_REGION" IS 'FK dl_bordercontrol.adm_class_region';
   COMMENT ON TABLE "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE"  IS 'Is used on all Applications';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$PK" ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE$UQ01" ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" ("DISPLAY_CODE", "ADM_CLASS_REGION") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_BLACKLIST";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DL_BLACKLIST";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_PROVINCE" TO "PUNYAWII_D";
