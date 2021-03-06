CREATE TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" ADD CONSTRAINT "ARRESTED_STATUSES$I18N$PK" PRIMARY KEY ("KEY_VALUE", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" ADD CONSTRAINT "ARRESTED_STATUSES$I18N$CK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" ADD CONSTRAINT "ARRESTED_STATUSES$I18N$CK01" CHECK (DML_TYPE in ('I'
                                                                                                     ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" ADD CONSTRAINT "ARRESTED_STATUSES$I18N$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_COMMON"."ARRESTED_STATUSES" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" ADD CONSTRAINT "ARRESTED_STATUSES$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N" ADD CONSTRAINT "ARRESTED_STATUSES$I18N$FK02" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_STATUSES$I18N"."OWNER" IS 'Owner of the data';
   COMMENT ON TABLE "DL_COMMON"."ARRESTED_STATUSES$I18N"  IS 'Translation of Arrested Statuses';
  CREATE INDEX "DL_COMMON"."ARRESTED_STATUSES$I18N$IX02" ON "DL_COMMON"."ARRESTED_STATUSES$I18N" ("DISPLAY_VALUE") 
  ;
CREATE INDEX "DL_COMMON"."ARRESTED_STATUSES$I18N$IX03" ON "DL_COMMON"."ARRESTED_STATUSES$I18N" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ARRESTED_STATUSES$I18N$PK" ON "DL_COMMON"."ARRESTED_STATUSES$I18N" ("KEY_VALUE", "LOCALE") 
  ;
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "PIBICSAPP";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_STATUSES$I18N" TO "PUNYAWII_D";
