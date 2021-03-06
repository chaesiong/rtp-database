CREATE TABLE "DL_COMMON"."LOCALES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"LC_LANGUAGE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"LC_COUNTRY" VARCHAR2(3 CHAR) NOT NULL ENABLE, 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                               ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$FK_LANGUAGE" FOREIGN KEY ("LC_LANGUAGE")
	  REFERENCES "DL_COMMON"."LANGUAGES" ("ISO639_1") ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$FK_COUNTRY" FOREIGN KEY ("LC_COUNTRY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("ISO3166_A3") ENABLE;
  ALTER TABLE "DL_COMMON"."LOCALES" ADD CONSTRAINT "LOCALES$FK_OWNER" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."LC_LANGUAGE" IS 'References table LANGUAGES';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."LC_COUNTRY" IS 'References table COUNTRIES';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."LOCALES"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."LOCALES"  IS 'Table for Locals';
  CREATE INDEX "DL_COMMON"."LOCALES$IX00" ON "DL_COMMON"."LOCALES" ("LC_LANGUAGE") 
  ;
CREATE INDEX "DL_COMMON"."LOCALES$IX01" ON "DL_COMMON"."LOCALES" ("LC_COUNTRY") 
  ;
CREATE INDEX "DL_COMMON"."LOCALES$IX02" ON "DL_COMMON"."LOCALES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."LOCALES$PK" ON "DL_COMMON"."LOCALES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."LOCALES$UQ00" ON "DL_COMMON"."LOCALES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."LOCALES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."LOCALES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."LOCALES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."LOCALES" TO "SANTIPATN_P";
