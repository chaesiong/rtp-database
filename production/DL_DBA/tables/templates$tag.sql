CREATE TABLE "DL_DBA"."TEMPLATES$TAG" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"TAG" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_DBA"."TEMPLATES$TAG" ADD CONSTRAINT "TEMPLATES$TAG$PK" PRIMARY KEY ("KEY_VALUE", "OWNER", "TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$TAG" ADD CONSTRAINT "TEMPLATES$TAG$CK01" CHECK (DML_TYPE in ('I'
                                                                                     ,'U')) ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$TAG" ADD CONSTRAINT "TEMPLATES$TAG$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_DBA"."TEMPLATES" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_DBA"."TEMPLATES$TAG" ADD CONSTRAINT "TEMPLATES$TAG$FK01" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."KEY_VALUE" IS 'Key value, links to table DL_DBA.TEMPLATES';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."OWNER" IS 'Owner of the row, links to table DL_COMMON.OWNERS';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."TAG" IS 'Free defined tag only valid in context of the owner';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."DML_AT" IS 'Last executed DML at';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."DML_BY" IS 'Last executed DML by';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."DML_TYPE" IS 'Last executed DML-Action: ''I'' => Insert, ''U'' => Update, ''D'' => Delete';
   COMMENT ON COLUMN "DL_DBA"."TEMPLATES$TAG"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 => reserved, 16 => prevent update, 32 => prevent delete, 64 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_DBA"."TEMPLATES$TAG"  IS 'Any User-/Process-Tags for rows of table DL_DBA.TEMPLATES';
  CREATE UNIQUE INDEX "DL_DBA"."TEMPLATES$TAG$PK" ON "DL_DBA"."TEMPLATES$TAG" ("KEY_VALUE", "OWNER", "TAG") 
  ;
  GRANT SELECT ON "DL_DBA"."TEMPLATES$TAG" TO "SERVAPP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_DBA"."TEMPLATES$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_DBA"."TEMPLATES$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_DBA"."TEMPLATES$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$TAG" TO "APPSUP";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$TAG" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_DBA"."TEMPLATES$TAG" TO "BIOSUPPORT";
