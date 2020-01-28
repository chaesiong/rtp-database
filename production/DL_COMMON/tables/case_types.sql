CREATE TABLE "DL_COMMON"."CASE_TYPES" 
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
  ALTER TABLE "DL_COMMON"."CASE_TYPES" ADD CONSTRAINT "CASE_TYPES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."CASE_TYPES" ADD CONSTRAINT "CASE_TYPES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."CASE_TYPES" ADD CONSTRAINT "CASE_TYPES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_COMMON"."CASE_TYPES" ADD CONSTRAINT "CASE_TYPES$CK01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."CASE_TYPES" ADD CONSTRAINT "CASE_TYPES$CK02" CHECK (IS_ACTIVE in ('Y'
                                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."CASE_TYPES" ADD CONSTRAINT "CASE_TYPES$CK03" CHECK (DML_TYPE in ('I'
                                                                                             ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."CASE_TYPES"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."CASE_TYPES"  IS 'Table for Case Types';
  CREATE INDEX "DL_COMMON"."CASE_TYPES$IX00" ON "DL_COMMON"."CASE_TYPES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."CASE_TYPES$IX01" ON "DL_COMMON"."CASE_TYPES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."CASE_TYPES$PK" ON "DL_COMMON"."CASE_TYPES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."CASE_TYPES$UQ00" ON "DL_COMMON"."CASE_TYPES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."CASE_TYPES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."CASE_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CASE_TYPES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."CASE_TYPES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CASE_TYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_COMMON"."CASE_TYPES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."CASE_TYPES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_COMMON"."CASE_TYPES" TO "PUNYAWII_D";
