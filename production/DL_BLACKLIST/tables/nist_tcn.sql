CREATE TABLE "DL_BLACKLIST"."NIST_TCN" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT sys_guid() NOT NULL ENABLE, 
	"BL_CASE_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"NIST_TCN_NO" VARCHAR2(11 CHAR) NOT NULL ENABLE, 
	"INS_FROM" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BLACKLIST"."NIST_TCN" ADD CONSTRAINT "NIST_TCN$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."NIST_TCN" ADD CONSTRAINT "NIST_TCN$UQ00" UNIQUE ("NIST_TCN_NO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."NIST_TCN" ADD CONSTRAINT "NIST_TCN$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."NIST_TCN" ADD CONSTRAINT "NIST_TCN$CK03" CHECK (DML_TYPE in ('I'
                                                                                  ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."KEY_VALUE" IS 'Primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."BL_CASE_ID" IS 'Blacklist Case ID';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."NIST_TCN_NO" IS 'NIST tcn number';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."INS_FROM" IS 'Inserted from';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."INS_AT" IS 'Inserted at';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."INS_BY" IS 'Inserted by';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."DML_AT" IS 'Changed at';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."DML_BY" IS 'Changed by';
   COMMENT ON COLUMN "DL_BLACKLIST"."NIST_TCN"."DML_TYPE" IS 'Changed type';
   COMMENT ON TABLE "DL_BLACKLIST"."NIST_TCN"  IS 'Table to track the tcn number that has been handed out connected to a blacklist case';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."NIST_TCN$PK" ON "DL_BLACKLIST"."NIST_TCN" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."NIST_TCN$UQ00" ON "DL_BLACKLIST"."NIST_TCN" ("NIST_TCN_NO") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."NIST_TCN" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "PIBICSAPP";
  GRANT INSERT ON "DL_BLACKLIST"."NIST_TCN" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "DL_BORDERCONTROL";
  GRANT UPDATE ON "DL_BLACKLIST"."NIST_TCN" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."NIST_TCN" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."NIST_TCN" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."NIST_TCN" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."NIST_TCN" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."NIST_TCN" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."NIST_TCN" TO "PORNRUKSA_S";
