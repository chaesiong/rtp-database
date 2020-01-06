CREATE TABLE "DL_COMMON"."ACTION_CODES" 
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
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$CK01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$CK02" CHECK (IS_ACTIVE in ('Y'
                                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$CK03" CHECK (DML_TYPE in ('I'
                                                                                             ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ACTION_CODES" ADD CONSTRAINT "ACTION_CODES$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."ACTION_CODES"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."ACTION_CODES"  IS 'Table for Action Codes';
  CREATE INDEX "DL_COMMON"."ACTION_CODES$IX00" ON "DL_COMMON"."ACTION_CODES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."ACTION_CODES$IX01" ON "DL_COMMON"."ACTION_CODES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ACTION_CODES$PK" ON "DL_COMMON"."ACTION_CODES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ACTION_CODES$UQ00" ON "DL_COMMON"."ACTION_CODES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."ACTION_CODES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ACTION_CODES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ACTION_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ACTION_CODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "BIOSUPPORT";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "DL_BORDERCONTROL";
  GRANT ALTER ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."ACTION_CODES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."ACTION_CODES" TO "PORNRUKSA_S";
