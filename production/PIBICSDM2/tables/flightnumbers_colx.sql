CREATE TABLE "PIBICSDM2"."FLIGHTNUMBERS_COLX" 
   (	"FLIGHT_ID" VARCHAR2(30 CHAR), 
	"CARRIER_CODE" VARCHAR2(30 CHAR), 
	"FLIGHT_NUMBER" VARCHAR2(30 CHAR), 
	"IN_OUT" VARCHAR2(30 CHAR), 
	"LOCATION_NAME" VARCHAR2(30 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FLIGHTNUMBERS_COLX" TO "BIOSAADM";
