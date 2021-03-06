CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."V_WLINDICATECARD_PROD" ("WLCD", "SEQNO", "IDCCD", "DOCNO", "ISUDTE", "ISUPLACE") AS 
  SELECT "WLCD","SEQNO","IDCCD","DOCNO","ISUDTE","ISUPLACE"
     FROM pibics.WLINDICATECARD@pibics_prod;
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "DL_BORDERCONTROL";
  GRANT DELETE ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "DL_INTERFACE";
  GRANT INSERT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "DL_INTERFACE";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "DL_INTERFACE";
  GRANT UPDATE ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "DL_INTERFACE";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."V_WLINDICATECARD_PROD" TO "BIOSAADM";
