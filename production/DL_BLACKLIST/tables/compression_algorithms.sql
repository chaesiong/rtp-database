CREATE TABLE "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" 
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
  ALTER TABLE "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" ADD CONSTRAINT "COMPRESSION_ALGORITHMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" ADD CONSTRAINT "COMPRESSION_ALGORITHMS_KEY_UN" UNIQUE ("KEY")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."ORDINAL" IS 'NIST Standard for the compression algorithm';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."KEY" IS 'Key of the lookup. Within a category this key is unique if only the active lookups are considered.';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."VALUE_SHORT" IS 'Short version of the lookup value (e.g. country code)';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."VALUE_LONG" IS 'Long version of the lookup value (e.g. country name)';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."DESCRIPTION" IS 'Description on the lookup value';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."VALID_FROM" IS 'Start date of the validity of the lookup';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."VALID_TO" IS 'End date of the validity of the lookup';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."DISPLAY_ORDER" IS 'Number for the Display Order usually ascending';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."DISPLAY_ACTIVE" IS 'Y if the lookup is currently active,N else.';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."COMPRESSION_ALGORITHMS"."DML_TYPE" IS 'What type of DML was the last change of the record';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."COMPRESSION_ALGORITHMS_KEY_UN" ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" ("KEY") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."COMPRESSION_ALGORITHMS_PK" ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" ("ID") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."COMPRESSION_ALGORITHMS" TO "PORNRUKSA_S";
