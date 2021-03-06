CREATE TABLE "DL_BLACKLIST"."BLACKLIST_CASES" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT rawtohex(sys_guid() ), 
	"AUTHORITY" VARCHAR2(100 CHAR), 
	"BEHAVIOR" VARCHAR2(100 CHAR), 
	"CASE_NUMBER" VARCHAR2(100 CHAR), 
	"SECRET_LEVEL" VARCHAR2(32 CHAR), 
	"REASON" VARCHAR2(32 CHAR), 
	"IS_ACTIVE" VARCHAR2(1 CHAR) DEFAULT 'Y' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"INS_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6), 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"URGENT_CONTACT" VARCHAR2(120 CHAR), 
	"CONTACT_INFORMATION" VARCHAR2(100 CHAR), 
	"TARGET_CODE" VARCHAR2(100 CHAR), 
	"ACTION_CODE" VARCHAR2(32 CHAR), 
	"NOTICE" VARCHAR2(2000 CHAR), 
	"REFERENCE_DOCUMENT" VARCHAR2(100 CHAR), 
	"WARRANT_ARRESTED_TYPE" VARCHAR2(32 CHAR), 
	"CRIMINAL_CASE_NUMBER" VARCHAR2(100 CHAR), 
	"ARRESTED_DESCRIPTION" VARCHAR2(100 CHAR), 
	"ARRESTED_STATUS" VARCHAR2(32 CHAR), 
	"DECIDED_CASE_NUMBER" VARCHAR2(100 CHAR), 
	"ARRESTED_WARRANT_EXPIRY_DATE" DATE, 
	"RELATED_DOCUMENT" VARCHAR2(100 CHAR), 
	"ARRESTED_WARRANT_NUMBER" VARCHAR2(100 CHAR), 
	"ARRESTED_WARRANT_DATE" DATE, 
	"TRAVEL_PERMIT" VARCHAR2(1 CHAR), 
	"TRAVEL_PERMIT_FROM" DATE, 
	"TRAVEL_PERMIT_TO" DATE, 
	"TRAVEL_PERMIT_DATE_INSERT" DATE, 
	"TRAVEL_PERMIT_DATE_DELETE" DATE, 
	"TRAVEL_PERMIT_NOTE" VARCHAR2(2000 CHAR), 
	"OWNER_DATA" VARCHAR2(100 CHAR), 
	"OTHER_DESCRIPTION" VARCHAR2(2000 CHAR), 
	"CONTACT_TELEPHONE_NUMBER" VARCHAR2(40 CHAR), 
	"CONTACT_OWNER_DATA" VARCHAR2(170 CHAR), 
	"ASSOCIATED_BEHAVIOR" VARCHAR2(100 CHAR), 
	"OTHER" VARCHAR2(100 CHAR), 
	"CASE_TYPE" VARCHAR2(32 CHAR) DEFAULT ON NULL 'CRIMINAL' NOT NULL ENABLE, 
	"OSTAY_CREATION_DATE" DATE, 
	"OSTAY_SELF_INDICTMENT" VARCHAR2(1 CHAR), 
	"OSTAY_STATUS" VARCHAR2(100 CHAR), 
	"OSTAY_NO_DAYS" NUMBER, 
	"OSTAY_ARRIVAL_DATE" DATE, 
	"OSTAY_DEPARTURE_DATE" DATE, 
	"OSTAY_TM6" VARCHAR2(100 CHAR), 
	"OSTAY_BLOCK_PERIOD" NUMBER, 
	"OSTAY_NOTICE" VARCHAR2(2000 CHAR), 
	"LOST_PP_LOST_DATE" DATE, 
	"LOST_PP_LAST_PLACE" VARCHAR2(100 CHAR), 
	"LOST_PP_NOTIFY_DATE" DATE, 
	"LOST_PP_NOTIFY_PLACE" VARCHAR2(100 CHAR), 
	"LOST_PP_VISA_ON_ARRIV" VARCHAR2(100 CHAR), 
	"LOST_PP_VISA_EXP_DATE" DATE, 
	"LOST_PP_NOTICE" VARCHAR2(2000 CHAR), 
	"LOST_PP_NEW_PP_TYPE" VARCHAR2(32 CHAR), 
	"LOST_PP_NEW_PP_NUMBER" VARCHAR2(100 CHAR), 
	"LOST_PP_NEW_PP_ISSUE_DATE" DATE, 
	"LOST_PP_NEW_PP_PLACE_OF_ISSUE" VARCHAR2(100 CHAR), 
	"LOST_PP_NEW_PP_EXPIRE_DATE" DATE, 
	"ARRESTED_WARRANT_YEAR" NUMBER(*,0), 
	"UNDECIDED_CASE_NUMBER" VARCHAR2(100 CHAR), 
	"CLOSING_REASON" VARCHAR2(2000 CHAR)
   ) ;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_CHK1" CHECK (travel_permit IN (
'N',
'Y'
)) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_CHK2" CHECK (is_active IN (
'N',
'Y'
)) ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASE_PK" PRIMARY KEY ("ID")
  USING INDEX (CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_PK" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ID") 
  )  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASE_UK_AUTHORITY_CASE_NUMBER" UNIQUE ("AUTHORITY", "CASE_NUMBER")
  USING INDEX (CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_UK1" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("AUTHORITY", "CASE_NUMBER") 
  )  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_ACTION_CODE" FOREIGN KEY ("ACTION_CODE")
	  REFERENCES "DL_COMMON"."ACTION_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_ARRESTED_STATUS" FOREIGN KEY ("ARRESTED_STATUS")
	  REFERENCES "DL_COMMON"."ARRESTED_STATUSES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_ARRESTED_TYPE" FOREIGN KEY ("WARRANT_ARRESTED_TYPE")
	  REFERENCES "DL_COMMON"."ARRESTED_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_CASE_TYPE" FOREIGN KEY ("CASE_TYPE")
	  REFERENCES "DL_COMMON"."CASE_TYPES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_REASON" FOREIGN KEY ("REASON")
	  REFERENCES "DL_COMMON"."REASON_CODES" ("KEY_VALUE") ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES" ADD CONSTRAINT "BLACKLIST_CASES_SECRET_LEVEL" FOREIGN KEY ("SECRET_LEVEL")
	  REFERENCES "DL_COMMON"."SECRET_LEVELS" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES"."CLOSING_REASON" IS 'Reason for closing a case';
  CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX1" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("SECRET_LEVEL") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX2" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("WARRANT_ARRESTED_TYPE") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX3" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ARRESTED_STATUS") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX4" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("REASON") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX5" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ACTION_CODE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_PK" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_UK1" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("AUTHORITY", "CASE_NUMBER") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASE_UK_AUTHORITY_CASE_NUMBER" ON "DL_BLACKLIST"."BLACKLIST_CASES" ("AUTHORITY", "CASE_NUMBER", "CASE_TYPE") 
  ;
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "APPSUP";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "SERVAPP";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSAPP";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_INTERFACE";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIO_BD";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSDM2";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSUPPORT";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PIBICSDM2";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "DL_MAINTENANCE";
  GRANT ALTER ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PORNRUKSA_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "SANTIPATN_P";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES" TO "PUNYAWII_D";
