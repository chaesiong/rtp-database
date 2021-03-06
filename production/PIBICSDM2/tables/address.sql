CREATE TABLE "PIBICSDM2"."ADDRESS" 
   (	"ADDRESS_SEQNO" NUMBER, 
	"ADR" VARCHAR2(200 CHAR), 
	"ADRNO" VARCHAR2(20 CHAR), 
	"MOO" VARCHAR2(20 CHAR), 
	"SOI" VARCHAR2(200 CHAR), 
	"ROAD" VARCHAR2(200 CHAR), 
	"TMB_SEQNO" NUMBER, 
	"AMP_SEQNO" NUMBER, 
	"PV_SEQNO" NUMBER, 
	"ZIPCODE" CHAR(5 CHAR), 
	"TELNO" VARCHAR2(60 CHAR), 
	"FAXNO" VARCHAR2(60 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "PIBICSDM2"."ADDRESS" ADD CONSTRAINT "ADDRESS_PK" PRIMARY KEY ("ADDRESS_SEQNO")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "PIBICSDM2"."ADDRESS_PK" ON "PIBICSDM2"."ADDRESS" ("ADDRESS_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."ADDRESS" TO "BIOSAADM";
