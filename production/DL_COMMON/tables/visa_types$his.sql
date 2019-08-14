CREATE TABLE "DL_COMMON"."VISA_TYPES$HIS" 
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
	"ICAO_DC_LIST" VARCHAR2(32 CHAR), 
	"PERMIT_DAYS" NUMBER(4,0), 
	"CAN_EDIT_EXPIRY_DT" VARCHAR2(1 CHAR), 
	"AUTO_GENERATE_VISA" VARCHAR2(1 CHAR), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."VISA_TYPES$HIS" ADD CONSTRAINT "VISA_TYPES$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                             ,'U'
                                                                                             ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."DISPLAY_VALUE" IS 'Name of the Visa Types';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."TRANS_MODE" IS 'Entry is valid, if set, then only for the given transport mode, otherwise for all transport modes!';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."ICAO_DC_LIST" IS 'Entry is valid, if set, then only for the Nationalities by ICAO-Doc-Codes included into the given list, otherwise for all ICAO-Doc-Codes!';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."PERMIT_DAYS" IS 'If ICAO_DC_LIST is set, then the maximum permited stay in days must also be set.';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."CAN_EDIT_EXPIRY_DT" IS 'Officer can edit the expiry date of the stay of the traveller';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."AUTO_GENERATE_VISA" IS 'Automatically generate a visa from the given type and permit days into the visa table';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."VISA_TYPES$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."VISA_TYPES$HIS"  IS 'History of Visa Types';
  CREATE INDEX "DL_COMMON"."VISA_TYPES$HIS$IX00" ON "DL_COMMON"."VISA_TYPES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."VISA_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."VISA_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."VISA_TYPES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."VISA_TYPES$HIS" TO "APPSUP";
