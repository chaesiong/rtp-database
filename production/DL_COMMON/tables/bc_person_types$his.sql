CREATE TABLE "DL_COMMON"."BC_PERSON_TYPES$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"TRANS_MODE" VARCHAR2(32 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."BC_PERSON_TYPES$HIS" ADD CONSTRAINT "BC_PERSON_TYPES$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                                       ,'U'
                                                                                                       ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."DISPLAY_VALUE" IS 'Name of the Person Type';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."TRANS_MODE" IS 'If set, then only valid for the given transport mode, otherwise valid for all transport modes!';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."BC_PERSON_TYPES$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."BC_PERSON_TYPES$HIS"  IS 'History for  Person Types';
  CREATE INDEX "DL_COMMON"."BC_PERSON_TYPES$HIS$IX00" ON "DL_COMMON"."BC_PERSON_TYPES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."BC_PERSON_TYPES$HIS" TO "PORNRUKSA_S";
