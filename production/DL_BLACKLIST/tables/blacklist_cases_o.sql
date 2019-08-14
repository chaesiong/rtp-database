CREATE TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" 
   (	"ID" VARCHAR2(32 CHAR) DEFAULT ON NULL rawtohex(sys_guid() ) NOT NULL ENABLE, 
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
	"ARRESTED_WARRANT_NUMBER" VARCHAR2(2000 CHAR), 
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
	"UNDECIDED_CASE_NUMBER" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_CHK1_O" CHECK (travel_permit IN (
            'N',
            'Y'
        )) DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_CHK2_O" CHECK (is_active IN (
            'N',
            'Y'
        )) DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASE_PK_O" PRIMARY KEY ("ID")
  USING INDEX (CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_PK_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("ID") 
  )  ENABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASE_UK_AUTHORITY_CASE_NUMBER_O" UNIQUE ("AUTHORITY", "CASE_NUMBER") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_ACTION_CODE_O" FOREIGN KEY ("ACTION_CODE")
	  REFERENCES "DL_COMMON"."ACTION_CODES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_ARRESTED_STATUS_O" FOREIGN KEY ("ARRESTED_STATUS")
	  REFERENCES "DL_COMMON"."ARRESTED_STATUSES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_ARRESTED_TYPE_O" FOREIGN KEY ("WARRANT_ARRESTED_TYPE")
	  REFERENCES "DL_COMMON"."ARRESTED_TYPES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_REASON_O" FOREIGN KEY ("REASON")
	  REFERENCES "DL_COMMON"."REASON_CODES" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_SECRET_LEVEL_O" FOREIGN KEY ("SECRET_LEVEL")
	  REFERENCES "DL_COMMON"."SECRET_LEVELS" ("KEY_VALUE") DISABLE;
  ALTER TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O" ADD CONSTRAINT "BLACKLIST_CASES_CASE_TYPE_O" FOREIGN KEY ("CASE_TYPE")
	  REFERENCES "DL_COMMON"."CASE_TYPES" ("KEY_VALUE") DISABLE;
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ID" IS 'Artificial primary key';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."AUTHORITY" IS 'Name of the filing government agency';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."BEHAVIOR" IS 'Description of the behavior in match case';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."CASE_NUMBER" IS 'Case number of the filing government agency';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."SECRET_LEVEL" IS 'FK  DL_COMMON.SECRET_LEVELS';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."REASON" IS 'FK  DL_COMMON.REASON_CODES';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."IS_ACTIVE" IS 'Switch for soft delete';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."INS_BY" IS 'Created by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."INS_AT" IS 'Created at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."DML_BY" IS 'Modified by User name';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."DML_AT" IS 'Modified at timestamp';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."DML_TYPE" IS 'What type of DML was the last change of the record';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."URGENT_CONTACT" IS 'Telefon number ';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."CONTACT_INFORMATION" IS 'Contact address';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TARGET_CODE" IS 'Target code of the filing government agency';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ACTION_CODE" IS 'FK DL_COMMON.ACTION_CODES';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."NOTICE" IS 'Case notice';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."REFERENCE_DOCUMENT" IS 'Reference document case number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."WARRANT_ARRESTED_TYPE" IS 'FK DL_COMMON.ARRESTED_TYPES';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."CRIMINAL_CASE_NUMBER" IS 'Reference criminal case number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ARRESTED_DESCRIPTION" IS 'Arrested description';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ARRESTED_STATUS" IS 'FK DL_COMMON.ARRESTED_STATUSES';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."DECIDED_CASE_NUMBER" IS 'Decided case number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ARRESTED_WARRANT_EXPIRY_DATE" IS 'Date of warrant expiry';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."RELATED_DOCUMENT" IS 'Related document case number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ARRESTED_WARRANT_NUMBER" IS 'Warrant number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ARRESTED_WARRANT_DATE" IS 'Warrant date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TRAVEL_PERMIT" IS 'Y/N';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TRAVEL_PERMIT_FROM" IS 'Warrant number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TRAVEL_PERMIT_TO" IS 'Travel permit from';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TRAVEL_PERMIT_DATE_INSERT" IS 'Travel permit date inserted';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TRAVEL_PERMIT_DATE_DELETE" IS 'Travel permit date deleted';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."TRAVEL_PERMIT_NOTE" IS 'Travel permit notice';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OWNER_DATA" IS 'Filing government agency';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OTHER_DESCRIPTION" IS 'Description';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."CONTACT_TELEPHONE_NUMBER" IS 'Contact telephone number';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."CONTACT_OWNER_DATA" IS 'Filing government agency address';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ASSOCIATED_BEHAVIOR" IS 'Filing government agency behaviour';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OTHER" IS 'Other';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."CASE_TYPE" IS 'Case type (Criminal, Overstay, Lost Passport, Prohibit Marking)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_CREATION_DATE" IS 'Overstay Created Date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_SELF_INDICTMENT" IS 'Overstay self-indictment / caught';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_STATUS" IS 'Overstay Status - to be clarified';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_NO_DAYS" IS 'Overstay (Number) Days';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_ARRIVAL_DATE" IS 'Overstay Arrival date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_DEPARTURE_DATE" IS 'Overstay Departure date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_TM6" IS 'Overstay T.M 6.';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_BLOCK_PERIOD" IS 'Overstay Blocking period';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."OSTAY_NOTICE" IS 'Overstay Remark';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_LOST_DATE" IS 'Lost Passport lost date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_LAST_PLACE" IS 'Lost Passport Last place';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NOTIFY_DATE" IS 'Lost Passport Notify lost date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NOTIFY_PLACE" IS 'Lost Passport Notify place (Issuing Place)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_VISA_ON_ARRIV" IS 'Lost Passport Visa on Arrival';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_VISA_EXP_DATE" IS 'Lost Passport Visa expire date';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NOTICE" IS 'Lost Passport Remark';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NEW_PP_TYPE" IS 'Lost Passport Data: New Passport Type (THA20675-692)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NEW_PP_NUMBER" IS 'Lost Passport Data: New Passport number (THA20675-692)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NEW_PP_ISSUE_DATE" IS 'Lost Passport Data: New Issue Date (THA20675-692)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NEW_PP_PLACE_OF_ISSUE" IS 'Lost Passport Data: New Place of issue (THA20675-692)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."LOST_PP_NEW_PP_EXPIRE_DATE" IS 'Lost Passport Data: New Passport expire date (THA20675-692)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."ARRESTED_WARRANT_YEAR" IS 'Year of warrant (THA20675-1333)';
   COMMENT ON COLUMN "DL_BLACKLIST"."BLACKLIST_CASES_O"."UNDECIDED_CASE_NUMBER" IS 'Number of undecided case (THA20675-1333)';
   COMMENT ON TABLE "DL_BLACKLIST"."BLACKLIST_CASES_O"  IS 'Case Data';
  CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX1_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("SECRET_LEVEL") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX2_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("WARRANT_ARRESTED_TYPE") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX3_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("ARRESTED_STATUS") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX4_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("REASON") 
  ;
CREATE INDEX "DL_BLACKLIST"."DL_BLACKLIST_IDX5_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("ACTION_CODE") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_PK_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("ID") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASES_UK1_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("AUTHORITY", "CASE_NUMBER") 
  ;
CREATE UNIQUE INDEX "DL_BLACKLIST"."BLACKLIST_CASE_UK_AUTHORITY_CASE_NUMBER_O" ON "DL_BLACKLIST"."BLACKLIST_CASES_O" ("AUTHORITY", "CASE_NUMBER", "CASE_TYPE") 
  ;
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_STAGING4PIBICS_INTF";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_INTERFACE";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_INTERFACE";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_INTERFACE";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_INTERFACE";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_BORDERCONTROL";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_BORDERCONTROL";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DL_BORDERCONTROL";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "SERVAPP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "BIO_BD";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "APPSUP";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_O" TO "PIBICSAPP";
  CREATE OR REPLACE EDITIONABLE TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$BIUR_O" BEFORE INSERT OR UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_O"
    FOR EACH ROW
BEGIN
    IF inserting THEN
        :new.ins_by   := coalesce(:new.ins_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.ins_at   := coalesce(:new.ins_at
                                 ,systimestamp);
        :new.dml_by   := coalesce(:new.dml_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.dml_at   := coalesce(:new.dml_at
                                 ,systimestamp);
        :new.dml_type := 'I';
        -- call dl_blacklist.pkg_utils.create_a_case_id if case_id is null
        -- otherwise take the given value because we assume that it is a pibics load
        IF :new.case_number IS NULL THEN
            :new.case_number := pkg_utils.create_a_case_number();
        END IF;
    ELSIF updating THEN
        :new.ins_by   := :old.ins_by;
        :new.ins_at   := :old.ins_at;
        :new.dml_by   := coalesce(:new.dml_by
                                 ,dl_common.pkg_session.get_audit_user());
        :new.dml_at   := coalesce(:new.dml_at
                                 ,systimestamp);
        :new.dml_type := 'U';
    END IF;
END;
/
ALTER TRIGGER "DL_BLACKLIST"."BLACKLIST_CASES$BIUR_O" DISABLE;
