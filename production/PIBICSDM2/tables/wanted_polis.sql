CREATE TABLE "PIBICSDM2"."WANTED_POLIS" 
   (	"WPSEQNO" NUMBER, 
	"WPCD" VARCHAR2(40 CHAR), 
	"FIRST_NAME" VARCHAR2(100 CHAR), 
	"NICKNAME" VARCHAR2(100 CHAR), 
	"LAST_NAME" VARCHAR2(100 CHAR), 
	"ENG_FIRST_NAME" VARCHAR2(100 CHAR), 
	"ENG_MIDDLE_NAME" VARCHAR2(100 CHAR), 
	"ENG_LAST_NAME" VARCHAR2(100 CHAR), 
	"BIRTH_DATE" VARCHAR2(10 CHAR), 
	"SEX" VARCHAR2(1 CHAR), 
	"NATION_CODE" VARCHAR2(5 CHAR), 
	"POLIS_NAME" VARCHAR2(200 CHAR), 
	"MOBILENO" VARCHAR2(100 CHAR), 
	"WARRANTNO" VARCHAR2(500 CHAR), 
	"WARRANT_DATE" VARCHAR2(10 CHAR), 
	"WARRANT_DUE_DATE" VARCHAR2(10 CHAR), 
	"ADDR" VARCHAR2(1000 CHAR), 
	"CMAJOR_CODE" VARCHAR2(10 CHAR), 
	"ID_NO" VARCHAR2(20 CHAR), 
	"CRIME_NO" VARCHAR2(10 CHAR), 
	"CRIME_YEAR" VARCHAR2(10 CHAR), 
	"ORG_CODE" VARCHAR2(10 CHAR), 
	"OFFENDER_NO" VARCHAR2(10 CHAR), 
	"RELEASE_FLAG" CHAR(1 CHAR), 
	"RELEASE_DATE" VARCHAR2(10 CHAR), 
	"CAUSE" VARCHAR2(1000 CHAR), 
	"LOGIN_ID" VARCHAR2(20 CHAR), 
	"KEY_DATE" DATE, 
	"UPDUSR" VARCHAR2(20 CHAR), 
	"UPDDTE" DATE, 
	"FLAGPROCESS" CHAR(1 CHAR), 
	"REMARKPROCESS" VARCHAR2(1000 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."WANTED_POLIS" ADD CONSTRAINT "WANTEDPOLIS2_PK" PRIMARY KEY ("WPSEQNO")
  USING INDEX  ENABLE;
  CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX03" ON "PIBICSDM2"."WANTED_POLIS" ("BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX04" ON "PIBICSDM2"."WANTED_POLIS" ("FIRST_NAME") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX05" ON "PIBICSDM2"."WANTED_POLIS" ("LAST_NAME") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX06" ON "PIBICSDM2"."WANTED_POLIS" ("ENG_FIRST_NAME") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX07" ON "PIBICSDM2"."WANTED_POLIS" ("ENG_LAST_NAME") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX1" ON "PIBICSDM2"."WANTED_POLIS" ("ID_NO") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX2" ON "PIBICSDM2"."WANTED_POLIS" ("SEX", "BIRTH_DATE") 
  ;
CREATE INDEX "PIBICSDM2"."WANTED_POLIS_IDX8" ON "PIBICSDM2"."WANTED_POLIS" ("ENG_MIDDLE_NAME") 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."WANTEDPOLIS2_PK" ON "PIBICSDM2"."WANTED_POLIS" ("WPSEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."WANTED_POLIS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."WANTED_POLIS" TO "DL_STAGING" WITH GRANT OPTION;
