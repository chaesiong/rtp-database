CREATE TABLE "DL_BORDERCONTROL"."RESIDENCE" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) DEFAULT ON NULL SYS_GUID() NOT NULL ENABLE, 
	"DOCUMENT_NO" VARCHAR2(15 CHAR), 
	"NATIONALITY" VARCHAR2(32 CHAR), 
	"EXPIRE_DATE" DATE, 
	"RESIDENT_TYPE" VARCHAR2(100 CHAR), 
	"RESIDENT_NO" VARCHAR2(15 CHAR), 
	"FIRST_NAME_THAI" VARCHAR2(100 CHAR), 
	"MIDDLE_NAME_THAI" VARCHAR2(100 CHAR), 
	"LAST_NAME_THAI" VARCHAR2(100 CHAR), 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL SYSTIMESTAMP NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL SYSDATE NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL USER NOT NULL ENABLE, 
	"RESIDENT_ADDR_L1" VARCHAR2(255 CHAR), 
	"RESIDENT_ADDR_L2" VARCHAR2(255 CHAR), 
	"RESIDENT_ADDR_L3" VARCHAR2(255 CHAR), 
	"ENDORSEMENT_NO" VARCHAR2(20 CHAR), 
	"ENDORSEMENT_FROM" DATE, 
	"ENDORSEMENT_UNTIL" DATE, 
	"ENDORSEMENT_BY" VARCHAR2(255 CHAR), 
	"RESIDENTBOOK_NO" VARCHAR2(255 CHAR), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"CREATED_BY" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "DL_BORDERCONTROL"."RESIDENCE" ADD CONSTRAINT "RESIDENCE$PK" PRIMARY KEY ("KEY_VALUE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."RESIDENCE" ADD CONSTRAINT "RESIDENCE$CHK$C01" CHECK (dml_type IN ('I', 'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."RESIDENCE" ADD CONSTRAINT "RESIDENCE$FK01" FOREIGN KEY ("NATIONALITY")
	  REFERENCES "DL_COMMON"."COUNTRIES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."KEY_VALUE" IS 'Primary Key';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DOCUMENT_NO" IS 'Document Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."NATIONALITY" IS 'FK DL_COMMON.ICAO_DOC_CODES';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."EXPIRE_DATE" IS 'Expire Date';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_TYPE" IS 'Type of resident';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_NO" IS 'Resident Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."FIRST_NAME_THAI" IS 'Firstname Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."MIDDLE_NAME_THAI" IS 'Middle Name Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."LAST_NAME_THAI" IS 'Lastname Thai';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_ADDR_L1" IS 'Column for Resident Address Line 1';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_ADDR_L2" IS 'Column for Resident Address Line 2';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENT_ADDR_L3" IS 'Column for Resident Address Line 3';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_NO" IS 'Column for Endorsement Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_FROM" IS 'Date from which Endorsement is valid';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_UNTIL" IS 'Date until which Endorsement is valid';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."ENDORSEMENT_BY" IS 'Name of who creates the endorsement';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."RESIDENTBOOK_NO" IS 'Column for Resident Book Number';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."CREATED_AT" IS 'Original Timestamp of record creation';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."RESIDENCE"."CREATED_BY" IS 'Original user who created the record';
   COMMENT ON TABLE "DL_BORDERCONTROL"."RESIDENCE"  IS 'Used in BmBS';
  CREATE UNIQUE INDEX "DL_BORDERCONTROL"."IDX_RESIDENCE_DOCNATEXP" ON "DL_BORDERCONTROL"."RESIDENCE" ("DOCUMENT_NO", "NATIONALITY", "EXPIRE_DATE") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."RESIDENCE$PK" ON "DL_BORDERCONTROL"."RESIDENCE" ("KEY_VALUE") 
  ;
  GRANT DELETE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."RESIDENCE" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "WORAGON_T";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PISAN_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "CHAYA_W";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "THANASET_N";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "THASAYA_M";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BORDERCONTROL"."RESIDENCE" TO "PUNYAWII_D";
