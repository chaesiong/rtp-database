CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VIEWREPORTIN1" ("YM", "OPERREF", "STS", "PERMIT", "REC") AS 
  SELECT   TO_CHAR (credte, 'yyyymm') AS ym,
              operref,
              sts,
              permit,
              COUNT ( * ) AS cnt
       FROM   watchlist
      WHERE   operref <> '03'
   GROUP BY   TO_CHAR (credte, 'yyyymm'),
              operref,
              sts,
              permit ;
