CREATE TABLE "PIBICSDM2"."NTM2REF" 
   (	"NTM2INOUT_SEQNO" NUMBER, 
	"FWD_PAGE" VARCHAR2(3 CHAR), 
	"RELATION_CAR" CHAR(1 CHAR), 
	"INOUT_SEQNO" NUMBER
   ) ;
  CREATE UNIQUE INDEX "PIBICSDM2"."NTM2REF_PK" ON "PIBICSDM2"."NTM2REF" ("FWD_PAGE", "INOUT_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."NTM2REF" TO "BIOSAADM";
