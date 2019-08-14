CREATE TABLE "DL_COMMON"."PORT_MOVEMENTS$HIS" 
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
	"IS_NEED_ENTRY_FORM" VARCHAR2(1 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"ICAO_DC_LIST4NO_ENTRY_FORM" VARCHAR2(32 CHAR), 
	"MUST_APPROVE_ENTRY_FORM_NO" VARCHAR2(1 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."PORT_MOVEMENTS$HIS" ADD CONSTRAINT "PORT_MOVEMENTS$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                                     ,'U'
                                                                                                     ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."DISPLAY_VALUE" IS 'Name of the Port Movement';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."IS_NEED_ENTRY_FORM" IS 'Controls if an entry form must be exist onto the movement for this port movement.';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."ICAO_DC_LIST4NO_ENTRY_FORM" IS 'Nationalities by ICAO-Doc-Codes they do not need an entry form for their movement for this port movement, even IS_NEED_ENTRY_FORM is set to ''Y''!';
   COMMENT ON COLUMN "DL_COMMON"."PORT_MOVEMENTS$HIS"."MUST_APPROVE_ENTRY_FORM_NO" IS 'Controls whether by this port movement the officer must approve the entry form number, because for example the movement is an exit move!';
   COMMENT ON TABLE "DL_COMMON"."PORT_MOVEMENTS$HIS"  IS 'History of Port Movements';
  CREATE INDEX "DL_COMMON"."PORT_MOVEMENTS$HIS$IX00" ON "DL_COMMON"."PORT_MOVEMENTS$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."PORT_MOVEMENTS$HIS" TO "TESTADM";
