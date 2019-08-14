CREATE TABLE "DL_BORDERCONTROL"."IDENTITIES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"IDENTITY" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BRDDOCID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"SOURCE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 3) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$CK01" CHECK (DML_TYPE in ('I'
                                                                                                    ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."IDENTITIES" ADD CONSTRAINT "IDENTITIES$FK00" FOREIGN KEY ("BRDDOCID")
	  REFERENCES "DL_BORDERCONTROL"."BORDERDOCUMENTS" ("BRDDOCID") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."KEY_VALUE" IS 'ID Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."IDENTITY" IS 'Key of the Persons identity';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."BRDDOCID" IS 'Foreign key, Borderdocuments';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."SOURCE" IS 'Key on how the identity was created. ';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."INS_AT" IS 'Insert Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."INS_BY" IS 'Insert User';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."DML_AT" IS 'Changed Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."DML_BY" IS 'Changed User';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."IDENTITIES"."DML_TYPE" IS 'Changement Type';
   COMMENT ON TABLE "DL_BORDERCONTROL"."IDENTITIES"  IS 'Table to match Person Identitys in case of multiple passports';
  CREATE INDEX "DL_BORDERCONTROL"."IDENTITIES$IX00" ON "DL_BORDERCONTROL"."IDENTITIES" ("KEY_VALUE", "IDENTITY") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."IDENTITIES$IX01" ON "DL_BORDERCONTROL"."IDENTITIES" ("BRDDOCID") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."IDENTITIES$IX02" ON "DL_BORDERCONTROL"."IDENTITIES" ("IDENTITY") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."IDENTITIES$PK" ON "DL_BORDERCONTROL"."IDENTITIES" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES" TO "APPSUP";
  GRANT INSERT ON "DL_BORDERCONTROL"."IDENTITIES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."IDENTITIES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."IDENTITIES" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."IDENTITIES" TO "JASPER_REPORTING";