CREATE TABLE "DL_COMMON"."PORTS$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LATITUDE" NUMBER(8,6), 
	"LONGITUDE" NUMBER(9,6), 
	"ALTITUDE" NUMBER, 
	"COUNTRY" VARCHAR2(3 CHAR), 
	"CITY" VARCHAR2(128 CHAR), 
	"TZ_OFFSET" VARCHAR2(6 CHAR), 
	"TZ_REGION" VARCHAR2(64 CHAR), 
	"TZ_ABBREV" VARCHAR2(4 CHAR), 
	"PORT_TYPE_MASK" NUMBER(2,0), 
	"UN_LOCODE" VARCHAR2(6 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."PORTS$HIS" ADD CONSTRAINT "PORTS$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                   ,'U'
                                                                                   ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."DISPLAY_VALUE" IS 'Name of the Port';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."LATITUDE" IS 'Valid between -90 and 90 (-91 means invalid)';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."LONGITUDE" IS 'Valid between -180 and 180 (-181 means invalid)';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."ALTITUDE" IS 'not in use';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."COUNTRY" IS 'Country of port';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."CITY" IS 'City of Port';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."TZ_OFFSET" IS 'Timezone offset';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."TZ_REGION" IS 'Timezone Region';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."TZ_ABBREV" IS 'Timezone Abbrev';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."PORT_TYPE_MASK" IS 'Bitmask: 0 => unknown, 1 => port, 2 => airport, 4 => rail terminal, 8 => road terminal !';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."UN_LOCODE" IS 'UN Locode';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."PORTS$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."PORTS$HIS"  IS 'History of Ports';
  CREATE INDEX "DL_COMMON"."PORTS$HIS$IX00" ON "DL_COMMON"."PORTS$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PORTS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PORTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PORTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."PORTS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."PORTS$HIS" TO "SANTIPATN_P";
