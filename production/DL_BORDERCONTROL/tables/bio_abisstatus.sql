CREATE TABLE "DL_BORDERCONTROL"."BIO_ABISSTATUS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"ABIS_ID" NUMBER NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_ABISSTATUS" ADD CONSTRAINT "BIO_ABISSTATUS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_ABISSTATUS" ADD CONSTRAINT "BIO_ABISSTATUS$CK02" CHECK (IS_ACTIVE in ('Y','N')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_ABISSTATUS" ADD CONSTRAINT "BIO_ABISSTATUS$CK03" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."BIO_ABISSTATUS" ADD CONSTRAINT "BIO_ABISSTATUS$FK00" FOREIGN KEY ("ABIS_ID")
	  REFERENCES "DL_BORDERCONTROL"."BIO_IDENTITIES" ("ABIS_ID") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."KEY_VALUE" IS 'Primary key (automatically created)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."DML_AT" IS 'Changed / Updated at';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."DML_BY" IS 'Changed / Updated by';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."DML_TYPE" IS 'Action of the last change (D.elete, I.nsert, U.pdate)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."IS_ACTIVE" IS 'Sets flag if this dataset is active or not (Y = is active, N = is not active)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BIO_ABISSTATUS"."ABIS_ID" IS 'Key of ABIS entry (ABIS system)';
   COMMENT ON TABLE "DL_BORDERCONTROL"."BIO_ABISSTATUS"  IS 'Copies the information from ABIS to show the actual situation in ABIS';
  CREATE INDEX "DL_BORDERCONTROL"."BIO_ABISSTATUS$IX01" ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" ("ABIS_ID", "IS_ACTIVE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."BIO_ABISSTATUS$PK" ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" ("KEY_VALUE") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."BIO_ABISSTATUS" TO "PUNYAWII_D";
