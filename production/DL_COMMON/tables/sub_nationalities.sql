CREATE TABLE "DL_COMMON"."SUB_NATIONALITIES" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"PARENT_NATIONALITY" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."SUB_NATIONALITIES" ADD CONSTRAINT "SUB_NATIONALITIES$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."SUB_NATIONALITIES" ADD CONSTRAINT "SUB_NATIONALITIES$UQ00" UNIQUE ("NUM_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."SUB_NATIONALITIES" ADD CONSTRAINT "SUB_NATIONALITIES$CHK$C00" CHECK (KEY_VALUE = upper(KEY_VALUE)) ENABLE;
  ALTER TABLE "DL_COMMON"."SUB_NATIONALITIES" ADD CONSTRAINT "SUB_NATIONALITIES$CHK$C01" CHECK (LOCALE = 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."SUB_NATIONALITIES" ADD CONSTRAINT "SUB_NATIONALITIES$CHK$C04" CHECK (IS_ACTIVE in ('Y'
                                                                                              ,'N')) ENABLE;
  ALTER TABLE "DL_COMMON"."SUB_NATIONALITIES" ADD CONSTRAINT "SUB_NATIONALITIES$CHK$C07" CHECK (DML_TYPE in ('I'
                                                                                             ,'U')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."DISPLAY_VALUE" IS 'Name of the Sub Nationality';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."SUB_NATIONALITIES"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_COMMON"."SUB_NATIONALITIES"  IS 'Sub Nationalities conected with ICAO-Codes';
  CREATE INDEX "DL_COMMON"."SUB_NATIONALITIES$IX00" ON "DL_COMMON"."SUB_NATIONALITIES" ("DISPLAY_VALUE", "DISPLAY_ORDER") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."SUB_NATIONALITIES$PK" ON "DL_COMMON"."SUB_NATIONALITIES" ("KEY_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."SUB_NATIONALITIES$UQ00" ON "DL_COMMON"."SUB_NATIONALITIES" ("NUM_VALUE") 
  ;
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."SUB_NATIONALITIES" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."SUB_NATIONALITIES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."SUB_NATIONALITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."SUB_NATIONALITIES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."SUB_NATIONALITIES" TO "BIOSAADM";
