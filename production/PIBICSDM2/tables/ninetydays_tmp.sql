CREATE TABLE "PIBICSDM2"."NINETYDAYS_TMP" 
   (	"ID" NUMBER, 
	"OLD_SYSTEM" NUMBER(*,0), 
	"TIMESTAMP" TIMESTAMP (6), 
	"LAST_UPDATE" TIMESTAMP (6), 
	"UPDATE_BY" NUMBER(*,0), 
	"APPLICATION_TYPE" VARCHAR2(30 CHAR), 
	"APPLICATION_SUBTYPE" VARCHAR2(255 CHAR), 
	"APPLICATION_NO" VARCHAR2(15 CHAR), 
	"APPLICATION_YEAR" NUMBER(*,0), 
	"APPLICATION_NO_OLD" VARCHAR2(15 CHAR), 
	"APPLICATION_YEAR_OLD" VARCHAR2(255 CHAR), 
	"APPLICATION_NO_REF" VARCHAR2(15 CHAR), 
	"APPLICATION_TYPE_REF" VARCHAR2(5 CHAR), 
	"APPICATION_NO_RELATIVE" VARCHAR2(15 CHAR), 
	"APPLICATION_EX" VARCHAR2(20 CHAR), 
	"GENDER" CHAR(1 CHAR), 
	"NAME" VARCHAR2(255 CHAR), 
	"BIRTH_DATE" VARCHAR2(255 CHAR), 
	"AGE" NUMBER(*,0), 
	"NATIONALITY" VARCHAR2(255 CHAR), 
	"PASSPORT_NO" VARCHAR2(255 CHAR), 
	"PASSPORT_EXP" TIMESTAMP (6), 
	"DAYS_FINED" VARCHAR2(255 CHAR), 
	"AMOUNT_FINED" FLOAT(126), 
	"VISA_STATUS" VARCHAR2(255 CHAR), 
	"ARRIVE_DATE" TIMESTAMP (6), 
	"ALLOW_TO_DATE" TIMESTAMP (6), 
	"NOTE1" VARCHAR2(255 CHAR), 
	"PERSON_FINED_UNKNOW" VARCHAR2(255 CHAR), 
	"DAYS_FINED_UNKNOW" VARCHAR2(255 CHAR), 
	"AMOUNT_FINED_UNKNOW" VARCHAR2(255 CHAR), 
	"CHANGED_VISA" VARCHAR2(255 CHAR), 
	"APPLICATION_DATE" TIMESTAMP (6), 
	"POSITION" VARCHAR2(255 CHAR), 
	"COMPANY" VARCHAR2(255 CHAR), 
	"FOLLOW_WHO" VARCHAR2(50 CHAR), 
	"REASON" VARCHAR2(255 CHAR), 
	"NOTE2" VARCHAR2(255 CHAR), 
	"BUSINESS_TYPE" VARCHAR2(255 CHAR), 
	"COMPANY_ASSET" FLOAT(126), 
	"PAID_ASSET" FLOAT(126), 
	"TOTAL_SHARE_HOLDER" FLOAT(126), 
	"TOTAL_INCOME" FLOAT(126), 
	"PERSONAL_ASSET" FLOAT(126), 
	"TOTAL_EMPLOYEE" NUMBER(*,0), 
	"THAI" NUMBER(*,0), 
	"PERMANENT_THAI" NUMBER(*,0), 
	"PARTTIME_THAI" NUMBER(*,0), 
	"FOREIGNER" NUMBER(*,0), 
	"MONTHLY_INCOME" FLOAT(126), 
	"MONTHLY_TAX" FLOAT(126), 
	"MFA_REF_NO" VARCHAR2(255 CHAR), 
	"MFA_REF_DATE" VARCHAR2(255 CHAR), 
	"MFA_REF_YEAR" NUMBER(*,0), 
	"WORK_PERMIT_DATE" VARCHAR2(255 CHAR), 
	"WORK_PERMIT_END" VARCHAR2(255 CHAR), 
	"NEWS_PERMIT_END" VARCHAR2(255 CHAR), 
	"ANNUAL_INCOME" FLOAT(126), 
	"ANNUAL_TAX" FLOAT(126), 
	"RELATIONSHIP" VARCHAR2(255 CHAR), 
	"TRANSFER_DATE" VARCHAR2(255 CHAR), 
	"TRANSFER_END" VARCHAR2(255 CHAR), 
	"TRANSFER_AMOUNT" VARCHAR2(255 CHAR), 
	"BUSINESS_DATE" VARCHAR2(255 CHAR), 
	"BUSINESS_END" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC0" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC1" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC2" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC3" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC4" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC5" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC6" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC7" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC8" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC9" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC10" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC11" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC12" VARCHAR2(255 CHAR), 
	"SUPPORT_DOC_OTHER_NOTE" VARCHAR2(255 CHAR), 
	"CONTINENT" VARCHAR2(255 CHAR), 
	"COUNTRY" VARCHAR2(255 CHAR), 
	"MINIMUM_INCOME" FLOAT(126), 
	"NOTE3" VARCHAR2(255 CHAR), 
	"PERMIT_VISA_END" TIMESTAMP (6), 
	"NOTE4" VARCHAR2(255 CHAR), 
	"TEMPORARY_VISA" VARCHAR2(255 CHAR), 
	"VERIFIER" NUMBER(*,0), 
	"AUTHORITY" NUMBER(*,0), 
	"AUTHORIZED_DATE" TIMESTAMP (6), 
	"RELATIVE_ORDER" NUMBER(*,0), 
	"NATION_PURPOSE" VARCHAR2(50 CHAR), 
	"MULTIPLE" NUMBER(*,0), 
	"BOI" NUMBER(*,0), 
	"BOI_ATTACHMENT_NAME" VARCHAR2(50 CHAR), 
	"TXT_BOI_ATTACHMENT_NAME" VARCHAR2(50 CHAR), 
	"COMPLETE_MISSION_DATE" TIMESTAMP (6), 
	"NEW_PASSPORT_CHANGE_DATE" VARCHAR2(10 CHAR), 
	"NEW_PASSPORT_NO" VARCHAR2(50 CHAR), 
	"NEW_PASSPORT_EXPIRE_DATE" VARCHAR2(10 CHAR), 
	"ORG" VARCHAR2(10 CHAR), 
	"VISIT_BY" VARCHAR2(10 CHAR), 
	"VISIT_CARD" VARCHAR2(255 CHAR), 
	"ADDRESS" VARCHAR2(45 CHAR), 
	"PROVINCE" VARCHAR2(45 CHAR), 
	"STREET" VARCHAR2(45 CHAR), 
	"EXTENSION_FEE" FLOAT(126), 
	"RE_ENTRY_FEE" FLOAT(126), 
	"NINETYDAYS_FINED" FLOAT(126), 
	"APPICATION_CANCELLED" NUMBER(*,0), 
	"RECIEPT_ISSUE" NUMBER(*,0), 
	"FLIGHT_NO" VARCHAR2(15 CHAR), 
	"TUMBOL" VARCHAR2(20 CHAR), 
	"TEL" VARCHAR2(20 CHAR), 
	"AMOUNT_90" VARCHAR2(10 CHAR), 
	"BLACKLIST" NUMBER(*,0), 
	"FLAGIMP" CHAR(1 CHAR), 
	"APPLICATION_TYPEM" VARCHAR2(30 CHAR), 
	"YEAR" VARCHAR2(4 CHAR), 
	"UMPER" VARCHAR2(1000 CHAR), 
	"PV_SEQNO" NUMBER
   ) ;