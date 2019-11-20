CREATE TABLE "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" 
   (	"SCRIPT" VARCHAR2(416)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CONSTRAINT_SCRIPT_ORN" TO "BIOSAADM";
