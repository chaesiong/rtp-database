CREATE TABLE "PIBICSDM2"."FLIGHTNUMBERS_TEMP" 
   (	"ID" NUMBER, 
	"DATA" VARCHAR2(30 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FLIGHTNUMBERS_TEMP" TO "BIOSAADM";
