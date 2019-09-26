CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLINDICATECARD" ("WLCD", "SEQNO", "IDCCD", "IDCTNM", "DOCNO") AS 
  SELECT wlcd,
          seqno,
          a.idccd,
          b.idctnm,
          docno
     FROM wlindicatecard a, indicatecard b
    WHERE a.idccd = b.idccd(+);
