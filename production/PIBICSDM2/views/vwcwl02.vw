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
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VWCWL02" TO "BIOSAADM";
