CREATE TABLE "DL_BLACKLIST"."RELATED_PERSONS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"SOURCE_SYSTEM" NUMBER(1,0) DEFAULT ON NULL 1 NOT NULL ENABLE, 
	"BLACKLIST_CASE_ID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"FIRST_NAME" VARCHAR2(100 CHAR), 
	"LAST_NAME" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"RELATIONSHIP" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "DL_BLACKLIST"."RELATED_PERSONS" ADD CONSTRAINT "RELATED_PERSONS$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."RELATED_PERSONS" ADD CONSTRAINT "RELATED_PERSONS$CK03" CHECK (DML_TYPE in ('I','U')) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."RELATED_PERSONS" ADD CONSTRAINT "RELATED_PERSONS$FK$BLACKLIST_CASE" FOREIGN KEY ("BLACKLIST_CASE_ID")
	  REFERENCES "DL_BLACKLIST"."BLACKLIST_CASES_O" ("ID") DISABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."KEY_VALUE" IS 'Primary key of the table';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."INS_AT" IS 'Date the dataset was inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."INS_BY" IS 'User that inserted this dataset';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."DML_AT" IS 'Date the dataset was modified last';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."DML_BY" IS 'User that modified the dataset last';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."DML_TYPE" IS 'DML type of the last action';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."NOTICE" IS 'Notice or remark ob this dataset';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."SOURCE_SYSTEM" IS 'Defines the source system of this table (1 = Dermalog, e.g. 2 = PIBICS)';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."BLACKLIST_CASE_ID" IS 'Foreign key to blacklist table';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."FIRST_NAME" IS 'First name of the related person';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."LAST_NAME" IS 'Last name of the related person';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."MIDDLE_NAME" IS 'Middle name of the related person';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS"."RELATIONSHIP" IS 'Relationship (text) between the related person and the blacklist person';
   COMMENT ON TABLE "DL_BLACKLIST"."RELATED_PERSONS"  IS 'Defines the related persons of a blacklist case';
  CREATE UNIQUE INDEX "DL_BLACKLIST"."RELATED_PERSONS$PK" ON "DL_BLACKLIST"."RELATED_PERSONS" ("KEY_VALUE") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."RELATED_PERSONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."RELATED_PERSONS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."RELATED_PERSONS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PONGPICHET_N";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS" TO "PORNRUKSA_S";
