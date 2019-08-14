CREATE TABLE "DL_COMMON"."HUMAN_SEXES$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"ISO5218" NUMBER(1,0), 
	"ICAO" VARCHAR2(1 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR)
   ) ;
  ALTER TABLE "DL_COMMON"."HUMAN_SEXES$HIS" ADD CONSTRAINT "HUMAN_SEXES$HIS$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                               ,'U'
                                                                                               ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."DISPLAY_VALUE" IS 'Name of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."ISO5218" IS 'ISO5218 value for human sexes e.g. 2 = Female';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."ICAO" IS 'ICAO value for human sexes e.g. F = Female';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."NUM_VALUE" IS 'Contains numeric values based onto the enumeration of the websocket server for the passport reader "public enum Gender {Unknown = 0, Male = 1, Female = 2, }"!';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."HUMAN_SEXES$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."HUMAN_SEXES$HIS"  IS 'History for Human Sexes';
  CREATE INDEX "DL_COMMON"."HUMAN_SEXES$HIS$IX00" ON "DL_COMMON"."HUMAN_SEXES$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."HUMAN_SEXES$HIS" TO "TESTADM";
