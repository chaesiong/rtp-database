CREATE TABLE "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(4 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" ADD CONSTRAINT "FAF_PERMIT_TYPE$HIS$CK00" CHECK (DML_TYPE in ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."DISPLAY_VALUE" IS 'Name of the permission type (Fee and Fine)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."DISPLAY_CODE" IS 'Four characters to describe the Permission entries; will be used by the customer';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."NOTICE" IS 'Column for Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS"  IS 'History Permit Types';
  CREATE INDEX "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS$IX00" ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "TESTADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "TRAINEE";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "TRAINEE";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$HIS" TO "TRAINEE";
