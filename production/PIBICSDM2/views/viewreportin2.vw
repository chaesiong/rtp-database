CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWREPORTIN2" ("YM", "WLCD", "REC") AS 
  WITH wllog
          AS (  SELECT   TO_CHAR (credte, 'yyyymm') AS ym,
                         wlcd,
                         reasoncd,
                         COUNT ( * ) AS rec
                  FROM   watchlistlog
                 WHERE   (reasoncd = '0042')
                         OR (reasoncd = '0043' AND logflag = 'E')
                           AND operref <> '03'
              GROUP BY   TO_CHAR (credte, 'yyyymm'), wlcd, reasoncd),
       wlc AS (  SELECT   ym, wlcd, COUNT ( * ) AS cnt
                   FROM   wllog
               GROUP BY   ym, wlcd)
   SELECT   ym, wlcd, cnt
     FROM   wlc ;
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VIEWREPORTIN2" TO "BIOSAADM";
