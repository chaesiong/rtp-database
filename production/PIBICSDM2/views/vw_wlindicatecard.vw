CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLINDICATECARD" ("WLCD", "SEQNO", "IDCCD", "IDCTNM", "DOCNO") AS 
  SELECT wlcd,
          seqno,
          a.idccd,
          b.idctnm,
          docno
     FROM wlindicatecard a, indicatecard b
    WHERE a.idccd = b.idccd(+);
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_WLINDICATECARD" TO "BIOSAADM";
