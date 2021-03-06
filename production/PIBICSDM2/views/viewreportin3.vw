CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWREPORTIN3" ("YM", "WLCD", "REC") AS 
  SELECT   TO_CHAR (credte, 'yyyymm') AS ym, wlcd, COUNT (wlcd) AS rec
       FROM   watchlistlog
      WHERE   logflag = 'E' AND operref = '03'
   GROUP BY   TO_CHAR (credte, 'yyyymm'), wlcd ;
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VIEWREPORTIN3" TO "BIOSAADM";
