CREATE TABLE "PIBICSDM2"."CARNATION" 
   (	"NATIONCD" CHAR(3 CHAR), 
	"COUNTTNM" VARCHAR2(60 CHAR), 
	"COUNTENM" VARCHAR2(60 CHAR), 
	"NATIONTNM" VARCHAR2(60 CHAR), 
	"NATIONENM" VARCHAR2(60 CHAR), 
	"CONTINENTCD" CHAR(2 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" VARCHAR2(30 CHAR), 
	"UPDDTE" DATE, 
	"ABBCOUNT" VARCHAR2(3 CHAR), 
	"VISAFLAG" VARCHAR2(1 CHAR), 
	"HEALTHCTL" VARCHAR2(1 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CARNATION" ADD CONSTRAINT "NATIONCD_PK" PRIMARY KEY ("NATIONCD")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."NATIONCD_PK" ON "PIBICSDM2"."CARNATION" ("NATIONCD") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CARNATION" TO "BIOSAADM";
