CREATE TABLE "DL_COMMON"."MESSAGES$HIS" 
   (	"MESSAGE_KEY" VARCHAR2(512 CHAR) NOT NULL ENABLE, 
	"KEY_DELIMITER" VARCHAR2(10 CHAR), 
	"LOCALE" VARCHAR2(5 CHAR), 
	"MESSAGE_VALUE" VARCHAR2(4000 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"OWNER" VARCHAR2(128 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."MESSAGES$HIS" ADD CONSTRAINT "MESSAGES$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                         ,'U'
                                                                                         ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."MESSAGE_KEY" IS 'The key is treated case sensitive and it could be a path like the example "[Owner]\[App-Domain]\[App-Name]\[App-Page]\[%]..."!';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."KEY_DELIMITER" IS 'The delimiter used for split the key in each parts, i. e. the key represents a path.';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."MESSAGE_VALUE" IS 'Message text';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."OWNER" IS 'Owner who has inserted and is responsible for this row.';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."MESSAGES$HIS"  IS 'History of Messages';
  CREATE INDEX "DL_COMMON"."MESSAGES$HIS$IX00" ON "DL_COMMON"."MESSAGES$HIS" ("MESSAGE_KEY", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."MESSAGES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."MESSAGES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."MESSAGES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "PUNYAWII_D";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$HIS" TO "SANTIPATN_P";
