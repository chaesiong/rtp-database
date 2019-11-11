CREATE TABLE "DL_BORDERCONTROL"."BORDERPOSTS$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ADD CONSTRAINT "BORDERPOSTS$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ADD CONSTRAINT "BORDERPOSTS$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ADD CONSTRAINT "BORDERPOSTS$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                      ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ADD CONSTRAINT "BORDERPOSTS$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_BORDERCONTROL"."BORDERPOSTS" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ADD CONSTRAINT "BORDERPOSTS$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."NAME" IS 'Name of Borderpost';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERPOSTS$I18N"."INS_BY" IS 'User who insert the data';
  CREATE INDEX "DL_BORDERCONTROL"."BORDERPOSTS$I18N$IX00" ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ("KEY_VALUE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERPOSTS$I18N$IX01" ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ("LOCALE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERPOSTS$I18N$IX02" ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ("NAME") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BORDERPOSTS$I18N$PK" ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BORDERPOSTS$I18N" TO "BIOSAADM";
