CREATE TABLE "PIBICSDM2"."MEXICANSTOLEN" 
   (	"PASSPORTNO" VARCHAR2(100 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."MEXICANSTOLEN" TO "BIOSAADM";
