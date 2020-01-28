CREATE TABLE "DL_BLACKLIST"."IDENTITIES$TAG$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"TAG" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_BLACKLIST"."IDENTITIES$TAG$HIS" ADD CONSTRAINT "IDENTITIES$TAG$HIS$CK00" CHECK (DML_TYPE in ('I'
                                                                                                     ,'U'
                                                                                                     ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."KEY_VALUE" IS 'Key value';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."OWNER" IS 'Owner';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."TAG" IS 'Tag';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."NOTICE" IS 'Comment onto the identities Tag';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."INS_AT" IS 'When was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."INS_BY" IS 'By whom was the record created';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."DML_AT" IS 'When was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."DML_BY" IS 'By whom was the record last changed';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."IDENTITIES$TAG$HIS"."ROW_FLAG_MASK" IS 'Flag mask of the row';
  CREATE INDEX "DL_BLACKLIST"."IDENTITIES$TAG$HIS$IX00" ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" ("KEY_VALUE", "OWNER", "TAG", "DML_AT") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."IDENTITIES$TAG$HIS" TO "PUNYAWII_D";
