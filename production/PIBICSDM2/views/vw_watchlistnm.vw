CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WATCHLISTNM" ("WLCD", "SEQNO", "WLTFIRSTNM", "WLTMIDDLENM", "WLTLASTNM", "WLEFIRSTNM", "WLEMIDDLENM", "WLELASTNM") AS 
  SELECT   wlcd,
            seqno,
            wltfirstnm,
            wltmiddlenm,
            wltlastnm,
            wlefirstnm,
            wlemiddlenm,
            wlelastnm
     FROM   watchlistnm ;
