CREATE TABLE "DL_DBA"."TEMPLATES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR), 
	"TEMPLATE_KEY" VARCHAR2(512 CHAR) NOT NULL ENABLE, 
	"TEMPLATE_VAL" CLOB, 
	"MAJOR" NUMBER(5,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"MINOR" NUMBER(5,0) DEFAULT ON NULL 0 NOT NULL ENABLE, 
	"PATCH" NUMBER(5,0) DEFAULT ON NULL 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK02" CHECK (IS_ACTIVE in ('Y'
                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$CK03" CHECK (DML_TYPE in ('I'
                                                                             ,'U')) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$UQ01" UNIQUE ("TEMPLATE_KEY")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES" ADD CONSTRAINT "TEMPLATES$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."KEY_VALUE" IS 'Key value (Primary key)';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."LOCALE" IS 'Localisation of all character columns of the row, links to table DL_COMMON.LOCALES';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."DML_AT" IS 'Last executed DML at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."DML_BY" IS 'Last executed DML by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."DML_TYPE" IS 'Last executed DML-Action: ''I'' => Insert, ''U'' => Update, ''D'' => Delete';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."NUM_VALUE" IS 'Numerical key value (Unique key)';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES"."OWNER" IS 'Owner of the row, links to table DL_COMMON.OWNERS';
  CREATE INDEX "DL_DBA"."TEMPLATES$IX00" ON "DL_DBA"."TEMPLATES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_DBA"."TEMPLATES$IX01" ON "DL_DBA"."TEMPLATES" ("OWNER") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."SYS_IL0000310327C00016$$" ON "DL_DBA"."TEMPLATES" (
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$PK" ON "DL_DBA"."TEMPLATES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$UQ00" ON "DL_DBA"."TEMPLATES" ("NUM_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$UQ01" ON "DL_DBA"."TEMPLATES" ("TEMPLATE_KEY") 
  ;
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "SERVAPP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."TEMPLATES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "APPSUP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_DBA"."TEMPLATES" TO "BIOSUPPORT";
