CREATE TABLE "DL_BLACKLIST"."DEVICE_TYPES" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL rawtohex(sys_guid() ) NOT NULL ENABLE, 
	"ORDINAL" NUMBER, 
	"KEY" VARCHAR2(30 CHAR), 
	"VALUE_SHORT" VARCHAR2(30 CHAR), 
	"VALUE_LONG" VARCHAR2(200 CHAR), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"VALID_FROM" DATE DEFAULT ON NULL TO_DATE('19000101','YYYYMMDD') NOT NULL ENABLE, 
	"VALID_TO" DATE DEFAULT ON NULL TO_DATE('99991231','YYYYMMDD') NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER, 
	"DISPLAY_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."DEVICE_TYPES" ADD CONSTRAINT "DEVICE_TYPES_KEY_UN" UNIQUE ("KEY")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."ORDINAL" IS 'NIST Standard for thedevice types';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."KEY" IS 'Key of the lookup. Within a category this key is unique if only the active lookups are considered.';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."VALUE_SHORT" IS 'Short version of the lookup value (e.g. country code)';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."VALUE_LONG" IS 'Long version of the lookup value (e.g. country name)';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."DESCRIPTION" IS 'Description on the lookup value';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."VALID_FROM" IS 'Start date of the validity of the lookup';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."VALID_TO" IS 'End date of the validity of the lookup';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."DISPLAY_ORDER" IS 'Number for the Display Order usually ascending';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."DISPLAY_ACTIVE" IS 'Y if the lookup is currently active,N else.';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."DEVICE_TYPES"."DML_TYPE" IS 'What type of DML was the last change of the record';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."DEVICE_TYPES_KEY_UN" ON "DL_BLACKLIST"."DEVICE_TYPES" ("KEY") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."DEVICE_TYPES_PK" ON "DL_BLACKLIST"."DEVICE_TYPES" ("ID") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."DEVICE_TYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."DEVICE_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."DEVICE_TYPES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."DEVICE_TYPES" TO "PORNRUKSA_S";
