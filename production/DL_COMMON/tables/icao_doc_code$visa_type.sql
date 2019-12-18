CREATE TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" 
   (	"ICAO_DOC_CODE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"VISA_TYPE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR), 
	"IS_DEFAULT" CHAR(1 CHAR) DEFAULT ON NULL 'N' NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$PK" PRIMARY KEY ("ICAO_DOC_CODE", "VISA_TYPE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ADD CONSTRAINT "ICA_DOC_CODE$VISA_TYPE$CK00" CHECK (is_default in ('Y', 'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$CK01" CHECK (DML_TYPE in ('I'
                                                                                             ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$FK00" FOREIGN KEY ("OWNER")
	  REFERENCES "DL_COMMON"."OWNERS" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$FK01" FOREIGN KEY ("ICAO_DOC_CODE")
	  REFERENCES "DL_COMMON"."ICAO_DOC_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ADD CONSTRAINT "ICAO_DOC_CODE$VISA_TYPE$FK02" FOREIGN KEY ("VISA_TYPE")
	  REFERENCES "DL_COMMON"."VISA_TYPES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."ICAO_DOC_CODE" IS 'Foreign Key to ICAO Doc Codes';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."VISA_TYPE" IS 'Foreign Key to Visa Type';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."OWNER" IS 'Owner of the data';
   COMMENT ON COLUMN "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"."IS_DEFAULT" IS 'Is this entry the default entry? (Y.es, N.o)';
   COMMENT ON TABLE "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE"  IS 'This Table contains the different default visa types for the different countries';
  CREATE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$IX01" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ("OWNER") 
  ;
CREATE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$IX02" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ("VISA_TYPE") 
  ;
CREATE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$IX03" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ("ICAO_DOC_CODE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE$PK" ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" ("ICAO_DOC_CODE", "VISA_TYPE") 
  ;
  GRANT INSERT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."ICAO_DOC_CODE$VISA_TYPE" TO "PORNRUKSA_S";
