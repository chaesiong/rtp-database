CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLCARDONEONLINE" ("WLCD", "SEQNO", "IDCCD", "IDCENM", "IDCTNM", "DOCNO", "ISUDTE", "ISUPLACE", "ISUDTETXT") AS 
  SELECT a.wlcd,
          a.seqno,
          SUBSTR (a.idccd, 3) idccd,
          l.idcenm,
          l.idctnm,
          a.docno,
          a.isudte,
          a.isuplace,
          TO_CHAR (a.isudte, 'dd/mm/yyyy') AS isudtetxt
     FROM wlindicatecard a, watchlist b, indicatecard l
    WHERE a.wlcd = b.wlcd AND b.reasoncd <> '0076' AND a.idccd = l.idccd(+) and a.seqno = '0'
   UNION ALL
   SELECT lppcd wlcd,
          0 seqno,
          '01' idccd,
          'PASSPORT' idcenm,
          'หนังสือเดินทาง' idctnm,
          passportno docno,
          isupassportdte isudte,
          b.counttnm isuplace,
          TO_CHAR (a.isupassportdte, 'dd/mm/yyyy') AS isudtetxt
     FROM lostpassport a, country b
    WHERE a.isupassportplace = b.countcd(+);
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_WLCARDONEONLINE" TO "BIOSAADM";
