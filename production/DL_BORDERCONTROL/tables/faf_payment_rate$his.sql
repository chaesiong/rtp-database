CREATE TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) NOT NULL ENABLE, 
	"DISPLAY_CODE" VARCHAR2(6 CHAR), 
	"COSTS_REGULAR" NUMBER, 
	"COSTS_LIMIT" NUMBER, 
	"PAYMENT_TYPE" CHAR(1 CHAR), 
	"OWNER" VARCHAR2(128 CHAR), 
	"DISPLAY_VALUE_SHORT" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" ADD CONSTRAINT "FAF_PAYMENT_RATE$HIS$CK00" CHECK (dml_type IN ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DISPLAY_VALUE" IS 'Name of the Payment rate';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."NOTICE" IS 'Column for Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DISPLAY_CODE" IS 'Four CHARacters to describe the Payment rate; will be used by the customer';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."COSTS_REGULAR" IS 'Regular / DEFAULT price "per piece" for this Payment rate';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."COSTS_LIMIT" IS 'Maximum price limit of this Payment rate';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."PAYMENT_TYPE" IS 'Type of the payment rate (C = Fees, F = Fines, O = Overtime, E = Application Fee, A = Certificate system)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."OWNER" IS 'FK to DL_COMMON.OWNERS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"."DISPLAY_VALUE_SHORT" IS 'Short version of the display_value';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS"  IS 'History of Payment Rates';
  CREATE INDEX "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS$IX00" ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$HIS" TO "PUNYAWII_D";
