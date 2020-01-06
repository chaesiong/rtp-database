CREATE TABLE "DL_COMMON"."OWNERS$TAG$HIS" 
   (	"KEY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
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
  ALTER TABLE "DL_COMMON"."OWNERS$TAG$HIS" ADD CONSTRAINT "OWNERS$TAG$HIS$CK00" CHECK (DML_TYPE in ('I'
                                                                                          ,'U'
                                                                                          ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."OWNER" IS 'Owner of the data';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."TAG" IS 'Tag of the Owner';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."OWNERS$TAG$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."OWNERS$TAG$HIS"  IS 'History ot Tags of Owners';
  CREATE INDEX "DL_COMMON"."OWNERS$TAG$HIS$IX00" ON "DL_COMMON"."OWNERS$TAG$HIS" ("KEY_VALUE", "OWNER", "TAG", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."OWNERS$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."OWNERS$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."OWNERS$TAG$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."OWNERS$TAG$HIS" TO "PORNRUKSA_S";
