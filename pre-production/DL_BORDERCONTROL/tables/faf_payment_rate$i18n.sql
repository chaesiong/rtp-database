CREATE TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(500 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ADD CONSTRAINT "FAF_PAYMENT_RATE$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ADD CONSTRAINT "FAF_PAYMENT_RATE$I18N$CK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ADD CONSTRAINT "FAF_PAYMENT_RATE$I18N$CK01" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ADD CONSTRAINT "FAF_PAYMENT_RATE$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_BORDERCONTROL"."FAF_PAYMENT_RATE" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ADD CONSTRAINT "FAF_PAYMENT_RATE$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."DISPLAY_VALUE" IS 'Name of the Payment rate';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."NOTICE" IS 'Column for Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N"  IS 'Translation of Payments Rates';
  CREATE INDEX "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N$IX02" ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ("DISPLAY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N$PK" ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$I18N" TO "TRAINEE";
