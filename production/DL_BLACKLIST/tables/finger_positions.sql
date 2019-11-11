CREATE TABLE "DL_BLACKLIST"."FINGER_POSITIONS" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL rawtohex(sys_guid() ) NOT NULL ENABLE, 
	"ORDINAL" NUMBER, 
	"KEY" VARCHAR2(30 CHAR), 
	"VALUE_SHORT" VARCHAR2(30 CHAR), 
	"VALUE_LONG" VARCHAR2(200 CHAR), 
	"DESCRIPTION" VARCHAR2(1000 CHAR), 
	"VALID_FROM" DATE DEFAULT ON NULL TO_DATE('19000101','YYYYMMDD') NOT NULL ENABLE, 
	"VALID_TO" DATE DEFAULT ON NULL TO_DATE('99991231','YYYYMMDD') NOT NULL ENABLE, 
	"DISPLAY_ORDER" NUMBER, 
	"DISPLAY_ACTIVE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'Y' NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) DEFAULT ON NULL 'en_US' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE
   )   NO INMEMORY ;
  ALTER TABLE "DL_BLACKLIST"."FINGER_POSITIONS" ADD CONSTRAINT "FINGER_POSITIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."FINGER_POSITIONS" ADD CONSTRAINT "FINGER_POSITIONS_KEY_UN" UNIQUE ("KEY")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."ORDINAL" IS 'NIST Standard for the finger / palm position';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."KEY" IS 'Key of the lookup. Within a category this key is unique if only the active lookups are considered.';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."VALUE_SHORT" IS 'Short version of the lookup value (e.g. country code)';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."VALUE_LONG" IS 'Long version of the lookup value (e.g. country name)';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."DESCRIPTION" IS 'Description on the lookup value';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."VALID_FROM" IS 'Start date of the validity of the lookup';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."VALID_TO" IS 'End date of the validity of the lookup';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."DISPLAY_ORDER" IS 'Number for the Display Order usually ascending';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."DISPLAY_ACTIVE" IS 'Y if the lookup is currently active,N else.';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."LOCALE" IS 'Language and Country code, example ''en_US''';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."FINGER_POSITIONS"."DML_TYPE" IS 'What type of DML was the last change of the record';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."FINGER_POSITIONS_KEY_UN" ON "DL_BLACKLIST"."FINGER_POSITIONS" ("KEY") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."FINGER_POSITIONS_PK" ON "DL_BLACKLIST"."FINGER_POSITIONS" ("ID") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."FINGER_POSITIONS" TO "BIOSAADM";
