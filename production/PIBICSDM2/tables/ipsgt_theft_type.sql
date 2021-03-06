CREATE TABLE "PIBICSDM2"."IPSGT_THEFT_TYPE" 
   (	"CODE" VARCHAR2(3 CHAR), 
	"EN" VARCHAR2(100 CHAR)
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."IPSGT_THEFT_TYPE_PK" ON "PIBICSDM2"."IPSGT_THEFT_TYPE" ("CODE") 
  ;
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."IPSGT_THEFT_TYPE" TO "BIOSAADM";
