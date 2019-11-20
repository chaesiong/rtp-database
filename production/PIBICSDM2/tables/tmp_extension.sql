CREATE TABLE "PIBICSDM2"."TMP_EXTENSION" 
   (	"EXTID" NUMBER(20,0), 
	"DEPTCD" CHAR(5 CHAR), 
	"ORGCD" CHAR(4 CHAR), 
	"TRANSDTE" DATE, 
	"TRANSNO" VARCHAR2(20 CHAR), 
	"ELASTNM" VARCHAR2(60 CHAR), 
	"EFIRSTNM" VARCHAR2(60 CHAR), 
	"EMIDDLENM" VARCHAR2(60 CHAR), 
	"SEX" CHAR(1 CHAR), 
	"AGE" VARCHAR2(3 CHAR), 
	"BIRTHDTE" VARCHAR2(10 CHAR), 
	"BIRTHPLACE" VARCHAR2(60 CHAR), 
	"NATIONCD" CHAR(3 CHAR), 
	"PASSPORTNO" VARCHAR2(20 CHAR), 
	"PASSPORTDTE" DATE, 
	"PASSPORTISSUE" VARCHAR2(60 CHAR), 
	"PASSPORTEXPDTE" DATE, 
	"VISATYPECD" CHAR(4 CHAR), 
	"VISAEXPDTE" DATE, 
	"TRAVCD" CHAR(4 CHAR), 
	"CONVREGNO" VARCHAR2(20 CHAR), 
	"FROMCOUNTRY" VARCHAR2(60 CHAR), 
	"INDEPTCD" CHAR(5 CHAR), 
	"INDTE" DATE, 
	"TM6NO" VARCHAR2(15 CHAR), 
	"EXTDAY" VARCHAR2(3 CHAR), 
	"REASONEXTCD" CHAR(3 CHAR), 
	"ADDR" VARCHAR2(100 CHAR), 
	"ROAD" VARCHAR2(60 CHAR), 
	"DISTRICT" VARCHAR2(60 CHAR), 
	"CITY" VARCHAR2(60 CHAR), 
	"STATECD" CHAR(2 CHAR), 
	"TELENO" VARCHAR2(30 CHAR), 
	"RESULTSTATUS" CHAR(1 CHAR), 
	"WAITDTE" DATE, 
	"EXTEXPDTE" DATE, 
	"APPROVEDTE" DATE, 
	"STATUS" CHAR(1 CHAR), 
	"CREUSR" CHAR(6 CHAR), 
	"CREDTE" DATE, 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE, 
	"REASONREJECT" VARCHAR2(200 CHAR), 
	"WAITREMARK" VARCHAR2(200 CHAR), 
	"REASON" VARCHAR2(100 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."TMP_EXTENSION" ADD PRIMARY KEY ("EXTID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."SYS_C00207185" ON "PIBICSDM2"."TMP_EXTENSION" ("EXTID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."TMP_EXTENSION" TO "BIOSAADM";
