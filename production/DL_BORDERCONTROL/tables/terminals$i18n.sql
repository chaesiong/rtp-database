CREATE TABLE "DL_BORDERCONTROL"."TERMINALS$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"NAME" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS$I18N" ADD CONSTRAINT "TERMINALS$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS$I18N" ADD CONSTRAINT "TERMINALS$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS$I18N" ADD CONSTRAINT "TERMINALS$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS$I18N" ADD CONSTRAINT "TERMINALS$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_BORDERCONTROL"."TERMINALS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."TERMINALS$I18N" ADD CONSTRAINT "TERMINALS$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."NAME" IS 'Name of Terminal';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."TERMINALS$I18N"."INS_BY" IS 'User who insert the data';
  CREATE INDEX "DL_BORDERCONTROL"."TERMINALS$I18N$IX00" ON "DL_BORDERCONTROL"."TERMINALS$I18N" ("KEY_VALUE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."TERMINALS$I18N$IX01" ON "DL_BORDERCONTROL"."TERMINALS$I18N" ("LOCALE") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."TERMINALS$I18N$IX02" ON "DL_BORDERCONTROL"."TERMINALS$I18N" ("NAME") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."TERMINALS$I18N$PK" ON "DL_BORDERCONTROL"."TERMINALS$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."TERMINALS$I18N" TO "BIOSUPPORT";
