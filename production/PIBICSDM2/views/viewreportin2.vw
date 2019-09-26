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
