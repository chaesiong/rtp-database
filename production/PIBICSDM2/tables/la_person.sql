CREATE TABLE "PIBICSDM2"."LA_PERSON" 
   (	"PERSON_SEQNO" NUMBER, 
	"SUFFIX_SEQNO" NUMBER, 
	"EFIRSTNM" VARCHAR2(50 CHAR), 
	"EFAMILYNM" VARCHAR2(50 CHAR), 
	"EMIDDLENM" VARCHAR2(50 CHAR), 
	"BIRTHDATE" VARCHAR2(10 CHAR), 
	"NATION_SEQNO" NUMBER, 
	"SEX" CHAR(1 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORT_ISSUEAT" VARCHAR2(500 CHAR), 
	"PASSPORT_ISSUEDATE" DATE, 
	"PASSPORT_EXPDATE" DATE, 
	"VISA_SEQNO" NUMBER, 
	"VISANO" VARCHAR2(50 CHAR), 
	"VISA_DATE" DATE, 
	"VISA_EXPDATE" DATE, 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPD_MENU" CHAR(10 CHAR), 
	"CDEPT_SEQNO" NUMBER, 
	"UDEPT_SEQNO" NUMBER, 
	"CREATE_DATE" TIMESTAMP (6), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"VERSION" NUMBER DEFAULT 1, 
	"IPCREATE" VARCHAR2(20 CHAR), 
	"IPUPDATE" VARCHAR2(20 CHAR), 
	"TL38" VARCHAR2(20 CHAR), 
	"IMGPERSON" BLOB, 
	"IMGPASS" BLOB, 
	"CZONE_SEQNO" NUMBER, 
	"UZONE_SEQNO" NUMBER, 
	"TM6NO" VARCHAR2(20 CHAR), 
	"FN_ADDRESS90_SEQNO" NUMBER, 
	"PERSONID" VARCHAR2(30 CHAR), 
	"ARRIVED_DATE" DATE, 
	"ARRIVED_BY" CHAR(1 CHAR), 
	"ARRIVED_DEPT" NUMBER, 
	"OCC_SEQNO" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."LA_PERSON" ADD CONSTRAINT "LA_APPLY_PERSON_R06" FOREIGN KEY ("CZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_PERSON" ADD CONSTRAINT "LA_APPLY_PERSON_R07" FOREIGN KEY ("UZONE_SEQNO")
	  REFERENCES "PIBICSDM2"."ZONE" ("ZONE_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_PERSON" ADD CONSTRAINT "LA_APPLY_PERSON_R02" FOREIGN KEY ("NATION_SEQNO")
	  REFERENCES "PIBICSDM2"."COUNTRY" ("COUNT_SEQNO") ENABLE;
  ALTER TABLE "PIBICSDM2"."LA_PERSON" ADD CONSTRAINT "LA_APPLY_PERSON_R03" FOREIGN KEY ("VISA_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") ENABLE;
  CREATE INDEX "PIBICSDM2"."LA_BIRTHDATE_IDX" ON "PIBICSDM2"."LA_PERSON" ("BIRTHDATE") 
  ;
CREATE INDEX "PIBICSDM2"."LA_EFAMILYNM_IDX" ON "PIBICSDM2"."LA_PERSON" ("EFAMILYNM") 
  ;
CREATE INDEX "PIBICSDM2"."LA_EFIRSTNM_IDX" ON "PIBICSDM2"."LA_PERSON" ("EFIRSTNM") 
  ;
CREATE INDEX "PIBICSDM2"."LA_EMIDDLENM_IDX" ON "PIBICSDM2"."LA_PERSON" ("EMIDDLENM") 
  ;
CREATE INDEX "PIBICSDM2"."LA_NATION_SEQNO_IDX" ON "PIBICSDM2"."LA_PERSON" ("NATION_SEQNO") 
  ;
CREATE INDEX "PIBICSDM2"."LA_SEX_IDX" ON "PIBICSDM2"."LA_PERSON" ("SEX") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."LA_APPLY_PERSON_PK" ON "PIBICSDM2"."LA_PERSON" ("PERSON_SEQNO") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301666C00029$$" ON "PIBICSDM2"."LA_PERSON" (
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."SYS_IL0000301666C00030$$" ON "PIBICSDM2"."LA_PERSON" (
  ;
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."LA_PERSON" TO "BIOSAADM";
