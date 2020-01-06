CREATE TABLE "DL_BLACKLIST"."BLACKLIST_CASES_BK" 
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
	"ARRESTED_WARRANT_NUMBER" VARCHAR2(60 CHAR), 
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
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "APPSUP";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT DELETE ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT INDEX ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT INSERT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT READ ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "BIOSAADM";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "SOMPORN_K";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "WORAGON_T";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "PISAN_S";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "CHAYA_W";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "THANASET_N";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "THASAYA_M";
  GRANT SELECT ON "DL_BLACKLIST"."BLACKLIST_CASES_BK" TO "PORNRUKSA_S";
