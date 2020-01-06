CREATE TABLE "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"DISPLAY_CODE" VARCHAR2(2 CHAR) NOT NULL ENABLE, 
	"ADM_CLASS_DISTRICT" VARCHAR2(32 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" ADD CONSTRAINT "ADM_CLASS_SUBDISTRICT$HIS$CHK$C03" CHECK (dml_type IN ('I', 'U', 'D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."NOTICE" IS 'Column for notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."DISPLAY_VALUE" IS 'Name of the administrative classification';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."DISPLAY_CODE" IS 'Two characters to describe the administrative classification; will be used by the customer';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS"."ADM_CLASS_DISTRICT" IS 'FK dl_bordercontrol.adm_class_district';
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."ADM_CLASS_SUBDISTRICT$HIS" TO "PORNRUKSA_S";
