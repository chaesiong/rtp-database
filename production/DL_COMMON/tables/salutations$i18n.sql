CREATE TABLE "DL_COMMON"."SALUTATIONS$I18N" 
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
  ALTER TABLE "DL_COMMON"."SALUTATIONS$I18N" ADD CONSTRAINT "SALUTATIONS$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."SALUTATIONS$I18N" ADD CONSTRAINT "SALUTATIONS$I18N$CHK00" CHECK (locale != 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."SALUTATIONS$I18N" ADD CONSTRAINT "SALUTATIONS$I18N$CHK01" CHECK (dml_type IN ('I','U')) ENABLE;
  ALTER TABLE "DL_COMMON"."SALUTATIONS$I18N" ADD CONSTRAINT "SALUTATIONS$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_COMMON"."SALUTATIONS" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."SALUTATIONS$I18N" ADD CONSTRAINT "SALUTATIONS$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."DISPLAY_VALUE" IS 'Name of the salutations';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."DML_TYPE" IS 'Audit (I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_COMMON"."SALUTATIONS$I18N"."NOTICE" IS 'Colume for notice';
  CREATE UNIQUE INDEX "DL_COMMON"."SALUTATIONS$I18N$PK" ON "DL_COMMON"."SALUTATIONS$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT DELETE ON "DL_COMMON"."SALUTATIONS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_COMMON"."SALUTATIONS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."SALUTATIONS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_COMMON"."SALUTATIONS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."SALUTATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."SALUTATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."SALUTATIONS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."SALUTATIONS$I18N" TO "BIOSAADM";
