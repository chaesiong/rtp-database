CREATE TABLE "DL_COMMON"."TRANS_MODES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"BORDER_TYPE" VARCHAR2(32 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE) and length(KEY_VALUE) >= 2) ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                        ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                       ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."TRANS_MODES" ADD CONSTRAINT "TRANS_MODES$FK00" FOREIGN KEY ("BORDER_TYPE")
	  REFERENCES "DL_COMMON"."BORDER_TYPES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."DISPLAY_VALUE" IS 'Name of the Transport Modes';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."BORDER_TYPE" IS 'If set, then only valid for the given border type, otherwise valid for all border types!';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."TRANS_MODES"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."TRANS_MODES"  IS 'Table for Transport Modes';
  CREATE INDEX "DL_COMMON"."TRANS_MODES$IX00" ON "DL_COMMON"."TRANS_MODES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE INDEX "DL_COMMON"."TRANS_MODES$IX01" ON "DL_COMMON"."TRANS_MODES" ("BORDER_TYPE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."TRANS_MODES$PK" ON "DL_COMMON"."TRANS_MODES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."TRANS_MODES$UQ00" ON "DL_COMMON"."TRANS_MODES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."TRANS_MODES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."TRANS_MODES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."TRANS_MODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."TRANS_MODES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."TRANS_MODES" TO "BIOSAADM";
