CREATE TABLE "PIBICSDM2"."ALLEGELOG" 
   (	"ALLEGECD" CHAR(4 CHAR), 
	"ALLEGETNM" VARCHAR2(60 CHAR), 
	"ALLEGEENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"LOGUSERID" CHAR(6 CHAR), 
	"LOGFLAG" CHAR(1 CHAR), 
	"LOGDTE" DATE, 
	"CHKPOINTNO" CHAR(3 CHAR), 
	"ALLEGELOGID" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."ALLEGELOG_PK" ON "PIBICSDM2"."ALLEGELOG" ("ALLEGELOGID") 
  ;
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ALLEGELOG" TO "BIOSAADM";
