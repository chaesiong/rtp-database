CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWREPORTIN3" ("YM", "WLCD", "REC") AS 
  SELECT   TO_CHAR (credte, 'yyyymm') AS ym, wlcd, COUNT (wlcd) AS rec
       FROM   watchlistlog
      WHERE   logflag = 'E' AND operref = '03'
   GROUP BY   TO_CHAR (credte, 'yyyymm'), wlcd ;
