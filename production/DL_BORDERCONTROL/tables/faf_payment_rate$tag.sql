CREATE TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" 
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
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" ADD CONSTRAINT "FAF_PAYMENT_RATE$TAG$PK" PRIMARY KEY ("KEY_VALUE", "OWNER", "TAG")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" ADD CONSTRAINT "FAF_PAYMENT_RATE$TAG$CK01" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" ADD CONSTRAINT "FAF_PAYMENT_RATE$TAG$FK00" FOREIGN KEY ("KEY_VALUE")
	  REFERENCES "DL_BORDERCONTROL"."FAF_PAYMENT_RATE" ("KEY_VALUE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" ADD CONSTRAINT "FAF_PAYMENT_RATE$TAG$FK01" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."OWNER" IS 'FK to DL_COMMON.OWNERS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."TAG" IS 'Tag';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."NOTICE" IS 'Column for Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG"  IS 'Tags for the basis table rows';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG$PK" ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" ("KEY_VALUE", "OWNER", "TAG") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_PAYMENT_RATE$TAG" TO "BIOSAADM";
