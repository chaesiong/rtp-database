CREATE TABLE "DL_COMMON"."COUNTRIES$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ISO3166_A3" VARCHAR2(3 CHAR), 
	"ISO3166_A2" VARCHAR2(2 CHAR), 
	"ISO3166_NUM" VARCHAR2(3 CHAR), 
	"TL_DOMAIN" VARCHAR2(2 CHAR), 
	"PHONE_AREA_CODE" VARCHAR2(6 CHAR), 
	"ICAO_LOC_PART" VARCHAR2(2 CHAR), 
	"NATIONALITY" VARCHAR2(128 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"OFFICIAL_LANGUAGE" VARCHAR2(32 CHAR), 
	"CONTINENT" VARCHAR2(32 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."COUNTRIES$HIS" ADD CONSTRAINT "COUNTRIES$HIS$CHK$C07" CHECK (DML_TYPE in ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."DISPLAY_VALUE" IS 'Name of Country';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."ISO3166_A3" IS 'ISO 3166 ALPHA-3';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."ISO3166_A2" IS 'ISO 3166 ALPHA-2';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."ISO3166_NUM" IS 'ISO 3166 Numeric';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."TL_DOMAIN" IS 'Top level domain';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."PHONE_AREA_CODE" IS 'Phone Country Code e.g. +49 for Germany';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."ICAO_LOC_PART" IS 'ICAO_LOC_PART';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."NATIONALITY" IS 'Sex neutral title of the nationality e. g. German, French, Austrian, ...';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."CONTINENT" IS 'Continent of the counry';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."COUNTRIES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON TABLE "DL_COMMON"."COUNTRIES$HIS"  IS 'History of Countries';
  CREATE INDEX "DL_COMMON"."COUNTRIES$HIS$IX00" ON "DL_COMMON"."COUNTRIES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."COUNTRIES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."COUNTRIES$HIS" TO "PORNRUKSA_S";
