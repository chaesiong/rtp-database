CREATE TABLE "DL_BORDERCONTROL"."BIO_IDENTITIES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ABIS_ID" NUMBER NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"FACE_PHOTO" BLOB, 
	"FINGERPRINT_01" BLOB, 
	"FINGERPRINT_02" BLOB, 
	"FINGERPRINT_03" BLOB, 
	"FINGERPRINT_04" BLOB, 
	"FINGERPRINT_05" BLOB, 
	"FINGERPRINT_06" BLOB, 
	"FINGERPRINT_07" BLOB, 
	"FINGERPRINT_08" BLOB, 
	"FINGERPRINT_09" BLOB, 
	"FINGERPRINT_10" BLOB
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_IDENTITIES" ADD CONSTRAINT "BIO_IDENTITIES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_IDENTITIES" ADD CONSTRAINT "BIO_IDENTITIES$UQ01" UNIQUE ("ABIS_ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_IDENTITIES" ADD CONSTRAINT "BIO_IDENTITIES$CK01" CHECK (IS_ACTIVE in ('Y','N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_IDENTITIES" ADD CONSTRAINT "BIO_IDENTITIES$CK02" CHECK (DML_TYPE in ('I','U')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."KEY_VALUE" IS 'Primary key (automatically created)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."DML_AT" IS 'Changed / Updated at';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."DML_BY" IS 'Changed / Updated by';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."DML_TYPE" IS 'Action of the last change (D.elete, I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."ABIS_ID" IS 'Key of ABIS entry (column AFIS_ID / ABIS_ID in table DL_BORDERCONTROL.BORDERDOCUMENTS)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."IS_ACTIVE" IS 'Sets flag if this dataset is active or not (Y = is active, N = is not active)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FACE_PHOTO" IS 'Photo of the person';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_01" IS 'Fingerprint of finger 1';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_02" IS 'Fingerprint of finger 2';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_03" IS 'Fingerprint of finger 3';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_04" IS 'Fingerprint of finger 4';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_05" IS 'Fingerprint of finger 5';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_06" IS 'Fingerprint of finger 6';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_07" IS 'Fingerprint of finger 7';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_08" IS 'Fingerprint of finger 8';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_09" IS 'Fingerprint of finger 9';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_IDENTITIES"."FINGERPRINT_10" IS 'Fingerprint of finger 10';
   COMMENT ON TABLE "DL_BORDERCONTROL"."BIO_IDENTITIES"  IS 'This table defines the biometric (and demographic) mappings of several passport of the same person / identity';
  CREATE INDEX "DL_BORDERCONTROL"."BIO_IDENTITIES_INS_AT" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" ("INS_AT") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BIO_IDENTITIES$PK" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BIO_IDENTITIES$UQ01" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" ("ABIS_ID") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00009$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00010$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00011$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00012$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00013$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00014$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00015$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00016$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00017$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00018$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000312177C00019$$" ON "DL_BORDERCONTROL"."BIO_IDENTITIES" (
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BIO_IDENTITIES" TO "BIOSAADM";
