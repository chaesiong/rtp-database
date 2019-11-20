CREATE TABLE "PIBICSDM2"."LA_APPLY_LOG" 
   (	"APPLY_LOG_SEQNO" NUMBER, 
	"LOG_FLAG" CHAR(1 CHAR), 
	"LOG_USRUPD" VARCHAR2(20 CHAR), 
	"LOG_DATE" TIMESTAMP (6), 
	"APPLY_SEQNO" NUMBER, 
	"PERSON_SEQNO" NUMBER, 
	"APPLY_DATE" DATE, 
	"SUFFIX_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(50 CHAR), 
	"EFAMILYNM" VARCHAR2(50 CHAR), 
	"EMIDDLENM" VARCHAR2(50 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"BIRTHPLACE" VARCHAR2(500 CHAR), 
	"OCC_SEQNO" NUMBER, 
	"OCC_DETAIL" VARCHAR2(250 CHAR), 
	"MARITAL_STS" CHAR(1 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_ISSUEAT" VARCHAR2(500 CHAR), 
	"PASSPORT_ISSUEDATE" DATE, 
	"PASSPORT_EXPDATE" DATE, 
	"SEX" CHAR(1 CHAR), 
	"FOLLOWERS_DETAIL" VARCHAR2(500 CHAR), 
	"ARRIVED_BY" CHAR(1 CHAR), 
	"ARRIVED_DATE" DATE, 
	"VISA_SEQNO" NUMBER, 
	"VISANO" VARCHAR2(50 CHAR), 
	"VISA_DATE" DATE, 
	"VISA_EXPDATE" DATE, 
	"PRESENT_BUILDING" VARCHAR2(200 CHAR), 
	"PRESENT_ADDR" VARCHAR2(200 CHAR), 
	"PRESENT_ROAD" VARCHAR2(200 CHAR), 
	"PRESENT_PV_SEQNO" NUMBER, 
	"PRESENT_AMP_SEQNO" NUMBER, 
	"PRESENT_TMB_SEQNO" NUMBER, 
	"PRESENT_POSTCODE" VARCHAR2(5 CHAR), 
	"PRESENT_TEL" VARCHAR2(200 CHAR), 
	"PERMANENT_BUILDING" VARCHAR2(200 CHAR), 
	"PERMANENT_ADDR" VARCHAR2(200 CHAR), 
	"PERMANENT_ROAD" VARCHAR2(200 CHAR), 
	"PERMANENT_PV_SEQNO" NUMBER, 
	"PERMANENT_AMP_SEQNO" NUMBER, 
	"PERMANENT_TMB_SEQNO" NUMBER, 
	"PERMANENT_POSTCODE" VARCHAR2(5 CHAR), 
	"PERMANENT_TEL" VARCHAR2(200 CHAR), 
	"EMP_FIRSTNM" VARCHAR2(200 CHAR), 
	"EMP_FAMILYNM" VARCHAR2(200 CHAR), 
	"EMP_BUILDING" VARCHAR2(200 CHAR), 
	"EMP_ADDR" VARCHAR2(200 CHAR), 
	"EMP_ROAD" VARCHAR2(200 CHAR), 
	"EMP_PV_SEQNO" NUMBER, 
	"EMP_AMP_SEQNO" NUMBER, 
	"EMP_TMB_SEQNO" NUMBER, 
	"EMP_POSTCODE" VARCHAR2(5 CHAR), 
	"EMP_TEL" VARCHAR2(200 CHAR), 
	"TYPE_WORK" CHAR(1 CHAR), 
	"TYPE_WORK_DETAIL" VARCHAR2(250 CHAR), 
	"DURATION_STAY_MM" NUMBER, 
	"FEES_SEQNO" NUMBER, 
	"FEES_STS" CHAR(1 CHAR), 
	"CDEPT_SEQNO" NUMBER, 
	"UDEPT_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"IPCREATE" VARCHAR2(20 CHAR), 
	"IPUPDATE" VARCHAR2(20 CHAR), 
	"IMGPERSON" BLOB, 
	"TL38" VARCHAR2(20 CHAR), 
	"DURATION_STAY_DD" NUMBER, 
	"DURATION_STAY_YY" NUMBER, 
	"IMGPASS" BLOB, 
	"MARITAL_DETAIL" VARCHAR2(500 CHAR), 
	"AUTO_VISANO" CHAR(1 CHAR), 
	"AUTO_SLIP" CHAR(1 CHAR), 
	"CZONE_SEQNO" NUMBER, 
	"UZONE_SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"FN_ADDRESS90_SEQNO" NUMBER, 
	"PERSONID" VARCHAR2(30 CHAR), 
	"FNADDR90DATE_START" DATE, 
	"FNADDR90DATE_NEXT" DATE, 
	"ARRIVED_DEPT" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."LA_APPLY_LOG_PK" ON "PIBICSDM2"."LA_APPLY_LOG" ("APPLY_LOG_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301635C00071$$" ON "PIBICSDM2"."LA_APPLY_LOG" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301635C00075$$" ON "PIBICSDM2"."LA_APPLY_LOG" (
  ;
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LA_APPLY_LOG" TO "BIOSAADM";
