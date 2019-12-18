CREATE TABLE "DL_COMMON"."PROFESSIONS$I18N$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."PROFESSIONS$I18N$HIS" ADD CONSTRAINT "PROFESSIONS$I18N$HIS$CHK01" CHECK (dml_type IN ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."DISPLAY_VALUE" IS 'Name of the profession';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."PROFESSIONS$I18N$HIS"."NOTICE" IS 'Calumn for notes';
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."PROFESSIONS$I18N$HIS" TO "PORNRUKSA_S";
