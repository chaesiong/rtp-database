CREATE TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BL_CASE_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"BL_CASE_NO" VARCHAR2(100 CHAR), 
	"STATUS" NUMBER NOT NULL ENABLE, 
	"EXT_SEQ_NO" VARCHAR2(70 CHAR), 
	"RESULT_XML" CLOB, 
	"RESULT_FLAG" VARCHAR2(2 CHAR), 
	"REQUEST_FROM" VARCHAR2(255 CHAR), 
	"REQUEST_AT" DATE NOT NULL ENABLE, 
	"REQUEST_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" ADD CONSTRAINT "ICRS_CASE_SYNC$HIS$CK00" CHECK (DML_TYPE in ('I'
                                                                                                            ,'U'
                                                                                                            ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."KEY_VALUE" IS 'Primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."BL_CASE_ID" IS 'ID of the blacklist case';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."BL_CASE_NO" IS 'Number of the blacklist case';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."STATUS" IS 'Status of the case; 0=Succesful received, 1=Done';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."EXT_SEQ_NO" IS 'External SeqNo';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."RESULT_XML" IS 'Result XML';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."RESULT_FLAG" IS 'Result flag';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."REQUEST_FROM" IS 'Request user';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."REQUEST_AT" IS 'Export requested date';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."REQUEST_BY" IS 'Export requested by, user / system';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."INS_AT" IS 'Insert date';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."INS_BY" IS 'Insert by';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."DML_AT" IS 'Last change date';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."DML_BY" IS 'Last change user / system';
   COMMENT ON COLUMN "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"."DML_TYPE" IS 'Last change action type';
   COMMENT ON TABLE "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS"  IS 'History table of ICRS_CASE_SYNC';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."SYS_IL0000312661C00006$$" ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" (
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."ICRS_CASE_SYNC$HIS" TO "PUNYAWII_D";
