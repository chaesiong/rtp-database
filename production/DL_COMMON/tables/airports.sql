CREATE TABLE "DL_COMMON"."AIRPORTS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LATITUDE" NUMBER(8,6), 
	"LONGITUDE" NUMBER(9,6), 
	"ALTITUDE" NUMBER, 
	"COUNTRY" VARCHAR2(3 CHAR), 
	"CITY" VARCHAR2(128 CHAR), 
	"TZ_OFFSET" VARCHAR2(6 CHAR), 
	"TZ_REGION" VARCHAR2(64 CHAR), 
	"TZ_ABBREV" VARCHAR2(4 CHAR), 
	"ICAO" VARCHAR2(4 CHAR), 
	"IATA" VARCHAR2(3 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$UQ01" UNIQUE ("ICAO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$UQ02" UNIQUE ("IATA")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                  ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                 ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK00" CHECK (LATITUDE is null or LATITUDE between - 91 and 90) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK01" CHECK (LONGITUDE is null or LONGITUDE between - 181 and 180) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK02" CHECK (LATITUDE is null and LONGITUDE is null or LATITUDE is not null and LONGITUDE is not null) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK03" CHECK (regexp_like(TZ_OFFSET
                                                                              ,'^(-|\+)([0-1][0-9]|20|21|22|23):[0-5][0-9]$'
                                                                              ,'c')) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK04" CHECK (TZ_ABBREV = upper(TZ_ABBREV)) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK05" CHECK (ICAO = upper(ICAO)) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$CHK06" CHECK (IATA = upper(IATA)) ENABLE;
  ALTER TABLE "DL_COMMON"."AIRPORTS" ADD CONSTRAINT "AIRPORTS$FK00" FOREIGN KEY ("COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DISPLAY_VALUE" IS 'Name of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."LATITUDE" IS 'Valid between -90 and 90 (-91 means invalid)';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."LONGITUDE" IS 'Valid between -180 and 180 (-181 means invalid)';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."ALTITUDE" IS 'not in use';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."COUNTRY" IS 'Country of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."CITY" IS 'City of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."TZ_OFFSET" IS 'Timezone Offset';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."TZ_REGION" IS 'Timezone region';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."TZ_ABBREV" IS 'not in use';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."ICAO" IS 'ICAO Code of Airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."IATA" IS 'IATA Code of airport';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."AIRPORTS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."AIRPORTS"  IS 'Table for Airports';
  CREATE INDEX "DL_COMMON"."AIRPORTS$IX00" ON "DL_COMMON"."AIRPORTS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."AIRPORTS$IX01" ON "DL_COMMON"."AIRPORTS" ("COUNTRY") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$PK" ON "DL_COMMON"."AIRPORTS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$UQ00" ON "DL_COMMON"."AIRPORTS" ("NUM_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$UQ01" ON "DL_COMMON"."AIRPORTS" ("ICAO") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."AIRPORTS$UQ02" ON "DL_COMMON"."AIRPORTS" ("IATA") 
  ;
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."AIRPORTS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."AIRPORTS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."AIRPORTS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."AIRPORTS" TO "PORNRUKSA_S";
