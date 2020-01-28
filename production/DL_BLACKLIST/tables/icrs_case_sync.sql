CREATE TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"BL_CASE_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BL_CASE_NO" VARCHAR2(100 CHAR), 
	"STATUS" NUMBER DEFAULT 0 NOT NULL ENABLE, 
	"EXT_SEQ_NO" VARCHAR2(70 CHAR), 
	"RESULT_XML" CLOB, 
	"RESULT_FLAG" VARCHAR2(2 CHAR), 
	"REQUEST_FROM" VARCHAR2(255 CHAR), 
	"REQUEST_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"REQUEST_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC" ADD CONSTRAINT "ICRS_CASE_SYNC$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC" ADD CONSTRAINT "ICRS_CASE_SYNC$CK00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 3) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC" ADD CONSTRAINT "ICRS_CASE_SYNC$CK03" CHECK (DML_TYPE in ('I'
                                                                                                    ,'U')) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC" ADD CONSTRAINT "ICRS_CASE_SYNC$UK" UNIQUE ("BL_CASE_ID", "BL_CASE_NO", "EXT_SEQ_NO")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."KEY_VALUE" IS 'Primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."BL_CASE_ID" IS 'ID of the blacklist case';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."BL_CASE_NO" IS 'Number of the blacklist case';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."STATUS" IS 'Status of the case; 0=Succesful received, 1=Done';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."EXT_SEQ_NO" IS 'External SeqNo';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."RESULT_XML" IS 'Result XML';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."RESULT_FLAG" IS 'Result flag';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."REQUEST_FROM" IS 'Request user';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."REQUEST_AT" IS 'Export requested date';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."REQUEST_BY" IS 'Export requested by, user / system';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."INS_AT" IS 'Insert date';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."INS_BY" IS 'Insert by';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."DML_AT" IS 'Last change date';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."DML_BY" IS 'Last change user / system';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC"."DML_TYPE" IS 'Last change action type';
   COMMENT ON TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC"  IS 'Table to track what cases have been send out and what status they have';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."ICRS_CASE_SYNC$PK" ON "DL_BLACKLIST"."ICRS_CASE_SYNC" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."ICRS_CASE_SYNC$UK" ON "DL_BLACKLIST"."ICRS_CASE_SYNC" ("BL_CASE_ID", "BL_CASE_NO", "EXT_SEQ_NO") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312656C00006$$" ON "DL_BLACKLIST"."ICRS_CASE_SYNC" (
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PIBICSAPP";
  GRANT DELETE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DL_BORDERCONTROL";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DL_BORDERCONTROL";
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC" TO "PUNYAWII_D";
