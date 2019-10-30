CREATE TABLE "DL_COMMON"."FINGER_STATUS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."FINGER_STATUS" ADD CONSTRAINT "FINGER_STATUS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_STATUS" ADD CONSTRAINT "FINGER_STATUS$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_STATUS" ADD CONSTRAINT "FINGER_STATUS$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_STATUS" ADD CONSTRAINT "FINGER_STATUS$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                            ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."FINGER_STATUS" ADD CONSTRAINT "FINGER_STATUS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                           ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."DISPLAY_VALUE" IS 'Name of the Finger Status';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."FINGER_STATUS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."FINGER_STATUS"  IS 'Table for Finger Status';
  CREATE INDEX "DL_COMMON"."FINGER_STATUS$IX00" ON "DL_COMMON"."FINGER_STATUS" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."FINGER_STATUS$PK" ON "DL_COMMON"."FINGER_STATUS" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."FINGER_STATUS$UQ00" ON "DL_COMMON"."FINGER_STATUS" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."FINGER_STATUS" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."FINGER_STATUS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."FINGER_STATUS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."FINGER_STATUS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."FINGER_STATUS" TO "BIOSUPPORT";
