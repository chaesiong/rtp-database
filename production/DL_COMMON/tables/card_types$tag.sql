CREATE TABLE "DL_COMMON"."CARD_TYPES$TAG" 
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
  ALTER TABLE "DL_COMMON"."CARD_TYPES$TAG" ADD CONSTRAINT "CARD_TYPES$TAG$PK" PRIMARY KEY ("KEY_VALUE", "OWNER", "TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."CARD_TYPES$TAG" ADD CONSTRAINT "CARD_TYPES$TAG$CK01" CHECK (DML_TYPE in ('I'
                                                                                  ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."CARD_TYPES$TAG" ADD CONSTRAINT "CARD_TYPES$TAG$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_COMMON"."CARD_TYPES" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."CARD_TYPES$TAG" ADD CONSTRAINT "CARD_TYPES$TAG$FK01" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."OWNER" IS 'Owner of the data';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."TAG" IS 'Tag of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."CARD_TYPES$TAG"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."CARD_TYPES$TAG"  IS 'Tags for the basis table rows';
  CREATE UNIQUE INDEX "DL_COMMON"."CARD_TYPES$TAG$PK" ON "DL_COMMON"."CARD_TYPES$TAG" ("KEY_VALUE", "OWNER", "TAG") 
  ;
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."CARD_TYPES$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."CARD_TYPES$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."CARD_TYPES$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."CARD_TYPES$TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."CARD_TYPES$TAG" TO "PORNRUKSA_S";
