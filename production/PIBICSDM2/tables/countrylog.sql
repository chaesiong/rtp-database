CREATE TABLE "PIBICSDM2"."COUNTRYLOG" 
   (	"COUNTCD" CHAR(3 CHAR), 
	"COUNTTNM" VARCHAR2(60 CHAR), 
	"COUNTENM" VARCHAR2(60 CHAR), 
	"NATIONTNM" VARCHAR2(60 CHAR), 
	"NATIONENM" VARCHAR2(60 CHAR), 
	"CONTINENTCD" CHAR(2 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"ABBCOUNT" VARCHAR2(3 CHAR), 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"COUNTRYLOGID" NUMBER(5,0), 
	"VISAFLAG" VARCHAR2(1 CHAR), 
	"HEALTHCTL" VARCHAR2(1 CHAR), 
	"SALARY" NUMBER, 
	"COUNTCHNNM" NVARCHAR2(60)
   ) ;
  ALTER TABLE "PIBICSDM2"."COUNTRYLOG" ADD CONSTRAINT "COUNTRYLOG_PK" PRIMARY KEY ("COUNTRYLOGID")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."COUNTRYLOG_PK" ON "PIBICSDM2"."COUNTRYLOG" ("COUNTRYLOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."COUNTRYLOG" TO "BIOSAADM";
