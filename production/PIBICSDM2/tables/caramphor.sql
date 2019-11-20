CREATE TABLE "PIBICSDM2"."CARAMPHOR" 
   (	"PROVINCECD" CHAR(3 CHAR), 
	"AMPHORCD" CHAR(3 CHAR), 
	"AMPHORTNM" VARCHAR2(60 CHAR), 
	"AMPHORENM" VARCHAR2(60 CHAR), 
	"ACTFLAG" CHAR(1 CHAR), 
	"UPDUSR" CHAR(6 CHAR), 
	"UPDDTE" DATE
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CARAMPHOR" TO "BIOSAADM";
