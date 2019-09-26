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
