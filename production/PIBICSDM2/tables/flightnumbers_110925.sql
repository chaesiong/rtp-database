CREATE TABLE "PIBICSDM2"."FLIGHTNUMBERS_110925" 
   (	"FLIGHTSEQNO" NUMBER, 
	"FLIGHTPREFIX" VARCHAR2(10 CHAR), 
	"FLIGHTNUMBER" VARCHAR2(10 CHAR), 
	"DEPT_SEQNO" NUMBER, 
	"ALLFLAG" CHAR(1 CHAR), 
	"CARDTYPE" CHAR(1 CHAR), 
	"FLIGHTSTARTDTE" TIMESTAMP (6), 
	"FLIGHTENDDTE" TIMESTAMP (6), 
	"ACTFLAG" VARCHAR2(10 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."FLIGHTNUMBERS_110925" TO "BIOSAADM";
