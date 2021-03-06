CREATE TABLE "PIBICSDM2"."LA_APPLY" 
   (	"APPLY_SEQNO" NUMBER, 
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
	"ARRIVED_DEPT" NUMBER, 
	"APID" VARCHAR2(14 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_PK" PRIMARY KEY ("APPLY_SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R03" FOREIGN KEY ("OCC_SEQNO")
	  REFERENCES "PIBICSDM2"."OCCUPATION" ("OCC_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R04" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R05" FOREIGN KEY ("VISA_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R06" FOREIGN KEY ("PRESENT_PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R07" FOREIGN KEY ("PRESENT_AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R08" FOREIGN KEY ("PRESENT_TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R11" FOREIGN KEY ("PERMANENT_PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R12" FOREIGN KEY ("PERMANENT_AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R13" FOREIGN KEY ("PERMANENT_TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R14" FOREIGN KEY ("FEES_SEQNO")
	  REFERENCES "PIBICSDM2"."FS_FEES" ("FEES_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R15" FOREIGN KEY ("EMP_AMP_SEQNO")
	  REFERENCES "PIBICSDM2"."AMPUR" ("AMP_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R16" FOREIGN KEY ("EMP_TMB_SEQNO")
	  REFERENCES "PIBICSDM2"."TAMBON" ("TMB_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R17" FOREIGN KEY ("CZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD CONSTRAINT "LA_APPLY_VISA_R18" FOREIGN KEY ("UZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_APPLY" ADD FOREIGN KEY ("EMP_PV_SEQNO")
	  REFERENCES "PIBICSDM2"."PROVINCE" ("PV_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."LAA_APPLY_DATE_IDX" ON "PIBICSDM2"."LA_APPLY" ("APPLY_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."LAA_PASSPORTNO_IDX" ON "PIBICSDM2"."LA_APPLY" ("PASSPORTNO") 
  ;
CREATE INDEX "PIBICSDM2"."LAA_TM6NO_IDX" ON "PIBICSDM2"."LA_APPLY" ("TM6NO") 
  ;
CREATE INDEX "PIBICSDM2"."LAA_VISA_EXPDATE_IDX" ON "PIBICSDM2"."LA_APPLY" ("VISA_EXPDATE") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."LA_APPLY_VISA_PK" ON "PIBICSDM2"."LA_APPLY" ("APPLY_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301630C00067$$" ON "PIBICSDM2"."LA_APPLY" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301630C00071$$" ON "PIBICSDM2"."LA_APPLY" (
  ;
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LA_APPLY" TO "BIOSAADM";
