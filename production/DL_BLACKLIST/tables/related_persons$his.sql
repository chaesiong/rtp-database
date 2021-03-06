CREATE TABLE "DL_BLACKLIST"."RELATED_PERSONS$HIS" 
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
  ALTER TABLE "DL_BLACKLIST"."RELATED_PERSONS$HIS" ADD CONSTRAINT "RELATED_PERSONS$HIS$CK00" CHECK (DML_TYPE in ('I','U','D')) ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."KEY_VALUE" IS 'Primary key of the table';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."INS_AT" IS 'Date the dataset was inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."INS_BY" IS 'User that inserted this dataset';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."DML_AT" IS 'Date the dataset was modified last';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."DML_BY" IS 'User that modified the dataset last';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."DML_TYPE" IS 'DML type of the last action';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."NOTICE" IS 'Notice or remark ob this dataset';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."SOURCE_SYSTEM" IS 'Defines the source system of this table (1 = Dermalog, e.g. 2 = PIBICS)';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."BLACKLIST_CASE_ID" IS 'Foreign key to blacklist table';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."FIRST_NAME" IS 'First name of the related person';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."LAST_NAME" IS 'Last name of the related person';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."MIDDLE_NAME" IS 'Middle name of the related person';
   COMMENT ON COLUMN "DL_BLACKLIST"."RELATED_PERSONS$HIS"."RELATIONSHIP" IS 'Relationship (text) between the related person and the blacklist person';
   COMMENT ON TABLE "DL_BLACKLIST"."RELATED_PERSONS$HIS"  IS 'Defines the related persons of a blacklist case';
  CREATE INDEX "DL_BLACKLIST"."RELATED_PERSONS$HIS$IX00" ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" ("KEY_VALUE", "DML_AT") 
  ;
  GRANT UPDATE ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."RELATED_PERSONS$HIS" TO "PUNYAWII_D";
