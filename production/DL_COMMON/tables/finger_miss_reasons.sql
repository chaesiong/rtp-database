CREATE TABLE "DL_COMMON"."FINGER_MISS_REASONS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."FINGER_MISS_REASONS" ADD CONSTRAINT "FINGER_MISS_REASONS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_MISS_REASONS" ADD CONSTRAINT "FINGER_MISS_REASONS$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_MISS_REASONS" ADD CONSTRAINT "FINGER_MISS_REASONS$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 2) ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_MISS_REASONS" ADD CONSTRAINT "FINGER_MISS_REASONS$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_MISS_REASONS" ADD CONSTRAINT "FINGER_MISS_REASONS$CHK$C02" CHECK (IS_ACTIVE in ('Y'
                                                                                                        ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_MISS_REASONS" ADD CONSTRAINT "FINGER_MISS_REASONS$CHK$C03" CHECK (DML_TYPE in ('I'
                                                                                                       ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."DISPLAY_VALUE" IS 'Name of the Finger missiing reasons';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_MISS_REASONS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."FINGER_MISS_REASONS"  IS 'Table for finger missing reasons';
  CREATE INDEX "DL_COMMON"."FINGER_MISS_REASONS$IX00" ON "DL_COMMON"."FINGER_MISS_REASONS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."FINGER_MISS_REASONS$PK" ON "DL_COMMON"."FINGER_MISS_REASONS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."FINGER_MISS_REASONS$UQ00" ON "DL_COMMON"."FINGER_MISS_REASONS" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."FINGER_MISS_REASONS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."FINGER_MISS_REASONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."FINGER_MISS_REASONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."FINGER_MISS_REASONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."FINGER_MISS_REASONS" TO "SANTIPATN_P";
