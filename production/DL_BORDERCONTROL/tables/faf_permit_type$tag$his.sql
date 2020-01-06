CREATE TABLE "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" 
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
  ALTER TABLE "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" ADD CONSTRAINT "FAF_PERMIT_TYPE$TAG$HIS$CK00" CHECK (DML_TYPE in ('I'
                                                                                                               ,'U'
                                                                                                               ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."OWNER" IS 'FK to DL_COMMON.OWNERS';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."TAG" IS 'Tag';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."NOTICE" IS 'Column for Notes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."INS_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."INS_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."DML_AT" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."DML_BY" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."DML_TYPE" IS 'Audit';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS"  IS 'History Permit Types Tag';
  CREATE INDEX "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS$IX00" ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" ("KEY_VALUE", "OWNER", "TAG", "DML_AT") 
  ;
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."FAF_PERMIT_TYPE$TAG$HIS" TO "PORNRUKSA_S";
