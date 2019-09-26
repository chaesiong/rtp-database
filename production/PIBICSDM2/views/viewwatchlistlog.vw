CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWWATCHLISTLOG" ("WLCD", "WATCHLISTLOGID", "LOGDTE") AS 
  SELECT   "WLCD", "WATCHLISTLOGID", "LOGDTE"
     FROM   (  SELECT   wlcd,
                        MAX (watchlistlogid) AS watchlistlogid,
                        MAX (logdte) AS logdte
                 FROM   watchlistlog
                WHERE   TO_DATE (logdte, 'dd/mm/yyyy') =
                           TO_DATE (SYSDATE, 'dd/mm/yyyy')
             GROUP BY   wlcd) ;
