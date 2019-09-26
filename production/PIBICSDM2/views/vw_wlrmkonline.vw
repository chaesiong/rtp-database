CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLRMKONLINE" ("WLCD", "SEQNO", "REMK") AS 
  SELECT b.wlcd, seqno, remk
     FROM wlremark a, watchlist b
    WHERE a.wlcd = b.wlcd AND b.reasoncd <> '0076'
   UNION ALL
   SELECT lppcd wlcd, 0 seqno, REMARK remk FROM lostpassport;
