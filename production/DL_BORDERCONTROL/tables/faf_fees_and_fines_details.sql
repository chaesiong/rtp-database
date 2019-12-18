CREATE TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"POSITION" NUMBER(3,0) DEFAULT 1 NOT NULL ENABLE, 
	"PAYMENT_RATE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"FEES_AND_FINES" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"COSTS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OVERSTAYED_DAYS" NUMBER
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" ADD CONSTRAINT "FAF_FEES_AND_FINES_DETAILS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" ADD CONSTRAINT "FAF_FEES_AND_FINES_DETAILS$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 3) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" ADD CONSTRAINT "FAF_FEES_AND_FINES_DETAILS$CK03" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" ADD CONSTRAINT "FAF_FEES_AND_FINES_DETAIL$FK01" FOREIGN KEY ("PAYMENT_RATE")
	  REFERENCES "DL_BORDERCONTROL"."FAF_PAYMENT_RATE" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" ADD CONSTRAINT "FAF_FEES_AND_FINES_DETAIL$FK02" FOREIGN KEY ("FEES_AND_FINES")
	  REFERENCES "DL_BORDERCONTROL"."FAF_FEES_AND_FINES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."NOTICE" IS 'Column for Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."POSITION" IS 'Number of the position (defines the order of the different positions for a fees and fines)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."PAYMENT_RATE" IS 'FK dl_bordercontrol.faf_payment_rate (defines the type of the position / detail entry)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."FEES_AND_FINES" IS 'FK dl_bordercontrol.faf_fees_and_fines (connects the detail position to a receipt)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."COSTS" IS 'Cost of the detail position';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"."OVERSTAYED_DAYS" IS 'Number of days the passenger has overstayed in Thailand';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS"  IS 'Used in Fees and Fines';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS$PK" ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_FEES_AND_FINES_DETAILS" TO "PORNRUKSA_S";
