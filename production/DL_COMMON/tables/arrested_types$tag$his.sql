CREATE TABLE "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"TAG" VARCHAR2(128 CHAR) NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0)
   ) ;
  ALTER TABLE "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" ADD CONSTRAINT "ARRESTED_TYPES$TAG$HIS$CK00" CHECK (DML_TYPE in ('I'
                                                                                                               ,'U'
                                                                                                               ,'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."OWNER" IS 'Owner of the data';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."TAG" IS 'Tag of the Action Code';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."ARRESTED_TYPES$TAG$HIS"  IS 'History of Tags for the basis table rows';
  CREATE INDEX "DL_COMMON"."ARRESTED_TYPES$TAG$HIS$IX00" ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" ("KEY_VALUE", "OWNER", "TAG", "DML_AT") 
  ;
  GRANT SELECT ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."ARRESTED_TYPES$TAG$HIS" TO "APPSUP";
