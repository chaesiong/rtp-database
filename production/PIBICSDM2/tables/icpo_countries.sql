CREATE TABLE "PIBICSDM2"."ICPO_COUNTRIES" 
   (	"CODE" VARCHAR2(3 CHAR), 
	"EN" VARCHAR2(44 CHAR), 
	"ISO" VARCHAR2(3 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ICPO_COUNTRIES" TO "BIOSAADM";
