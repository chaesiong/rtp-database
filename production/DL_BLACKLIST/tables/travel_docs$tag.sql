CREATE TABLE "DL_BLACKLIST"."TRAVEL_DOCS$TAG" 
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
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS$TAG" ADD CONSTRAINT "TRAVEL_DOCS$TAG$PK" PRIMARY KEY ("KEY_VALUE", "OWNER", "TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS$TAG" ADD CONSTRAINT "TRAVEL_DOCS$TAG$CK01" CHECK (DML_TYPE in ('I'
                                                                                               ,'U')) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS$TAG" ADD CONSTRAINT "TRAVEL_DOCS$TAG$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_BLACKLIST"."TRAVEL_DOCS" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_BLACKLIST"."TRAVEL_DOCS$TAG" ADD CONSTRAINT "TRAVEL_DOCS$TAG$FK01" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."KEY_VALUE" IS 'Unique identifier';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."OWNER" IS 'Owner';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."TAG" IS 'Tag';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."NOTICE" IS 'Additional optional Information to the travel documents';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."TRAVEL_DOCS$TAG"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_BLACKLIST"."TRAVEL_DOCS$TAG"  IS 'Tags for the basis table rows';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."TRAVEL_DOCS$TAG$PK" ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" ("KEY_VALUE", "OWNER", "TAG") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO PUBLIC;
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."TRAVEL_DOCS$TAG" TO "PUNYAWII_D";
