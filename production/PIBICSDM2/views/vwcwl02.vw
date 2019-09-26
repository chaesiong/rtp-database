CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWCWL02" ("WLCD", "WLTLASTNM", "WLTFIRSTNM", "WLTMIDDLENM", "WLELASTNM", "WLEMIDDLENM", "WLEFIRSTNM", "EFSNDXNM", "EMSNDXNM", "ELSNDXNM", "NATIONCD", "BIRTHDTE", "TFSNDXNM", "TMSNDXNM", "TLSNDXNM", "SEX") AS 
  SELECT   a.wlcd,
            b.wltlastnm,
            b.wltfirstnm,
            b.wltmiddlenm,
            b.wlelastnm,
            b.wlemiddlenm,
            b.wlefirstnm,
            b.efsndxnm,
            b.emsndxnm,
            b.elsndxnm,
            b.nationcd,
            b.birthdte,
            b.tfsndxnm,
            b.tmsndxnm,
            b.tlsndxnm,
            a.sex
     FROM   watchlist a, watchlistnm b
    WHERE   a.wlcd = b.wlcd AND a.tdcd = '0002' AND a.wlcd LIKE 'S%'
            AND TO_CHAR (credte, 'yyyymmdd') BETWEEN '20100227'
                                                 AND  '20100715' ;
